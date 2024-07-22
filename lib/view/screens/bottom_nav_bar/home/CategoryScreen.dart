// import 'package:flutter/material.dart';
// import 'package:was_gibts_in/constants/app_colors.dart';
// import 'package:was_gibts_in/constants/app_fonts.dart';
// import 'package:was_gibts_in/view/screens/bottom_nav_bar/home/home_tabs/restaurants.dart';
// import 'package:was_gibts_in/view/widget/custom_tab_indicator_widget.dart';

// class CategoryScreen extends StatelessWidget {
//   CategoryScreen({super.key});
//   int _currentTab = 0;

//   final List<String> _tabs = [
//     'Restaurants',
//     'Hair dressers',
//     'Coffee shops',
//   ];

//   final List<Widget> _tabBarView = [
//     Restaurants(),
//     Restaurants(),
//     Restaurants(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Column(
//         children: [
//           TabBar(
//             isScrollable: true,
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             physics: BouncingScrollPhysics(),
//             indicatorSize: TabBarIndicatorSize.label,
//             indicator: CustomTabIndicator(
//               color: kSecondaryColor,
//               height: 6,
//               horizontalRadius: 50,
//               indicatorWidth: 22,
//             ),
//             labelColor: kTertiaryColor,
//             unselectedLabelColor: kGreyColor3,
//             labelStyle: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//               fontFamily: AppFonts.MONTSERRAT,
//             ),
//             unselectedLabelStyle: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               fontFamily: AppFonts.MONTSERRAT,
//             ),
//             tabs: List.generate(
//               _tabs.length,
//               (index) {
//                 return Padding(
//                   padding: const EdgeInsets.only(bottom: 12),
//                   child: Text(
//                     _tabs[index],
//                   ),
//                 );
//               },
//             ),
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           IndexedStack(
//             index: _currentTab,
//             children: _tabBarView,
//           ),
//         ],
//       ),
//     );
//   }
// }
