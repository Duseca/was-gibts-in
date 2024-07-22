// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:step_progress_indicator/step_progress_indicator.dart';
// import 'package:was_gibts_in/constants/app_colors.dart';
// import 'package:was_gibts_in/constants/app_fonts.dart';
// import 'package:was_gibts_in/constants/app_images.dart';
// import 'package:was_gibts_in/constants/app_sizes.dart';
// import 'package:was_gibts_in/main.dart';
// import 'package:was_gibts_in/view/screens/drawer/app_drawer.dart';
// import 'package:was_gibts_in/view/widget/common_image_view_widget.dart';
// import 'package:was_gibts_in/view/widget/custom_appbar_widget.dart';
// import 'package:was_gibts_in/view/widget/my_text_widget.dart';

// class VouchersScreen extends StatelessWidget {
//   const VouchersScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppDrawer(
//       child: Scaffold(
//         appBar: CustomAppBar(
//           title: 'Coupons',
//         ),
//         body: ListView(
//           shrinkWrap: true,
//           padding: AppSizes.DEFAULT_PADDING,
//           physics: BouncingScrollPhysics(),
//           children: [
//             Row(
//               children: [
//                 Container(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 10,
//                     vertical: 6,
//                   ),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     border: Border.all(
//                       color: kSecondaryColor,
//                     ),
//                   ),
//                   child: Wrap(
//                     spacing: 5,
//                     crossAxisAlignment: WrapCrossAlignment.center,
//                     children: [
//                       MyText(
//                         paddingBottom: 1,
//                         text: 'Sort',
//                         size: 10,
//                         weight: FontWeight.w600,
//                         color: kGreyColor,
//                       ),
//                       Image.asset(
//                         Assets.imagesArrowDropDown,
//                         height: 6,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: 12,
//                 ),
//                 Wrap(
//                   spacing: 12,
//                   children: List.generate(
//                     2,
//                     (index) {
//                       return Container(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 6,
//                         ),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           border: Border.all(
//                             color: kSecondaryColor,
//                           ),
//                         ),
//                         child: MyText(
//                           paddingBottom: 1,
//                           text: index == 1 ? 'Shops' : 'Restaurants',
//                           size: 10,
//                           weight: FontWeight.w600,
//                           color: kGreyColor,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Row(
//               children: [
//                 CommonImageView(
//                   height: 40,
//                   width: 40,
//                   url: dummyImg,
//                   radius: 100.0,
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       RichText(
//                         text: TextSpan(
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontFamily: AppFonts.MONTSERRAT,
//                             color: kBlackColor,
//                           ),
//                           children: [
//                             TextSpan(
//                               text: 'Vapodrom ',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             TextSpan(
//                               text: 'Coupon',
//                             ),
//                           ],
//                         ),
//                       ),
//                       MyText(
//                         paddingTop: 6,
//                         text: 'Visit business',
//                         size: 10,
//                         color: kGreyColor,
//                         weight: FontWeight.w600,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 30,
//                   width: 66,
//                   decoration: BoxDecoration(
//                     color: kSecondaryColor,
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   child: Center(
//                     child: MyText(
//                       paddingBottom: 1,
//                       text: 'Activate',
//                       size: 11,
//                       weight: FontWeight.w500,
//                       color: kPrimaryColor,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//               height: 94,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(
//                     Assets.imagesCoupanImage,
//                   ),
//                   fit: BoxFit.fitWidth,
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       CommonImageView(
//                         height: 30,
//                         width: 30,
//                         url: dummyImg,
//                         radius: 100.0,
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             RichText(
//                               text: TextSpan(
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontFamily: AppFonts.MONTSERRAT,
//                                   color: kBlackColor,
//                                 ),
//                                 children: [
//                                   TextSpan(
//                                     text: 'Vapodrom ',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: 'Coupon',
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 3,
//                             ),
//                             RichText(
//                               text: TextSpan(
//                                 style: TextStyle(
//                                   fontSize: 9,
//                                   fontFamily: AppFonts.MONTSERRAT,
//                                   color: kBlackColor,
//                                 ),
//                                 children: [
//                                   TextSpan(
//                                     text: '30% ',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: '1 day left',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       color: kGreyColor,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         height: 30,
//                         width: 112,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           border: Border.all(
//                             color: kSecondaryColor,
//                           ),
//                         ),
//                         child: Center(
//                           child: MyText(
//                             paddingBottom: 1,
//                             text: 'Use it until today',
//                             size: 10,
//                             weight: FontWeight.w600,
//                             color: kGreyColor,
//                           ),
//                         ),
//                       ),
//                       MyText(
//                         text: 'Redeem',
//                         size: 12,
//                         weight: FontWeight.bold,
//                         color: kSecondaryColor,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             MyText(
//               paddingTop: 16,
//               text: 'Redeem timer started',
//               size: 10,
//               weight: FontWeight.w700,
//               color: kGreyColor,
//               paddingBottom: 8,
//             ),
//             Container(
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: Color(0xffEBF7FB),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: Color(0xff5BB514),
//                         ),
//                         child: MyText(
//                           text: 'Vapodrom Voucher',
//                           size: 6,
//                           weight: FontWeight.w600,
//                           color: kPrimaryColor,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 6,
//                       ),
//                       Container(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: kSecondaryColor,
//                         ),
//                         child: MyText(
//                           text: '10 min',
//                           size: 6,
//                           weight: FontWeight.w600,
//                           color: kPrimaryColor,
//                         ),
//                       ),
//                       Spacer(),
//                       Container(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: Color(0xffFC3838),
//                         ),
//                         child: MyText(
//                           text: '2 min left',
//                           size: 6,
//                           weight: FontWeight.w700,
//                           color: kPrimaryColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 6,
//                   ),
//                   Stack(
//                     alignment: Alignment.centerLeft,
//                     children: [
//                       StepProgressIndicator(
//                         totalSteps: 100,
//                         currentStep: 68,
//                         size: 26,
//                         unselectedSize: 26,
//                         selectedSize: 26,
//                         padding: 0,
//                         roundedEdges: Radius.circular(5),
//                         selectedGradientColor: LinearGradient(
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                           colors: [
//                             kSecondaryColor,
//                             kSecondaryColor.withOpacity(0.1),
//                           ],
//                         ),
//                         unselectedGradientColor: LinearGradient(
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                           colors: [
//                             Color(0xffD9D9D9),
//                             Color(0xffD9D9D9),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 4),
//                         child: RichText(
//                           text: TextSpan(
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontFamily: AppFonts.MONTSERRAT,
//                               color: kPrimaryColor,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             children: [
//                               TextSpan(
//                                 text: '08 ',
//                               ),
//                               TextSpan(
//                                 text: 'min',
//                                 style: TextStyle(
//                                   fontSize: 8,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: Get.width * 0.55),
//                         height: 15,
//                         width: 2,
//                         color: kPrimaryColor,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 22,
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//               height: 94,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(
//                     Assets.imagesExpiredCoupon,
//                   ),
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       CommonImageView(
//                         height: 30,
//                         width: 30,
//                         imagePath: Assets.imagesExpCoupon,
//                         radius: 100.0,
//                       ),
//                       SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             MyText(
//                               text: 'GASTRO',
//                               size: 12,
//                               color: kGreyColor.withOpacity(0.35),
//                             ),
//                             SizedBox(
//                               height: 3,
//                             ),
//                             RichText(
//                               text: TextSpan(
//                                 style: TextStyle(
//                                   fontSize: 9,
//                                   fontFamily: AppFonts.MONTSERRAT,
//                                   color: kGreyColor.withOpacity(0.35),
//                                 ),
//                                 children: [
//                                   TextSpan(
//                                     text: '30% ',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: '1 day left',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         height: 30,
//                         padding: EdgeInsets.symmetric(horizontal: 15),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           border: Border.all(
//                             color: kGreyColor.withOpacity(0.35),
//                           ),
//                         ),
//                         child: Center(
//                           child: MyText(
//                             paddingBottom: 1,
//                             text: 'Used until 15 July 2023',
//                             size: 10,
//                             weight: FontWeight.w600,
//                             color: kGreyColor.withOpacity(0.35),
//                           ),
//                         ),
//                       ),
//                       MyText(
//                         text: 'Expired',
//                         size: 12,
//                         weight: FontWeight.bold,
//                         color: Color(0xffEB6060),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }