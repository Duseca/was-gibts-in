import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_fonts.dart';
import 'package:was_gibts_in/constants/app_images.dart';
import 'package:was_gibts_in/services/authServices.dart';
import 'package:was_gibts_in/view/screens/auth/forgotScreen.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/Vouchers/vouchers.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.h),
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
                MyText(
                  text:
                      "Provide us your credentials to start journey\n with us.",
                  textAlign: TextAlign.center,
                  size: 11.sp,
                  fontFamily: AppFonts.MONTSERRAT,
                  weight: FontWeight.w500,
                  paddingBottom: 50.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    text: "Your email",
                    textAlign: TextAlign.center,
                    size: 12.sp,
                    fontFamily: AppFonts.MONTSERRAT,
                    weight: FontWeight.w500,
                    paddingBottom: 10,
                    paddingLeft: 5,
                  ),
                ),
                formField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    } else if (!value.contains('@')) {
                      return 'please enter valid email';
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    text: "Password",
                    textAlign: TextAlign.center,
                    size: 12.sp,
                    fontFamily: AppFonts.MONTSERRAT,
                    weight: FontWeight.w500,
                    paddingBottom: 10,
                    paddingLeft: 5,
                    paddingTop: 15,
                  ),
                ),
                formField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    MyText(
                      text: "Remember me",
                      size: 9.sp,
                      fontFamily: AppFonts.MONTSERRAT,
                      weight: FontWeight.w500,
                      color: Color(0xff020202),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () async {
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: "afridimudasir883@gmail.com",
                            password: "password123",
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                        Get.to(() => ForgotScreen(),
                            transition: Transition.rightToLeft,
                            duration: Duration(milliseconds: 400));
                      },
                      child: MyText(
                        text: "Forgot Password?",
                        size: 9.sp,
                        fontFamily: AppFonts.MONTSERRAT,
                        weight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 40.h),
                buildButton(
                    text: "Sign In",
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        AuthServices().signIn(emailController.text.toString(),
                            passwordController.text.toString(), context);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class formField extends StatelessWidget {
  final controller;
  String? Function(String?)? validator;
  formField({super.key, this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.88,
        child: TextFormField(
            validator: validator,
            controller: controller,
            style: TextStyle(
                fontSize: 12.sp,
                color: Color(0xff5B5B5B),
                fontFamily: AppFonts.MONTSERRAT),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                enabled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(8)))));
  }
}
