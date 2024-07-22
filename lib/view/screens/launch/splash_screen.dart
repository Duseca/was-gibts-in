import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_images.dart';
import 'package:was_gibts_in/view/screens/launch/on_boarding.dart';
import 'package:was_gibts_in/view/screens/location/request_location_permission.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

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
       SharedPreferences pref = await SharedPreferences.getInstance();
       var userId = pref.getString("userId")?? '';  
       if(userId==''){  
        Get.offAll(() => OnBoarding(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 400));
       }else{
        Get.to(() =>RequestLocationPermission(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 400));
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
