import 'package:get/get.dart';
import 'package:was_gibts_in/view/screens/launch/splash_screen.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: AppLinks.splash_screen,
      page: () => SplashScreen(),
    ),
  ];
}

class AppLinks {
  static const splash_screen = '/splash_screen';
}
