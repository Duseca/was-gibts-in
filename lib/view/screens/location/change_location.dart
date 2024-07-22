import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_fonts.dart';
import 'package:was_gibts_in/constants/app_images.dart';
import 'package:was_gibts_in/constants/app_sizes.dart';
import 'package:was_gibts_in/controller/locationController.dart';
import 'package:was_gibts_in/controller/searchController.dart';
import 'package:was_gibts_in/data/response/api_response.dart';
import 'package:was_gibts_in/main.dart';
import 'package:was_gibts_in/view/screens/drawer/app_drawer.dart';
import 'package:was_gibts_in/view/widget/common_image_view_widget.dart';
import 'package:was_gibts_in/view/widget/custom_appbar_widget.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class ChangeLocation extends StatefulWidget {
  const ChangeLocation({super.key});

  @override
  State<ChangeLocation> createState() => _ChangeLocationState();
}

class _ChangeLocationState extends State<ChangeLocation> {
  var _controller = TextEditingController();
  // var uuid = new Uuid();
  // String _sessionToken = '1234567890';
  // List<dynamic> _placeList = [];
  // int i = 0;
  @override
  void initState() {
    super.initState();
    // _controller.addListener(() {
    //  // _onChanged();
    // });
  }

  // _onChanged() {
  //   getSuggestion(_controller.text);
  // }

  // void getSuggestion(String input) async {
  //   String kPLACES_API_KEY = "AIzaSyBf4K14YIo0ADPPB-otXi6TGUQQCMYb43o";
  //   String type = '(regions)';
  //   try {
  //     String baseURL =
  //         'https://maps.googleapis.com/maps/api/place/autocomplete/json';
  //     String request =
  //         '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';
  //     var response = await http.get(Uri.parse(request));
  //     var data = json.decode(response.body);
  //     print('mydata');
  //     print(data);
  //     if (response.statusCode == 200) {
  //       setState(() {
  //         _placeList = json.decode(response.body)['predictions'];
  //       });
  //     } else {
  //       throw Exception('Failed to load predictions');
  //     }
  //   } catch (e) {
  //     // toastMessage('success');
  //   }
  // }
  var lat;
  LocationController controller = Get.put(LocationController());
  SearchGetController searchController = Get.put(SearchGetController());
  var finalList = [];
  @override
  Widget build(BuildContext context) {
    searchController.searchLocation= '';
    final Stream<QuerySnapshot> locations =
        FirebaseFirestore.instance.collection('location2').snapshots();
    final _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 1.0,
        color: kSecondaryColor,
      ),
    );
    return AppDrawer(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Change location',
        ),
        body: ListView(
          padding: AppSizes.DEFAULT_PADDING,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            MyText(
              paddingTop: 8,
              text: 'Your location',
              size: 13,
              color: kGreyColor5,
              paddingBottom: 15,
            ),
            GetBuilder<LocationController>(builder: (controller) {
              return Row(
                children: [
                  Stack(
                    children: [
                      CommonImageView(
                        height: 48,
                        width: 48,
                        radius: 100.0,
                        url: dummyClub,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 2,
                        child: Image.asset(
                          Assets.imagesOnline,
                          height: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: AppFonts.MONTSERRAT,
                          color: kBlackColor,
                        ),
                        children: [
                          TextSpan(
                            text:controller.anotherLocation==""?
                                controller.placemarks.last.locality.toString():controller.anotherLocation,
                          ),
                          TextSpan(
                            text:controller.anotherLocation==""?
                                ' ${controller.placemarks.last.country.toString()}':"",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
            MyText(
              paddingTop: 30,
              text: 'Change location',
              size: 13,
              weight: FontWeight.w600,
              color: kGreyColor5,
              paddingBottom: 8,
            ),
            TextFormField(
              onChanged: (value) {
                searchController.changeLocationSearch(value);
              },
              controller: _controller,
              style: TextStyle(
                fontSize: 12,
                color: kBlackColor.withOpacity(0.37),
              ),
              decoration: InputDecoration(
                hintText: 'Search Location...',
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: kBlackColor.withOpacity(0.37),
                ),
                suffixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.imagesSearch,
                      height: 24,
                      color: kBlackColor.withOpacity(0.37),
                    ),
                  ],
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                border: _border,
                enabledBorder: _border,
                focusedBorder: _border,
                errorBorder: _border,
                focusedErrorBorder: _border,
              ),
            ),
            MyText(
              paddingTop: 30,
              text: 'All locations',
              size: 13,
              weight: FontWeight.w600,
              paddingBottom: 15,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: locations,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                   if(snapshot.connectionState==ConnectionState.waiting){
                       return Center(child: CircularProgressIndicator(),);
                   }else if(snapshot.hasError){
                    return Center(child: Text("Something went wrong"),);
                   
                   } else{
                     return snapshot.data!.docs.isEmpty
                        ? Center( 
                            child: Text("no Location"),
                          )
                          
                        : GetBuilder<SearchGetController>(
                          builder: (control){
                           var list=  snapshot.data!.docs.where((element) => element['name'].toLowerCase().contains(control.searchLocation.toLowerCase())).toList();
                          finalList =control.searchLocation==''?snapshot.data!.docs : list ;
                            return ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: BouncingScrollPhysics(),
                                itemCount:finalList.length,
                                itemBuilder: (context, index) {
                                 lat = finalList[index]['name'].length>15?finalList[index]['name'].substring(0,15):finalList[index]['name'];
                                 print("lat $lat");
                                  return _LocationTile(
                                    image: dummyClub,
                                    isSelected: false,
                                    title: finalList[index]['name']
                                        .toString(),
                                      controller: controller,
                                      name: lat,  
                                    onSelect: () async {
                                      LocationController cont = Get.put(LocationController());
                                      cont.changeLoading(false);
                                      controller.anotherLocation =finalList[index]['name'].toString();
                                       
                                      print(controller.anotherLocation);
                                      Navigator.pop(context);
                                      controller
                                          .setLoadStatus(ApiResponse.loading());
                                      await getLocation(
                                        double.parse(finalList[index]['lat'].toString()),
                                        double.parse(finalList[index]['long'].toString()),
                                        controller,
                                      );
                                    },
                                  );
                                },
                              );
                          }
                        );
                   
                   } 
                }),
          ],
        ),
      ),
    );
  }

  getLocation(double lat, lng, LocationController controller) async {
    try {
      controller.changeLatLng(lat, lng, 0);
      await controller.changeLocation(lat, lng);
    } catch (e) {
      controller.setLoadStatus(ApiResponse.loading());
      print("Unexpected error: $e");
    }
  }
}

class _LocationTile extends StatelessWidget {
   _LocationTile({
    required this.image,
    required this.title,
    required this.onSelect,
    required this.isSelected,
   required this.controller,
   required this.name
  });
  final String image, title;
  final VoidCallback onSelect;
  final bool isSelected;
 String name;
 LocationController controller;
  @override
  Widget build(BuildContext context) {
    var name2 = controller.anotherLocation.length>15?controller.anotherLocation.substring(0,15):controller.anotherLocation;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        onTap: onSelect,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 31,
              width: 31,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: kSecondaryColor,
                ),
              ),
              child: CommonImageView(
                height: Get.height,
                width: Get.width,
                radius: 100.0,
                url: image,
              ),
            ),
            Expanded(
              child: MyText(
                paddingLeft: 10,
                text: title,
                size: 12,
                weight: FontWeight.w500,
                color: kTertiaryColor,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: kSecondaryColor,
                    width: 1.2,
                  ),
                ),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.all(2),
                    height: Get.height,
                    width: Get.width,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: name == name2 ? kSecondaryColor : Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
