import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/view/widget/custom_appbar_widget.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class SweepTaskScreen extends StatelessWidget {
  const SweepTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Sweepstake",
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  MyText(text: "Contests", size: 14, weight: FontWeight.w600),
                  Spacer(),
                  Image.asset(
                    "assets/images/QuestuinMark.png",
                    height: 20.sp,
                    width: 20.sp,
                  )
                ],
              ),
             for(int i=0; i<10; i++)...[
              Container(
                margin: EdgeInsets.only(top: 20,bottom: 20),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffEAEAEA),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    ListTile(
                      visualDensity: VisualDensity(vertical: -4),
                      leading: CircleAvatar(
                        child: SvgPicture.asset("assets/svgImage/crown.svg"),
                        backgroundColor: kSecondaryColor.withOpacity(0.2),
                      ),
                      title: MyText(
                        maxLines: 1,
                        text: "Lorem Ipsum es simple",
                        size: 12.sp,
                        textOverflow: TextOverflow.ellipsis,
                        weight: FontWeight.w500,
                      ),
                      subtitle: MyText(
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        text: "relleno estándar de las",
                        size: 12.sp,
                      ),
                      trailing: Container(
                        alignment: Alignment.center,
                        height: 20.sp,
                        width: 80.sp,
                        decoration: BoxDecoration(
                            color: kSecondaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20)),
                        child: MyText(
                          text: "new",
                          color: kSecondaryColor,
                          weight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        thickness: 1,
                        color: Color(0xffEAEAEA),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 15.sp),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(text: "Expired on",size: 10.sp,weight: FontWeight.w500,color: Color(0xff4F4F4F),),
                              MyText(text: "Nov 11, 2023",size: 14.sp,weight: FontWeight.w500,)
                            ],
                          ),
                          Spacer(),
                          registerButton(
                            onTab: () {
                              // get register yourself
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
             ],
            ],
          ),
        ),
      ),
    );
  }
}

class registerButton extends StatelessWidget {
 final VoidCallback? onTab;
  const registerButton({
    super.key,
    this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      onTap:onTab, 
      child: 
    Container(
      alignment: Alignment.center,
      height: 35,
      width: 150,
      decoration: BoxDecoration(
        color: Color(0xff7BC2FF),
        borderRadius: BorderRadius.circular(5)
      ),
      child: MyText(text:"Register Now",size: 12,weight: FontWeight.w500,color: Colors.white,)));
  }
}
