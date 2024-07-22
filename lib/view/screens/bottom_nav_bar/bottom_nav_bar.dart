import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_images.dart';
import 'package:was_gibts_in/controller/bottom_nav_bar_controller/bottom_nav_bar_controller.dart';
import 'package:was_gibts_in/controller/locationController.dart';
import 'package:was_gibts_in/utils/getx_controller_instances.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Map<String, dynamic>> _items = [
    {
      'icon': Assets.imagesHome,
      'title': 'Home',
    },
    {
      'icon': Assets.imagesSearch,
      'title': 'Search',
    },
    {
      'icon': Assets.imagesSearch,
      'title': '',
    },
    {
      'icon': Assets.imagesPercentCircle,
      'title': 'Coupons',
    },
    {
      'icon': Assets.imagesNotification,
      'title': 'Notification',
    },
  ];
   LocationController controller = Get.put(LocationController());
   @override
  void initState() {
    super.initState();
    controller.getCurrentWeather(controller.latitude,controller.longitude);
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool value = await navBarController.onBackTap();
        return value;
      },
      child: Scaffold(
        body: Stack(
          children: [
            navBarController.buildOffStageNavigator(
              BottomNavBarController.HOME,
            ),
            navBarController.buildOffStageNavigator(
              BottomNavBarController.SEARCH,
            ),
            navBarController.buildOffStageNavigator(
              BottomNavBarController.NEARBY_PLACES,
            ),
            navBarController.buildOffStageNavigator(
              BottomNavBarController.COUPONS,
            ),
            navBarController.buildOffStageNavigator(
              BottomNavBarController.NOTIFICATIONS,
            ),
          ],
        ),
        bottomNavigationBar: _buildBottomNavBar(),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Obx(
      () {
        return Container(
          height: 71,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            boxShadow: [
              BoxShadow(
                color: kBlackColor.withOpacity(0.25),
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: BottomNavigationBar(
            elevation: 0,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            backgroundColor: Colors.transparent,
            currentIndex: navBarController.currentIndex.value,
            onTap: (index) => navBarController.getCurrentScreen(
                navBarController.pageRoutes[index], index),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: kSecondaryColor,
            unselectedItemColor: Color(0xff737479).withOpacity(0.59),
            items: List.generate(
              _items.length,
              (index) {
                return BottomNavigationBarItem(
                  icon: index == 2
                      ? GestureDetector(
                          onTap: () {
                            navBarController.getCurrentScreen(
                              navBarController.pageRoutes[2],
                              2,
                            );
                          },
                          child: Container(
                            height: 52,
                            width: 52,
                            decoration: BoxDecoration(
                              color: Color(0xff1990F6),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: kSecondaryColor,
                                  offset: Offset(0, 2),
                                  blurRadius: 7,
                                  spreadRadius: 3,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Container(
                                height: Get.height,
                                width: Get.width,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: kSecondaryColor,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    Assets.imagesCenterIcon,
                                    height: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : AnimatedSwitcher(
                          duration: Duration(
                            milliseconds: 180,
                          ),
                          reverseDuration: Duration(
                            milliseconds: 180,
                          ),
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: navBarController.currentIndex.value == index
                              ? Column(
                                  key: Key(navBarController.currentIndex.value
                                      .toString()),
                                  children: [
                                    MyText(
                                      text: _items[index]['title'],
                                      size: 10,
                                      weight: FontWeight.w600,
                                      color: kSecondaryColor,
                                      paddingBottom: 5,
                                    ),
                                    Container(
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kSecondaryColor,
                                      ),
                                    ),
                                  ],
                                )
                              : ImageIcon(
                                  key: Key(navBarController.currentIndex.value
                                      .toString()),
                                  AssetImage(
                                    _items[index]['icon'],
                                  ),
                                  size: 24,
                                ),
                        ),
                  label: '',
                );
              },
            ),
          ),
        );
      },
    );
  }
}
