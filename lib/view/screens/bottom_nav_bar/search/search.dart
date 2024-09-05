import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_fonts.dart';
import 'package:was_gibts_in/constants/app_images.dart';
import 'package:was_gibts_in/constants/app_sizes.dart';
import 'package:was_gibts_in/constants/app_styling.dart';
import 'package:was_gibts_in/controller/locationController.dart';
import 'package:was_gibts_in/controller/searchController.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/search/search_restaurants.dart';
import 'package:was_gibts_in/view/screens/drawer/app_drawer.dart';
import 'package:was_gibts_in/view/widget/custom_appbar_widget.dart';
import 'package:was_gibts_in/view/widget/custom_tab_indicator_widget.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _currentTab = 0;

  final List<String> _tabs = [
    'Restaurants',
    'Shops',
  ];

  // final List<Widget> _tabBarView = [
  //   SearchRestaurants(
  //   ),
  //   Container(),
  // ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTab = _tabController.index;
      });
    });
  }

  TextEditingController searchController = TextEditingController();
  String tapValue = '';
  @override
  Widget build(BuildContext context) {
    SearchGetController searchGetController = Get.put(SearchGetController());
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
            title: 'Search',
          ),
          body: ListView(
            padding: AppSizes.DEFAULT_PADDING,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        //  filterList(value);
                        searchGetController.changeSearch(searchController.text);
                        // setState(() {});
                        // var c = locationController.companyDetails.where((e)=> e['companyName'].toLowerCase().constants(value.toLowerCase())).toList();
                        // print("c: ${c.length.toString()}");
                      },
                      controller: searchController,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: kBlackColor.withOpacity(0.37),
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: kBlackColor.withOpacity(0.37),
                        ),
                        prefixIcon: Column(
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
                  ),
                  SizedBox(width: 5),
                  PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: "Restaurant",
                        child: Text("Restaurant"),
                      ),
                      PopupMenuItem(
                        value: "Gym",
                        child: Text("Gym"),
                      ),
                      PopupMenuItem(
                        value: "Company",
                        child: Text("Company"),
                      ),
                    ],
                    onSelected: (value) {
                      setState(() {});
                      searchGetController.changeSearch(searchController.text);
                      searchGetController.changeType( value);
                      tapValue = value;
                      print("Value : $value");
                      print("hi");
                    },
                    onOpened: () {
                      print("Value");
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(2),
                          height: 46,
                          width: 46,
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                            child: Image.asset(
                              Assets.imagesFilter,
                              height: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              // TabBar(
              //   isScrollable: true,
              //   padding: EdgeInsets.only(right: 25),
              //   physics: BouncingScrollPhysics(),
              //   indicatorSize: TabBarIndicatorSize.label,
              //   labelPadding: EdgeInsets.only(right: 25),
              //   indicator: CustomTabIndicator(
              //     color: kSecondaryColor,
              //     height: 6,
              //     horizontalRadius: 50,
              //     indicatorWidth: 30,
              //   ),
              //   controller: _tabController,
              //   labelColor: kTertiaryColor,
              //   unselectedLabelColor: kGreyColor3,
              //   labelStyle: TextStyle(
              //     fontSize: 14,
              //     fontWeight: FontWeight.bold,
              //     fontFamily: AppFonts.MONTSERRAT,
              //   ),
              //   unselectedLabelStyle: TextStyle(
              //     fontSize: 14,
              //     fontWeight: FontWeight.w600,
              //     fontFamily: AppFonts.MONTSERRAT,
              //   ),
              //   tabs: List.generate(
              //     _tabs.length,
              //     (index) {
              //       return Padding(
              //         padding: const EdgeInsets.only(bottom: 12),
              //         child: Align(
              //           alignment: Alignment.topLeft,
              //           child: Text(
              //             _tabs[index],
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        paddingTop: 20,
                        text: tapValue == "" ? 'NearBy' : tapValue,
                        size: 14.sp,
                        weight: FontWeight.w600,
                        paddingBottom: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 6,
                            width: 22,
                            decoration: AppStyling.INDICATOR,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 30,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        paddingTop: 20,
                        text: tapValue == "" ? 'Random' : tapValue,
                        size: 14.sp,
                        weight: FontWeight.w600,
                        paddingBottom: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 6,
                            width: 22,
                            decoration: AppStyling.INDICATOR,
                          ),
                        ],
                      ),
                    ],
                  ),

                ],
              ),


              SizedBox(
                height: 15,
              ),
              GetBuilder<LocationController>(builder: (locationController) {
                if (searchGetController.type == '') {
                  searchGetController.companyDetails =
                      locationController.fullData;
                }else{
                searchGetController.companyDetails = locationController.fullData
                    .where((element) =>
                        element['type'] == searchGetController.type)
                    .toList();
                }
                return GetBuilder<SearchGetController>(builder: (controller) {
                  return locationController.fullData.isEmpty
                      ? Center(
                          child: Text("no data"),
                        )
                      : StatefulBuilder(builder: (context, changeState) {
                          return SearchRestaurants(
                              filterList: controller.searchController == null||controller.searchController==''
                                  ? controller.companyDetails
                                  : controller.filteredDetail);
                        });
                });
              }),
            ],
          )),
    );
  }
}

class RestaurantClass {
  String? image;
  String? name;

  RestaurantClass({this.image, this.name});
}

final originalList = [
  RestaurantClass(name: "pizza", image: "assets/images/pizza.jpg"),
  RestaurantClass(name: "pizza", image: "assets/images/pizza.jpg"),
  RestaurantClass(name: "pizza", image: "assets/images/pizza.jpg"),
  RestaurantClass(name: "pizza", image: "assets/images/pizza.jpg"),
  RestaurantClass(name: "pizza", image: "assets/images/pizza.jpg"),
  RestaurantClass(name: "burger", image: "assets/images/burger.png"),
  RestaurantClass(name: "burger", image: "assets/images/burger.png"),
  RestaurantClass(name: "burger", image: "assets/images/burger.png"),
  RestaurantClass(name: "burger", image: "assets/images/burger.png"),
  RestaurantClass(name: "burger", image: "assets/images/burger.png"),
];
