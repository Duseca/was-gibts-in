import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_images.dart';
import 'package:was_gibts_in/services/authServices.dart';
import 'package:was_gibts_in/view/screens/auth/loginScreen.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/Vouchers/vouchers.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      MyText(
                          text: "Create new password",
                          size: 22.sp,
                          weight: FontWeight.w600,
                          color: kSecondaryColor),
                    ],
                  ),
                  MyText(
                    text:
                        "Your new password must be unique from those\n previously used..",
                    size: 12.sp,
                    paddingTop: 5,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "New password",
                  textAlign: TextAlign.center,
                  size: 12.sp,
                  weight: FontWeight.w500,
                  paddingBottom: 10,
                  paddingLeft: 5,
                  paddingTop: 20.h,
                ),
              ),
              formField(
                controller: oldPasswordController,
                 validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter value';
                    }
                    return null;
                  },
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Confirm password",
                  textAlign: TextAlign.center,
                  size: 12.sp,
                  weight: FontWeight.w500,
                  paddingBottom: 10,
                  paddingLeft: 5,
                  paddingTop: 20.h,
                ),
              ),
              formField(
                controller: newPasswordController,
                 validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter value';
                    }
                    return null;
                  },
              ),
              SizedBox(height: 25.sp),
              buildButton(
                text: "Change password",
                onTap: () {

                  AuthServices().changePassword(
                    oldPasswordController.text.toString(),
                    newPasswordController.text.toString(),
                    context,
                 );
                 
                
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
