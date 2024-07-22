import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_images.dart';
import 'package:was_gibts_in/services/authServices.dart';
import 'package:was_gibts_in/view/screens/auth/loginScreen.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/Vouchers/vouchers.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class ForgotScreen extends StatelessWidget {
  ForgotScreen({super.key});
  TextEditingController forgotController = TextEditingController();
  final formkey = GlobalKey<FormState>();
 int i=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
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
                            text: "Forgot Password",
                            size: 22.sp,
                            weight: FontWeight.w600,
                            color: kSecondaryColor),
                      ],
                    ),
                    MyText(
                      text:
                          "Don't worry! It occurs. Please enter the email\n address linked with your account.",
                      size: 12.sp,
                      paddingTop: 5,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    text: "Your email",
                    textAlign: TextAlign.center,
                    size: 12.sp,
                    weight: FontWeight.w500,
                    paddingBottom: 10,
                    paddingLeft: 5,
                    paddingTop: 20.h,
                  ),
                ),
                formField(
                  controller: forgotController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    } else if (!value.contains('@')) {
                      return 'please enter valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25.sp),
                buildButton(
                  text: "Next",
                  onTap: () {
                      if (formkey.currentState!.validate()) {
                      i++;
                      AuthServices()
                          .resetPassword(forgotController.text.toString(),context);
                    }
                  },
                ),
                SizedBox(height: 15.h),
                IconButton(
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  onPressed: () {

                  },
                  icon: Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: 47.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: kSecondaryColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText(
                            text:"Send Code again  ",
                            size: 15.sp,
                            weight: FontWeight.w500,
                          ),
                          MyText(
                            text:i==0? "":"00:25",
                            size: 11.sp,
                            weight: FontWeight.w500,
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
