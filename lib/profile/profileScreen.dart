import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/Vouchers/vouchers.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Image.asset(
              "assets/images/back.png",
              height: 41.h,
              width: 41.w,
            )),
        centerTitle: true,
        title: MyText(
          text: "Account Settings",
          weight: FontWeight.w600,
          size: 16,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 30,
                  child: Image.asset(
                    "assets/images/profile.png",
                    height: 80.h,
                    width: 80.w,
                  ),
                ),
              ),
              MyText(
                text: "Vapodorme",
                size: 14.sp,
                paddingTop: 10.h,
                paddingBottom: 15.h,
              ),
              formField2(
                labelText: "Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter password';
                  }
                  return null;
                },
                controller: nameController,
              ),
              SizedBox(height: 20.h),
              formField2(
                labelText: "Email",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter password';
                  }
                  return null;
                },
                controller: emailController,
              ),
               SizedBox(height: 20.h),
              formField2(
                labelText: "Contact",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter password';
                  }
                  return null;
                },
                controller: contactController,
              ),
              SizedBox(height: 20.h),
              formField2(
                labelText: "Address",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter password';
                  }
                  return null;
                },
                controller: addressController,
              ),
               SizedBox(height: 20.h),
              formField2(
                labelText: "Company Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter password';
                  }
                  return null;
                },
                controller: companyController,
              ),
              SizedBox(height: 20.h),
              formField2(
                labelText: "Role",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter password';
                  }
                  return null;
                },
                controller: roleController,
              ),
              SizedBox(height: 25.h),
              buildButton(text: "Save & Next",),
            ],
          ),
        ),
      ),
    );
  }
}

class formField2 extends StatelessWidget {
  final labelText;
  final controller;
  String? Function(String?)? validator;
  formField2({
    super.key,
    this.controller,
    this.labelText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: TextStyle(
          fontSize: 10.sp,
          color: kTertiaryColor,
        ),
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText.toString(),
          labelStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffD0D5DD96), width: 2),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Color(0xffD0D5DD).withOpacity(0.6), width: 2),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Color(0xffD0D5DD).withOpacity(0.6), width: 2),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Color(0xffD0D5DD).withOpacity(0.6), width: 2),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Color(0xffD0D5DD).withOpacity(0.6), width: 2),
          ),
        ));
  }
}
