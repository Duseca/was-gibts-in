import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:was_gibts_in/profile/profileScreen.dart';
import 'package:was_gibts_in/view/screens/auth/resetPassword.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
              Row(
                children: [
                  MyText(
                    text: "General Settings",
                    size: 14.sp,
                    paddingTop: 10.h,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
              Divider(
                thickness: 1.5,
                color: Color(0xffEBEEF2),
              ),
              buildListTile(
                text: "Profile",
                path: "assets/svgImage/user.svg", onTab: () { 
                  Get.to(()=>ProfileScreen());
                 },
              ),
              Divider(
                thickness: 1.5,
                color: Color(0xffEBEEF2),
              ),
              ListTile(
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.zero,
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                leading: SvgPicture.asset("assets/svgImage/bell.svg"),
                trailing: Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(value: false, onChanged: (value) {
                    
                  },),
                ),
                title: MyText(
                  text: "Notification",
                  size: 14.sp,
                  color: Color(0xff28263B),
                ),
              ),
              Divider(
                thickness: 1.5,
                color: Color(0xffEBEEF2),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Support",
                  size: 14.sp,
                  paddingTop: 20.h,
                  weight: FontWeight.w500,
                ),
              ),
              Divider(
                thickness: 1.5,
                color: Color(0xffEBEEF2),
              ),
              buildListTile(
                text: "FAQ",
                path: "assets/svgImage/faq.svg", onTab: () {  },
              ),
              Divider(
                thickness: 1.5,
                color: Color(0xffEBEEF2),
              ),
              buildListTile(
                text: "Contact Us",
                path: "assets/svgImage/mail.svg", onTab: () {  },
              ),
              Divider(
                thickness: 1.5,
                color: Color(0xffEBEEF2),
              ),
              buildListTile(
                text: "Terms of Service",
                path: "assets/svgImage/terms.svg", onTab: () {  },
              ),
              Divider(
                thickness: 1.5,
                color: Color(0xffEBEEF2),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Other settings",
                  size: 14.sp,
                  paddingTop: 20.h,
                  weight: FontWeight.w500,
                ),
              ),
              Divider(
                thickness: 1.5,
                color: Color(0xffEBEEF2),
              ),
              buildListTile(
                text: "Change Password",
                path: "assets/svgImage/key.svg", onTab: () {
                 Get.to(()=> ResetPasswordScreen());
                  },
              ),
              Divider(
                thickness: 1.5,
                color: Color(0xffEBEEF2),
              ),
              buildListTile(
                text: "Delete Account",
                path: "assets/svgImage/trash.svg", onTab: () {  },
              ),
              Divider(
                thickness: 1.5,
                color: Color(0xffEBEEF2),
              ),
              ListTile(
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.zero,
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                title: MyText(
                  text: "sign out",
                  size: 14.sp,
                  color: Colors.red,
                  weight: FontWeight.w600,
                ),
              ),
              Divider(
                thickness: 1.5,
                color: Color(0xffEBEEF2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class buildListTile extends StatelessWidget {
  String? text;
  String? path;
  VoidCallback onTab;
  buildListTile({
    super.key,
    this.text,
    this.path,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTab,
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity(horizontal: -4, vertical: -4),
      leading: SvgPicture.asset(path.toString()),
      title: MyText(
        text: text.toString(),
        size: 14.sp,
        color: Color(0xff28263B),
      ),
      trailing: SvgPicture.asset("assets/svgImage/Arrow-forward.svg"),
    );
  }
}
