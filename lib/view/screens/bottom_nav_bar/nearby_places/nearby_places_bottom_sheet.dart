import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_images.dart';
import 'package:was_gibts_in/constants/app_styling.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/home/home.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class NearbyBottomSheet extends StatefulWidget {
  NearbyBottomSheet({
    super.key,
    required this.dataList,
    required this.controller,
    required this.searchController,
  });
  final List<DocumentSnapshot> dataList;
  final ScrollController controller;
  TextEditingController searchController = TextEditingController();

  @override
  State<NearbyBottomSheet> createState() => _NearbyBottomSheetState();
}

class _NearbyBottomSheetState extends State<NearbyBottomSheet> {
  var items = [
    'saloon',
    'restaurant',
    'Tattoo studio',
    'Gym',
    'Bowling',
  ];

  @override
  void initState() {
    print("init call");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 1.0,
        color: kSecondaryColor,
      ),
    );
    final _inputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.0,
        color: kSecondaryColor,
      ),
      borderRadius: BorderRadius.circular(8),
    );

    return DefaultTabController(
      length: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(28),
          ),
          color: kPrimaryColor,
        ),
        child: Column(
          children: [
            // NearbyBottomSheetHandle(controller: controller),
            Container(
              height: 1,
              color: Color(0xff9799A0).withOpacity(0.47),
              width: Get.width,
            ),
            Expanded(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      height: 3,
                      width: Get.width*0.2,
                      color: Colors.blue,

                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                onChanged: (value) {
                                 
                                  
                                },
                                controller: widget.searchController,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: kBlackColor.withOpacity(0.37),
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Search Place',
                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: kBlackColor.withOpacity(0.37),
                                  ),
                                  prefixIcon: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        Assets.imagesSearch,
                                        height: 24,
                                        color: kSecondaryColor,
                                      ),
                                    ],
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 15),
                                  border: _border,
                                  enabledBorder: _border,
                                  focusedBorder: _border,
                                  errorBorder: _border,
                                  focusedErrorBorder: _border,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            PopupMenuButton(
                              icon: Container(
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: kSecondaryColor,
                                ),
                                child: Icon(
                                  Icons.play_arrow,
                                  color: kPrimaryColor,
                                ),
                              ),
                              itemBuilder: (context) => items
                                  .map(
                                    (e) => PopupMenuItem(
                                      value: "1",
                                      child: Text(e),
                                      onTap: () {
                                        
                                     },
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // for Events
                  Expanded(
                    child: SingleChildScrollView(
                      controller: widget.controller,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 20),
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
                                for(int i=0; i<10; i++)...[
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                     
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 24,
                                        spreadRadius: 0,
                                        offset: Offset(0, 4)
                                      ),
                                    ]
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 5,),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset("assets/images/event.jpg",height: 81.h,width: 94.w,))
                                   ,SizedBox(width: 10),
                                   Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                     MyText(text: "Music Event",size: 18.sp,weight: FontWeight.w600,),
                                     MyText(text: "09:00 PM- 10:00 PM",size: 10.sp,),
                                     MyText(text: "May 24, 2023 - Monday",size: 12.sp,weight: FontWeight.w500,color: kSecondaryColor,)
                                    ],
                                   )
                                    ],
                                  ),
                                  
                                )
                                ]
                                // Row(
                                //   children: [
                                //     Container(
                                //       height: 6,
                                //       width: 22,
                                //       decoration: AppStyling.INDICATOR,
                                //     ),
                                //   ],
                                // ),
                               
                                // SizedBox(
                                //   height: 20,
                                // ),
                                // Row(
                                //   children: [
                                //     MyText(
                                //       text: "Starting from",
                                //       size: 12,
                                //       weight: FontWeight.w600,
                                //     ),
                                //     MyText(
                                //       text: " July 1, 2023 - July 7, 2023",
                                //       size: 11,
                                //       weight: FontWeight.w400,
                                //     )
                                //   ],
                                // ),
                                // SizedBox(height: 20),
                                // Divider(
                                //   color: Color(0xff0B0B0B).withOpacity(0.2),
                                // ),
                              //  SizedBox(height: 10),
                              ],
                            ),
                          ),
                          // ListView.builder(
                          //   shrinkWrap: true,
                          //   padding: EdgeInsets.zero,
                          //   physics: BouncingScrollPhysics(),
                          //   itemCount: 4,
                          //   itemBuilder: (context, index) {
                          //     return Stack(
                          //       children: [
                          //         Column(
                          //           crossAxisAlignment: CrossAxisAlignment.center,
                          //           children: [
                          //             Row(
                          //               crossAxisAlignment:
                          //                   CrossAxisAlignment.center,
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.center,
                          //               children: [
                          //                 Container(
                          //                   margin: EdgeInsets.symmetric(
                          //                       vertical: 15.h),
                          //                   decoration: BoxDecoration(
                          //                       borderRadius:
                          //                           BorderRadius.circular(8),
                          //                       color: primaryColor
                          //                           .withOpacity(0.1)),
                          //                   height: 60.h,
                          //                   width: MediaQuery.of(context)
                          //                           .size
                          //                           .width *
                          //                       0.8,
                          //                   child: Stack(
                          //                     alignment: Alignment.center,
                          //                     children: [
                          //                       Row(
                          //                         crossAxisAlignment:
                          //                             CrossAxisAlignment.center,
                          //                         children: [
                          //                           SizedBox(width: 10.w),
                          //                           Column(
                          //                             crossAxisAlignment:
                          //                                 CrossAxisAlignment
                          //                                     .start,
                          //                             mainAxisAlignment:
                          //                                 MainAxisAlignment
                          //                                     .center,
                          //                             children: [
                          //                               SizedBox(height: 10.h),
                          //                               MyText(
                          //                                 text:
                          //                                     "09:00 PM- 10:00 PM",
                          //                                 size: 10.sp,
                          //                               ),
                          //                               SizedBox(height: 8.h),
                          //                               MyText(
                          //                                 text:
                          //                                     "May 24, 2023 - Monday",
                          //                                 size: 14.sp,
                          //                                 weight: FontWeight.w500,
                          //                                 color: primaryColor,
                          //                               )
                          //                             ],
                          //                           ),
                          //                           SizedBox(width: 10.w),
                          //                         ],
                          //                       ),
                          //                       Row(
                          //                         crossAxisAlignment:
                          //                             CrossAxisAlignment.center,
                          //                         mainAxisAlignment:
                          //                             MainAxisAlignment.end,
                          //                         children: [
                          //                           Stack(
                          //                             children: [
                          //                               CircleAvatar(
                          //                                   radius: 10,
                          //                                   backgroundColor:
                          //                                       primaryColor,
                          //                                   backgroundImage:
                          //                                       AssetImage(
                          //                                     "assets/images/person4.png",
                          //                                   )),
                          //                               Padding(
                          //                                 padding:
                          //                                     const EdgeInsets
                          //                                         .only(
                          //                                         left: 15.0),
                          //                                 child: CircleAvatar(
                          //                                   radius: 10,
                          //                                   backgroundColor:
                          //                                       primaryColor,
                          //                                   backgroundImage:
                          //                                       AssetImage(
                          //                                     "assets/images/person4.png",
                          //                                   ),
                          //                                 ),
                          //                               ),
                          //                               Padding(
                          //                                 padding:
                          //                                     const EdgeInsets
                          //                                         .only(
                          //                                         left: 30.0),
                          //                                 child: CircleAvatar(
                          //                                   radius: 10,
                          //                                   backgroundColor:
                          //                                       primaryColor,
                          //                                   backgroundImage:
                          //                                       AssetImage(
                          //                                     "assets/images/person4.png",
                          //                                   ),
                          //                                 ),
                          //                               ),
                          //                             ],
                          //                           ),
                          //                           MyText(
                          //                               text: "10+ People",
                          //                               size: 10.sp),
                          //                           SizedBox(width: 10.w),
                          //                         ],
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                    
                          //             //  Stack(
                          //             //      children: [
                          //             //        Column(
                          //             //        children: [
                          //             //          SizedBox(height: 30.h),
                          //             //          Container(
                          //             //           margin: EdgeInsets.only(left: 20),
                          //             //            height: 10.h,
                          //             //            width: 10.w,
                          //             //            decoration: BoxDecoration(color: primaryColor,shape: BoxShape.circle),
                          //             //          ),
                          //             //          Column(
                          //             //            children: [
                          //             //              for(int i=0; i<7; i++)...[
                          //             //              SizedBox(height: 2,),
                          //             //              Container(
                          //             //               margin: EdgeInsets.only(left: 20),
                          //             //                height: 5.h,
                          //             //                width: 2.w,
                          //             //                decoration: BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(2)),
                          //             //              ),
                          //             //              ]
                          //             //            ],
                          //             //          ),
                          //             //        ],
                          //             //                                                  ),
                          //             //      ],
                          //             //    ),
                          //           ],
                          //         ),
                          //         // Padding(
                          //         //   padding: EdgeInsets.only(
                          //         //       left: 15.h, top:index==0? 40.h:0),
                          //         //   child: Column(
                          //         //     mainAxisAlignment:
                          //         //         MainAxisAlignment.start,
                          //         //     crossAxisAlignment:
                          //         //         CrossAxisAlignment.start,
                          //         //     children: [
                          //         //       Container(
                          //         //         margin: EdgeInsets.only(
                          //         //             left: 5.h),
                          //         //         height: 10.h,
                          //         //         width: 10.w,
                          //         //         decoration: BoxDecoration(
                          //         //             color: primaryColor,
                          //         //             shape:
                          //         //                 BoxShape.circle),
                          //         //       ),
                          //         //       for (int i = 0;
                          //         //           i < 0;
                          //         //           i++) ...[
                          //         //         SizedBox(
                          //         //           height: 2,
                          //         //         ),
                          //         //         Container(
                          //         //           margin: EdgeInsets.only(
                          //         //               left: 10.h),
                          //         //           height: 5.h,
                          //         //           width: 2.w,
                          //         //           decoration: BoxDecoration(
                          //         //               color: primaryColor,
                          //         //               borderRadius:
                          //         //                   BorderRadius
                          //         //                       .circular(
                          //         //                           2)),
                          //         //         ),
                          //         //       ]
                          //         //     ],
                          //         //   ),
                          //         // )
                          //       ],
                          //     );
                          //   },
                          // ),
                       
                        ],
                      ),
                    ),
                  ),
                
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildSearchBar(OutlineInputBorder _inputBorder) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            style: TextStyle(
              fontSize: 12,
              color: kBlackColor,
            ),
            decoration: InputDecoration(
              prefixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.imagesSearch,
                    height: 24,
                    color: kSecondaryColor,
                  ),
                ],
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
              hintStyle: TextStyle(
                fontSize: 12,
                color: kBlackColor,
              ),
              hintText: 'in Forchheim',
              border: _inputBorder,
              enabledBorder: _inputBorder,
              focusedBorder: _inputBorder,
              focusedErrorBorder: _inputBorder,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: kSecondaryColor,
          ),
          child: Icon(
            Icons.play_arrow,
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
