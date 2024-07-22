import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_images.dart';
import 'package:was_gibts_in/view/screens/auth/loginScreen.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/Vouchers/vouchers.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class ChangeSuccessfulScreen extends StatelessWidget {
  const ChangeSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(),
            SizedBox(height: 40.h),
            Image.asset(
              Assets.imagesLogo,
              height: 48.h,
              width: 78.w,
            ),
            MyText(
              paddingTop: 5,
              textAlign: TextAlign.center,
              text: 'WAS GIBTS IN',
              size: 14.sp,
              color: kSecondaryColor,
              weight: FontWeight.w600,
            ),
            MyText(
              paddingTop: 3,
              textAlign: TextAlign.center,
              text: 'Erlebe Deine Stadt neu',
              size: 6.sp,
              color: kBlackColor,
              weight: FontWeight.w400,
              paddingBottom: 40.h,
            ),
             Image.asset(
              "assets/images/Successmark.png",
              height: 56.h,
              width: 56.w,
            ),
            MyText(
                text: "Password Changed",
                size: 22.sp,
                weight: FontWeight.w600,
                color: kSecondaryColor,
                paddingTop: 30,
                paddingBottom: 10,
                ),
            MyText(
              text:
                  "Your password has been changed\n successfully.",
              size: 12.sp,
              textAlign: TextAlign.center,
              paddingTop: 5,
            ),
           
            SizedBox(height: 25.sp),
            buildButton(
              text: "Back to login",
              onTap: () {
              Get.to(() => LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
