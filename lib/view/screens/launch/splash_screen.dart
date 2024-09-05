import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_images.dart';
import 'package:was_gibts_in/services/sharedpreference_service.dart';
import 'package:was_gibts_in/utils/shared_pref_keys.dart';
import 'package:was_gibts_in/view/screens/launch/on_boarding.dart';
import 'package:was_gibts_in/view/screens/location/request_location_permission.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

import '../../../controller/locationController.dart';
import '../bottom_nav_bar/bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenHandler();
  }

  void splashScreenHandler() {
    Timer(
      Duration(milliseconds: 2400),
      ()async {
       bool onBoardingComplete = await SharedPreferenceService.instance.getSharedPreferenceBool(SharedPrefKeys.onBoarding)??false;

       if(onBoardingComplete){
        Get.offAll(() => OnBoarding(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 400));
       }else{
         LocationController controller = Get.put(LocationController());

         Position position = await Geolocator.getCurrentPosition();
         controller.latitude = position.latitude;
         controller.longitude = position.longitude;
         if(controller.longitude!=null && controller.latitude!=null){
           Get.offAll(() => BottomNavBar(),
               transition: Transition.rightToLeft,
               duration: Duration(milliseconds: 400));
         }

        // Get.to(() =>RequestLocationPermission(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 400));
       }

      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            Assets.imagesLogo,
            height: 99,
          ),
          MyText(
            paddingTop: 24,
            textAlign: TextAlign.center,
            text: 'WAS GIBTS IN',
            size: 28,
            color: kSecondaryColor,
            weight: FontWeight.w600,
          ),
          MyText(
            paddingTop: 6,
            textAlign: TextAlign.center,
            text: 'Erlebe Deine Stadt neu',
            size: 12,
            color: kBlackColor,
            paddingBottom: 55,
          ),
          LinearPercentIndicator(
            lineHeight: 5.0,
            barRadius: Radius.circular(50),
            percent: 1.0,
            animationDuration: 2000,
            animation: true,
            padding: EdgeInsets.symmetric(horizontal: 80),
            backgroundColor: kLightGreyColor,
            progressColor: kSecondaryColor,
          ),
        ],
      ),
    );
  }
}
