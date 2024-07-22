import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_fonts.dart';
import 'package:was_gibts_in/constants/app_images.dart';
import 'package:was_gibts_in/controller/locationController.dart';
import 'package:was_gibts_in/controller/searchController.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/nearby_places/nearby_places_bottom_sheet.dart';
import 'package:was_gibts_in/view/setting/Setting.dart';
import 'package:was_gibts_in/view/widget/common_image_view_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'dart:ui' as ui;

class NearbyPlaces extends StatefulWidget {
  NearbyPlaces({super.key});

  @override
  State<NearbyPlaces> createState() => _NearbyPlacesState();
}

class _NearbyPlacesState extends State<NearbyPlaces> {
  ScrollController controller = ScrollController();
  Uint8List? byteImage;
  LatLng? currentLatLang;
  var imageList = [
    "assets/images/person4.png",
    "assets/images/hair_dresser.png",
  ];
  PanelController panelController = PanelController();
  BitmapDescriptor bitmapDescriptor = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentDescriptor = BitmapDescriptor.defaultMarker;
  Set<Marker> marker = {};
  Map<String, dynamic> data1 = {
    "id": MarkerId("1"),
    "global": GlobalKey(),
    "widget": Container(
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.7), shape: BoxShape.circle),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
            size: 15,
          ),
        ),
      ),
    )
  };
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _generateMarker();
    // });
    _createCustomMarker();
  }

  Future<void> _generateMarker() async {
    LocationController cont = Get.put(LocationController());
    RenderRepaintBoundary boundary = data1["global"]
        .currentContext!
        .findRenderObject() as RenderRepaintBoundary;

    // Ensure that the boundary is actually ready before capturing the image
    if (boundary.debugNeedsPaint) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _generateMarker();
      });
      return;
    }
    print("Call shwa ka naa");
    ui.Image image = await boundary.toImage(pixelRatio: 2.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    var mark = Marker(
      markerId: data1['id'],
      position: LatLng(cont.latitude, cont.longitude),
      icon: BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List()),
    );
    //marker.clear();
    marker = {mark};
    //marker.add(mark);
    LocationController control = Get.put(LocationController());
    control.changeLoading(true);
    print("whats ${control.isLoading}");
  }

  bool isLoading = false;
  _createCustomMarker() async {
    for (int i = 0; i < imageList.length; i++) {
      await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(),
        imageList[i],
      ).then((value) {
        if (i == 0) {
          currentDescriptor = value;
        }
        bitmapDescriptor = value;
      });
    }
    setState(() {});
  }

  // Init firestore and geoFlutterFire
  final geo = GeoFlutterFire();
  final _firestore = FirebaseFirestore.instance;
  var i = 0;
  TextEditingController searchFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // var collectionReference = _firestore.collection('locations');
    double radius = 15;
    // String field = 'position';
    return Scaffold(
      body: GetBuilder<LocationController>(
        builder: (controller) {
          currentLatLang = LatLng(controller.latitude, controller.longitude);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _generateMarker();
          });
          //  marker = {
          //     Marker(
          //       markerId: MarkerId("current"),
          //       icon: currentDescriptor,
          //       position: LatLng(controller.latitude, controller.longitude),
          //       infoWindow: InfoWindow(title: "current"),
          //     )
          //   };
          var minimumValue = 15.0;
          LatLng? nearLatLang;
          for (int i = 0; i < controller.fullData.length; i++) {
            var data = controller.fullData[i];
            GeoPoint endpoints = data["position"]["geopoint"];
            var distance = Geolocator.distanceBetween(
                    controller.latitude,
                    controller.longitude,
                    endpoints.latitude,
                    endpoints.longitude) /
                1000;
            if (distance < radius && distance <= minimumValue) {
              minimumValue = distance;
              nearLatLang = LatLng(endpoints.latitude, endpoints.longitude);
            }
            marker.add(Marker(
                markerId: MarkerId("$i"),
                icon: bitmapDescriptor,
                position: LatLng(endpoints.latitude, endpoints.longitude),
                infoWindow: InfoWindow(title: "$i")));
          }

          return SlidingUpPanel(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            maxHeight: MediaQuery.of(context).size.height * 0.8,
            minHeight: MediaQuery.of(context).size.height * 0.11,
            panelBuilder: (sc) => NearbyBottomSheet(
              controller: sc,
              searchController: searchFieldController,
              dataList: controller.fullData,
            ),
            body: Stack(
              children: [
                controller.isLoading
                    ? GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target:
                              LatLng(controller.latitude, controller.longitude),
                          zoom: 14.4746,
                        ),
                        onMapCreated: (controllers) async {
                          print("map controller call");
                          controller.googleMapController.complete(controllers);
                        },
                        onTap: (argument) {
                          var now = DateTime.now();
                          var time = DateFormat.Hm().format(now);
                          i++;
                          print(argument);
                          var docId = DateTime.now().microsecondsSinceEpoch;
                          GeoFirePoint myLocation = geo.point(
                              latitude: argument.latitude,
                              longitude: argument.longitude);
                          _firestore
                              .collection('locations')
                              .doc(docId.toString())
                              .set({
                            'name': 'mudassir $i',
                            "type": "Company",
                            "companyName": "ITZON",
                            "image":
                                "https://img.freepik.com/free-photo/restaurant-interior_1127-3394.jpg",
                            "cityName": "iran",
                            'profileImage':
                                "https://img.freepik.com/free-photo/restaurant-interior_1127-3394.jpg",
                            'position': myLocation.data,
                            "docId": docId.toString(),
                            "time": {
                              "Monday": {
                                "openingTime": time,
                                "closingTime": "24:00"
                              },
                              "Tuesday": {
                                "openingTime": time,
                                "closingTime": "18:30"
                              },
                              "Wednesday": {
                                "openingTime": time,
                                "closingTime": "19:30"
                              },
                              "Thursday": {
                                "openingTime": time,
                                "closingTime": "20:30"
                              },
                              "Friday": {
                                "openingTime": time,
                                "closingTime": "21:30"
                              },
                              "Saturday": {
                                "openingTime": time,
                                "closingTime": "17:30"
                              },
                              "Sunday": {
                                "openingTime": time,
                                "closingTime": "21:00"
                              },
                            }
                          });
                        },
                        markers: marker,
                        polylines: {
                            Polyline(
                              polylineId: PolylineId("current"),
                              color: Colors.blue,
                              width: 5,
                              points: [
                                if (currentLatLang != null &&
                                    nearLatLang != null) ...[
                                  currentLatLang!,
                                  nearLatLang,
                                ],
                              ],
                              geodesic: true,
                              jointType: JointType.mitered,
                              patterns: [
                                PatternItem.dash(25.0),
                                PatternItem.gap(10)
                              ],
                            ),
                          })
                    : Transform.translate(
                        offset: Offset(MediaQuery.of(context).size.width,
                            MediaQuery.of(context).size.height),
                        child: RepaintBoundary(
                          key: data1['global'],
                          child: data1['widget'],
                        )),
                GetBuilder<LocationController>(builder: (controller) {
                  return _BuildSettingsTile(
                    name: controller.cityName,
                    secondName: controller.anotherLocation,
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _BuildUserMarker extends StatelessWidget {
  const _BuildUserMarker({
    required this.image,
    required this.radius,
  });
  final String image;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: kBlackColor.withOpacity(0.25),
              offset: Offset(0, 1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: CommonImageView(
            height: Get.height,
            width: Get.width,
            radius: 100.0,
            url: image,
          ),
        ),
      ),
    );
  }
}

class _BuildSettingsTile extends StatelessWidget {
  String? name;
  String secondName;
  _BuildSettingsTile({this.name, this.secondName = ''});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 20,
      right: 20,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(3),
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: kTertiaryColor.withOpacity(0.38),
              ),
              child: Row(
                children: [
                  Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: kSecondaryColor,
                          width: 2.0,
                        ),
                      ),
                      child: Image.asset(
                        "assets/images/hair_dresser.png",
                        fit: BoxFit.cover,
                      )
                      //  CommonImageView(
                      //   height: Get.height,
                      //   width: Get.width,
                      //   url: dummyImg,
                      //   radius: 100.0,
                      // ),
                      ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: AppFonts.MONTSERRAT,
                          color: kPrimaryColor,
                        ),
                        children: [
                          TextSpan(
                            text: 'in ',
                          ),
                          TextSpan(
                            text: secondName == ''
                                ? name
                                : secondName.length > 15
                                    ? secondName.substring(0, 15)
                                    : secondName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => SettingScreen());
            },
            child: Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: kSecondaryColor,
                  width: 2.0,
                ),
                color: kTertiaryColor.withOpacity(0.38),
              ),
              child: Center(
                child: Image.asset(
                  Assets.imagesSettings,
                  height: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonImageView(
      height: Get.height,
      width: Get.width,
      imagePath: Assets.imagesDummyMap,
    );
  }
}
