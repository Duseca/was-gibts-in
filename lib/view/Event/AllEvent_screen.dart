import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/view/Event/EventDetailScreen.dart';
import 'package:was_gibts_in/view/screens/drawer/app_drawer.dart';
import 'package:was_gibts_in/view/widget/custom_appbar_widget.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class AllEventsScreen extends StatelessWidget {
  var data;
  AllEventsScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return AppDrawer(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Events"
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      paddingTop: 27,
                      text: 'Nearby Events',
                      size: 14,
                      weight: FontWeight.w600,
                      paddingBottom: 10,
                    ),
                    for (int i = 0; i < data.length; i++) ...[
                      GestureDetector(
                        onTap: () {
                           Get.to(() => EventDetails(
                      image: data[i]['image'],
                    ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 24,
                                    spreadRadius: 0,
                                    offset: Offset(0, 4)),
                              ]),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    data[i]['image'],
                                    height: 81.h,
                                    width: 94.w,
                                  )),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    text: "Music Event",
                                    size: 18.sp,
                                    weight: FontWeight.w600,
                                  ),
                                  MyText(
                                    text: "09:00 PM- 10:00 PM",
                                    size: 10.sp,
                                  ),
                                  MyText(
                                    text: "May 24, 2023 - Monday",
                                    size: 12.sp,
                                    weight: FontWeight.w500,
                                    color: kSecondaryColor,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ]
                  ],
                ),
              ),
           
            ],
          ),
        ),
      ),
    );
  }
}
