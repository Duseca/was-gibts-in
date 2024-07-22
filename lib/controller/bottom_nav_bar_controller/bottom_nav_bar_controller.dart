import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/Vouchers/vouchers.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/home/home.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/nearby_places/nearby_places.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/notifications/notifications.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/search/search.dart';

class BottomNavBarController extends GetxController {
  static final BottomNavBarController instance =
      Get.find<BottomNavBarController>();

  static const HOME = '/home';
  static const SEARCH = '/search';
  static const NEARBY_PLACES = '/nearby_places';
  static const COUPONS = '/coupons';
  static const NOTIFICATIONS = '/notifications';

  RxInt currentIndex = 0.obs;
  RxString currentRoute = '/home'.obs;

  Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
    HOME: GlobalKey<NavigatorState>(),
    SEARCH: GlobalKey<NavigatorState>(),
    NEARBY_PLACES: GlobalKey<NavigatorState>(),
    COUPONS: GlobalKey<NavigatorState>(),
    NOTIFICATIONS: GlobalKey<NavigatorState>(),
  };

  List<String> pageRoutes = [
    HOME,
    SEARCH,
    NEARBY_PLACES,
    COUPONS,
    NOTIFICATIONS,
  ];

  void getCurrentScreen(String currentPage, int index) {
    if (currentPage == currentRoute.value) {
      navigatorKeys[currentPage]!.currentState!.popUntil(
            (route) => route.isFirst,
          );
    } else {
      currentIndex.value = index;
      currentRoute.value = pageRoutes[index];
    }
  }

  Widget buildOffStageNavigator(String page) {
    return Obx(
      () => Offstage(
        offstage: currentRoute.value != page,
        child: PageNavigator(
          navigatorKey: navigatorKeys[page]!,
          page: page,
        ),
      ),
    );
  }

  Future<bool> onBackTap() async {
    final NavigatorState? currentState =
        navigatorKeys[currentRoute.value]?.currentState;

    if (currentState != null) {
      if (currentState.canPop()) {
        currentState.pop();
        return false;
      } else {
        if (currentIndex.value != 0) {
          getCurrentScreen(HOME, 0);
          return false;
        } else if (currentIndex.value != 1) {
          getCurrentScreen(SEARCH, 1);
          return false;
        } else if (currentIndex.value != 2) {
          getCurrentScreen(NEARBY_PLACES, 2);
          return false;
        } else if (currentIndex.value != 3) {
          getCurrentScreen(COUPONS, 3);
          return false;
        } else if (currentIndex.value != 4) {
          getCurrentScreen(NOTIFICATIONS, 4);
          return false;
        }
      }
    }
    return true;
  }
}

class PageNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String page;

  const PageNavigator({
    Key? key,
    required this.navigatorKey,
    required this.page,
  }) : super(key: key);

  final HOME = '/home';
  final SEARCH = '/search';
  final NEARBY_PLACES = '/nearby_places';
  final COUPONS = '/coupons';
  final NOTIFICATIONS = '/notifications';

  @override
  Widget build(BuildContext context) {
    Widget? child;

    if (page == HOME)
      child = Home();
    else if (page == SEARCH)
      child = Search();
    else if (page == NEARBY_PLACES)
      child = NearbyPlaces();
    else if (page == COUPONS)
      child = VouchersPage();
    else if (page == NOTIFICATIONS) child = Notifications();
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (_) => child!);
      },
    );
  }
}
