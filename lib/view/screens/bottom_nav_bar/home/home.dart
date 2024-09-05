import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_fonts.dart';
import 'package:was_gibts_in/constants/app_images.dart';
import 'package:was_gibts_in/constants/app_sizes.dart';
import 'package:was_gibts_in/constants/app_styling.dart';
import 'package:was_gibts_in/controller/locationController.dart';
import 'package:was_gibts_in/data/response/status.dart';
import 'package:was_gibts_in/main.dart';
import 'package:was_gibts_in/view/Event/AllEvent_screen.dart';
import 'package:was_gibts_in/view/Event/EventDetailScreen.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/home/company_detail/company_detail.dart';
import 'package:was_gibts_in/view/screens/drawer/app_drawer.dart';
import 'package:was_gibts_in/view/widget/common_image_view_widget.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // Init firestore and geoFlutterFire
  final geo = GeoFlutterFire();
  final _firestore = FirebaseFirestore.instance;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    var collectionReference = _firestore.collection('locations');
    double radius = 15;
    String field = 'position';
    return DefaultTabController(
      length: 3,
      child: AppDrawer(
        child: Scaffold(
          body: NestedScrollView(
            physics: BouncingScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                GetBuilder<LocationController>(builder: (controller) {
                  switch (controller.loadStatus.status!) {
                    case Status.LOADING:
                      return _SliverAppBar(

                        status: Status.LOADING,
                        controller: controller,
                        anotherLocation: '',
                        temperature: controller.temp == null
                            ? 8
                            : controller.temp.toInt(),
                        weather: controller.description == null
                            ? 'Rainy'
                            : controller.description.toString(),
                        feelsLike: controller.feels_like == null
                            ? 20
                            : controller.feels_like.toInt(),
                        currentLocation: controller.cityName == null
                            ? 'Forchheim'
                            : controller.cityName.toString(),
                        weatherIcon: Assets.imagesRainyWeather,
                      );
                    case Status.ERROR:
                      return _SliverAppBar(
                        anotherLocation: '',
                        status: Status.ERROR,
                        controller: controller,
                        temperature: controller.temp == null
                            ? 8
                            : controller.temp.toInt(),
                        weather: controller.description == null
                            ? 'Rainy'
                            : controller.description.toString(),
                        feelsLike: controller.feels_like == null
                            ? 20
                            : controller.feels_like.toInt(),
                        currentLocation: controller.cityName == null
                            ? 'Forchheim'
                            : controller.cityName.toString(),
                        weatherIcon: Assets.imagesRainyWeather,
                      );
                    case Status.COMPLETED:
                      return _SliverAppBar(
                        status: Status.COMPLETED,
                        controller: controller,
                        anotherLocation: controller.anotherLocation,
                        temperature: controller.temp == null
                            ? 8
                            : controller.temp.toInt(),
                        weather: controller.description == null
                            ? 'Rainy'
                            : controller.description.toString(),
                        feelsLike: controller.feels_like == null
                            ? 20
                            : controller.feels_like.toInt(),
                        currentLocation: controller.cityName == null
                            ? 'Forchheim'
                            : controller.cityName.toString(),
                        weatherIcon: Assets.imagesRainyWeather,
                      );
                  }
                })
              ];
            },
            body: ListView(
              shrinkWrap: true,
              padding: AppSizes.DEFAULT_VERTICAL,
              physics: BouncingScrollPhysics(),
              children: [
                MyText(
                  paddingLeft: 20,
                  paddingRight: 20,
                  text: 'Find local business nearby easily!',
                  size: 24,
                  weight: FontWeight.w800,
                  paddingBottom: 23,
                ),
                GetBuilder<LocationController>(builder: (controller) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 9),
                    child: Row(
                      children: [
                        MyText(
                          text: "Was gibts in ",
                          size: 14,
                          weight: FontWeight.bold,
                          fontFamily: AppFonts.MONTSERRAT,
                          color: kTertiaryColor,
                        ),
                        MyText(
                          text: controller.anotherLocation == ''
                              ? controller.cityName ?? "Forchheim"
                              : controller.anotherLocation.length > 15
                                  ? controller.anotherLocation.substring(0, 15)
                                  : controller.anotherLocation,
                          maxLines: 1,
                          weight: FontWeight.w700,
                          textOverflow: TextOverflow.ellipsis,
                          color: kSecondaryColor,
                        ),
                        MyText(
                            text: "?",
                            size: 14,
                            weight: FontWeight.bold,
                            fontFamily: AppFonts.MONTSERRAT,
                            color: kTertiaryColor),
                        SizedBox(width: 20),
                      ],
                    ),
                  );
                }),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      height: 6,
                      width: 22,
                      decoration: AppStyling.INDICATOR,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    itemBuilder: (context, index) {
                      return _GastroCard();
                    },
                  ),
                ),
                MyText(
                  text: 'Companies of the day',
                  weight: FontWeight.bold,
                  paddingLeft: 20,
                  paddingBottom: 9,
                  paddingTop: 20,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      height: 6,
                      width: 22,
                      decoration: AppStyling.INDICATOR,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                GetBuilder<LocationController>(builder: (cont) {
                  // Create a geoFirePoint
                  GeoFirePoint center = geo.point(
                    latitude: cont.latitude,
                    longitude: cont.longitude,
                  );
                  Stream<List<DocumentSnapshot>> stream = geo
                      .collection(collectionRef: collectionReference)
                      .within(center: center, radius: radius, field: field);
                  return StreamBuilder<List<DocumentSnapshot>>(
                      stream: stream,
                      builder: (context,
                          AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              enabled: true,
                              child: Container(
                                height: 188,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                                width: double.infinity,
                              ),
                            ),
                          );
                        } else {
                          print("read First");
                          if(count==1){
                          cont.fullData = snapshot.data!;
                          }else{
                            if(mounted){
                            cont.addFullData(snapshot.data!);
                            }
                          }
                          count++;
                          List<DocumentSnapshot> dataList = snapshot.data!
                              .where((e) => e['type'] == "Company")
                              .toList();
                          // Shuffle the companyList
                          dataList.shuffle();
                          // Take the first 4 elements (randomly shuffled)
                          List<DocumentSnapshot> randomCompanyImages =
                              dataList.take(4).toList();
                          // Now randomCompanyImages contains 4 random images of companies
                          print(randomCompanyImages);
                          print("dataList $dataList");
                          return dataList.isEmpty
                              ? Center(
                                  child: MyText(
                                      text: "No Company at this location"))
                              : Column(
                                  children: [
                                    _CompaniesOfTheDay(
                                      data: randomCompanyImages,
                                    ),
                                  ],
                                );
                        }
                      });
                }),
                GetBuilder<LocationController>(builder: (cont) {
                  List<DocumentSnapshot> dataList = cont.fullData
                      .where((e) => e['type'] == "Company")
                      .toList();
                  dataList.shuffle();
                  List<DocumentSnapshot> randomCompanyImages =
                      dataList.take(4).toList();
                  return dataList.isEmpty
                      ? Center(
                          child: MyText(text: "No Events at this location"))
                      : Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      text: 'Events',
                                      weight: FontWeight.bold,
                                      paddingLeft: 20,
                                      paddingBottom: 9,
                                      paddingTop: 20,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      height: 6,
                                      width: 22,
                                      decoration: AppStyling.INDICATOR,
                                    ),
                                  ],
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => AllEventsScreen(
                                          data: randomCompanyImages,
                                        ));
                                  },
                                  child: MyText(
                                    text: "See all",
                                    size: 12,
                                    color: kSecondaryColor,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 20),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              height: 120,
                              child: ListView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                itemCount: cont.fullData.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(() => EventDetails(
                                            image: cont.fullData[index]
                                                ['image'],
                                          ));
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          cont.fullData[index]['image']
                                              .toString(),
                                          height: 150,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.65,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBar extends StatelessWidget {
  _SliverAppBar({
    required this.controller,
    required this.temperature,
    required this.weather,
    required this.feelsLike,
    required this.currentLocation,
    required this.weatherIcon,
    required this.status,
    required this.anotherLocation,
  });
  LocationController controller;
  Status status;
  final int temperature;
  final String weather;
  final int feelsLike;
  final String currentLocation;
  final String weatherIcon;
  String anotherLocation;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: kPrimaryColor,
      surfaceTintColor: kPrimaryColor,
      floating: true,
      pinned: true,
      centerTitle: true,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              ZoomDrawer.of(context)!.isOpen()
                  ? ZoomDrawer.of(context)!.close()
                  : ZoomDrawer.of(context)!.open();
            },
            child: Image.asset(
              Assets.imagesMenu,
              height: 12,
            ),
          ),
        ],
      ),
      title: MyText(
        text: 'Home',
        size: 16,
        weight: FontWeight.w600,
      ),
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      status == Status.LOADING
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              enabled: true,
                              child: Wrap(
                                children: [
                                  MyText(
                                    text: '18',
                                    size: 45,
                                    decoration: TextDecoration.lineThrough,
                                    weight: FontWeight.w500,
                                    color: kSecondaryColor,
                                  ),
                                  MyText(
                                    text: 'o',
                                    size: 18,
                                    weight: FontWeight.w500,
                                    color: kSecondaryColor,
                                  ),
                                ],
                              ))
                          : Wrap(
                              children: [
                                MyText(
                                  text: temperature.toString(),
                                  size: 45,
                                  weight: FontWeight.w500,
                                  color: kSecondaryColor,
                                ),
                                MyText(
                                  text: 'o',
                                  size: 18,
                                  weight: FontWeight.w500,
                                  color: kSecondaryColor,
                                ),
                              ],
                            )
                    ],
                  ),
                  status == Status.LOADING
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          enabled: true,
                          child: MyText(
                            paddingTop: 8,
                            text: weather,
                            size: 13,
                            decoration: TextDecoration.lineThrough,
                            color: kNavyBlueColor,
                            paddingBottom: 8,
                          ),
                        )
                      : MyText(
                          paddingTop: 8,
                          text: weather,
                          size: 13,
                          color: kGreyColor5,
                          paddingBottom: 8,
                        ),
                  status == Status.LOADING
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          enabled: true,
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              MyText(
                                text: 'Feels like 8',
                                size: 15,
                                decoration: TextDecoration.lineThrough,
                                color: kNavyBlueColor,
                              ),
                              MyText(
                                text: '°',
                                size: 15,
                                color: kNavyBlueColor,
                              ),
                            ],
                          ),
                        )
                      : Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: [
                            MyText(
                              text: 'Feels like $feelsLike',
                              size: 15,
                              color: kNavyBlueColor,
                            ),
                            MyText(
                              text: '°',
                              size: 15,
                              color: kNavyBlueColor,
                            ),
                          ],
                        ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: kLightGreyColor2,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  MyText(
                    paddingTop: 8,
                    text: 'Your location',
                    size: 13,
                    color: kGreyColor5,
                    paddingBottom: 8,
                  ),
                  status == Status.LOADING
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          enabled: true,
                          child: MyText(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   CustomPageRoute(
                              //     page: ChangeLocation(),
                              //   ),
                              // );
                            },
                            text: currentLocation,
                            size: 18,
                            weight: FontWeight.w600,
                            color: kNavyBlueColor,
                            paddingBottom: 15,
                          ))
                      : StatefulBuilder(builder: (context, changeState) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: MyText(
                              onTap: () {},
                              text: anotherLocation == ''
                                  ? currentLocation
                                  : anotherLocation.length > 15
                                      ? anotherLocation.substring(0, 15)
                                      : anotherLocation,
                              size: 18,
                              textOverflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              weight: FontWeight.w600,
                              color: kNavyBlueColor,
                              paddingBottom: 15,
                            ),
                          );
                        }),
                ],
              ),
              Positioned(
                right: -60,
                bottom: 0,
                child: Container(
                  height: 208,
                  width: 208,
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kLightBlueColor.withOpacity(0.12),
                  ),
                  child: Center(
                    child: Image.asset(
                      weatherIcon,
                      height: 92,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GastroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: 294,
      margin: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 6,
      ),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xffF8F6F6),
        boxShadow: [
          BoxShadow(
            color: kBlackColor.withOpacity(0.1),
            offset: Offset(0, 1),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  weight: FontWeight.bold,
                  text: 'Optimize your Gastro!',
                  paddingBottom: 6,
                ),
                MyText(
                  text: 'GASTROMIZE'.toUpperCase(),
                  size: 12,
                  color: kGreyColor,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          CommonImageView(
            height: Get.height,
            width: 91,
            radius: 4,
            imagePath: Assets.imagesGastro,
          ),
        ],
      ),
    );
  }
}

class _CompaniesOfTheDay extends StatefulWidget {
  var data;
  _CompaniesOfTheDay({this.data});
  @override
  State<_CompaniesOfTheDay> createState() => _CompaniesOfTheDayState();
}

class _CompaniesOfTheDayState extends State<_CompaniesOfTheDay> {
  final _pageController = PageController();

  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 188,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) => _onPageChanged(index),
        physics: BouncingScrollPhysics(),
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          var data = widget.data[index];
          // widget.data!.docs[index].data() as Map<String, dynamic>;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                Get.to(
                  () => CompanyDetail(
                    data: data,
                  ),
                );
              },
              child: Stack(
                children: [
                  CommonImageView(
                    height: Get.height,
                    width: Get.height,
                    radius: 12,
                    url: data['image'],
                  ),
                  Container(
                    height: Get.height,
                    width: Get.height,
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kBlackColor.withOpacity(0.3),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CommonImageView(
                              height: 32,
                              width: 32,
                              url: dummyImg,
                              radius: 100.0,
                            ),
                            Expanded(
                              child: MyText(
                                paddingLeft: 11,
                                text: data['name'],
                                color: kPrimaryColor,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: kSecondaryColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: MyText(
                                text: 'Sports',
                                size: 8,
                                weight: FontWeight.w600,
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              Assets.imagesLocationPin,
                              height: 20,
                            ),
                            Expanded(
                              flex: 7,
                              child: MyText(
                                paddingLeft: 2,
                                color: kPrimaryColor,
                                size: 9,
                                weight: FontWeight.w600,
                                text: 'bere Koenigstrasse 31, 96052 Bamberg',
                              ),
                            ),
                            Row(
                              children: List.generate(
                                4,
                                (index) {
                                  return AnimatedContainer(
                                    duration: Duration(
                                      milliseconds: 180,
                                    ),
                                    height: 6,
                                    margin: EdgeInsets.symmetric(horizontal: 2),
                                    width: _currentIndex == index ? 24 : 6,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: _currentIndex == index
                                          ? kSecondaryColor
                                          : kPrimaryColor,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

const primaryColor = Color(0xff7BC2FF);
