// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:was_gibts_in/constants/app_images.dart';
// import 'package:was_gibts_in/constants/app_styling.dart';
// import 'package:was_gibts_in/controller/locationController.dart';
// import 'package:was_gibts_in/controller/popularplacesController.dart';
// import 'package:was_gibts_in/main.dart';
// import 'package:was_gibts_in/view/widget/common_image_view_widget.dart';
// import 'package:was_gibts_in/view/widget/my_text_widget.dart';
// import 'package:was_gibts_in/view/widget/place_card_widget.dart';

// class PopularPlace extends StatefulWidget {
//   PopularPlace({
//     super.key,
//     required this.dataList,
//     required this.controller,
//     required this.searchFieldController,
//     required this.placeController,
//     required this.locationController,
//   });
//   TextEditingController searchFieldController;
//   final List<DocumentSnapshot> dataList;
//   final ScrollController controller;
//   PopularPlaceController placeController;
//   LocationController locationController;
  
//   @override
//   State<PopularPlace> createState() => _PopularPlaceState();
// }

// class _PopularPlaceState extends State<PopularPlace> {
//   @override
//   void initState() {
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
// final popularList=widget.dataList;
    
//     return  Obx(() {
//        widget.dataList
//           .where((e) => e['type'] == widget.placeController.type.value)
//           .toList();
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: SingleChildScrollView(
//           controller: widget.controller,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               MyText(
//                 paddingTop: 27,
//                 text: 'Popular Places',
//                 size: 14,
//                 weight: FontWeight.w600,
//                 paddingBottom: 10,
//               ),
//               Row(
//                 children: [
//                   Container(
//                     height: 6,
//                     width: 22,
//                     decoration: AppStyling.INDICATOR,
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               ListView.builder(
//                 shrinkWrap: true,
//                 padding: EdgeInsets.zero,
//                 physics: BouncingScrollPhysics(),
//                 itemCount: popularList.length,
//                 itemBuilder: (context, index) {
//                   return PlaceCard(
//                     image: dummyImg,
//                     name: popularList[index]["name"].toString(),
//                     occupation: popularList[index]["description"].toString(),
//                     timeRequired: '17',
//                     distance: '2',
//                     onMore: () {},
//                     onViewDetail: () {},
//                   );
//                 },
//               ),
//               MyText(
//                 paddingTop: 12,
//                 text: 'Recent Searches',
//                 size: 14,
//                 weight: FontWeight.w600,
//                 paddingBottom: 10,
//               ),
//               Row(
//                 children: [
//                   Container(
//                     height: 6,
//                     width: 22,
//                     decoration: AppStyling.INDICATOR,
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   mainAxisExtent: 32,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 20,
//                 ),
//                 itemCount: 5,
//                 shrinkWrap: true,
//                 padding: EdgeInsets.zero,
//                 physics: BouncingScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   final List<Map<String, String>> _searches = [
//                     {
//                       'icon': Assets.imagesCofee,
//                       'title': 'Coffee Planet',
//                     },
//                     {
//                       'icon': Assets.imagesTatto,
//                       'title': 'Tattoo Studio',
//                     },
//                     {
//                       'icon': Assets.imagesGym,
//                       'title': 'Gym',
//                     },
//                     {
//                       'icon': Assets.imagesBowling,
//                       'title': 'Bowling',
//                     },
//                     {
//                       'icon': Assets.imagesHairDresser,
//                       'title': 'Hair Dresser',
//                     },
//                   ];
//                   return Row(
//                     children: [
//                       CommonImageView(
//                         height: 32,
//                         width: 32,
//                         radius: 100.0,
//                         imagePath: _searches[index]['icon'],
//                       ),
//                       Expanded(
//                         child: MyText(
//                           paddingLeft: 10,
//                           lineHeight: 1.5,
//                           text: _searches[index]['title']!,
//                           size: 10,
//                           weight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
