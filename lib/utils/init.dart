import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:was_gibts_in/controller/bottom_nav_bar_controller/bottom_nav_bar_controller.dart';
import 'package:was_gibts_in/main.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(BottomNavBarController());
 // Lock orientation to portrait
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
  //runApp(MyApp());
}
