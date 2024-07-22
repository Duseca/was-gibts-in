import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_sizes.dart';
import 'package:was_gibts_in/main.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/home/company_detail/company_detail.dart';
import 'package:was_gibts_in/view/widget/common_image_view_widget.dart';
import 'package:was_gibts_in/view/widget/custom_route_widget.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class SearchRestaurants extends StatelessWidget {
  List<DocumentSnapshot>? filterList;
  SearchRestaurants({super.key, @required this.filterList});

  @override
  Widget build(BuildContext context) {
    print("filterList: $filterList");
    return ListView(
      padding: AppSizes.DEFAULT_VERTICAL,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        MyText(
          textAlign: TextAlign.end,
          text: 'Showing ${filterList!.length} results',
          size: 12,
          color: kGreyColor3,
          paddingBottom: 13,
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          itemCount: filterList!.length,
          itemBuilder: (context, index) {
            return _RestaurantCard(fullList: filterList, index: index);
          },
        )
      ],
    );
  }
}

class _RestaurantCard extends StatefulWidget {
  List<DocumentSnapshot>? fullList;
  final index;
  _RestaurantCard({@required this.fullList, @required this.index});
  @override
  State<_RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<_RestaurantCard> {
  final _pageController = PageController();

  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CustomPageRoute(
            page: CompanyDetail(
              haveTitle: false,
              title: 'Casa Italia',
              data: widget.fullList![widget.index],
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 10,
              color: kBlackColor.withOpacity(0.16),
            ),
          ],
        ),
        margin: EdgeInsets.only(bottom: 20),
        height: 215,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => _onPageChanged(index),
                physics: BouncingScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      // Image.asset(
                      // widget.fullList[widget.index].image,
                      //   height: Get.height,
                      //   width: Get.width,
                      //   fit: BoxFit.cover,
                      // ),
                      CommonImageView(
                        height: Get.height,
                        width: Get.height,
                        radius: 6,
                        url: widget.fullList![widget.index]['image'],
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 15, 15),
                        child: Row(
                          children: [
                            Spacer(
                              flex: 7,
                            ),
                            Row(
                              children: List.generate(
                                4,
                                (index) {
                                  return AnimatedContainer(
                                    duration: Duration(
                                      milliseconds: 180,
                                    ),
                                    height: 6,
                                    margin: EdgeInsets.symmetric(horizontal: 2),
                                    width: _currentIndex == index ? 24 : 6,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: _currentIndex == index
                                          ? kSecondaryColor
                                          : kPrimaryColor,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Row(
                children: [
                  CommonImageView(
                    height: 50,
                    width: 50,
                    url: dummyImg,
                    radius: 100.0,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: 'Casa Italia',
                          size: 14,
                          weight: FontWeight.bold,
                          paddingBottom: 6,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: MyText(
                            text: '50 Meters away',
                            size: 8,
                            weight: FontWeight.w600,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // MyText(
                      //   onTap: () {
                      //     // print(widget.fullList[widget.index].image);
                      //   },
                      //   text: 'View details',
                      //   size: 10,
                      //   color: kSecondaryColor,
                      //   weight: FontWeight.bold,
                      //   paddingBottom: 7,
                      // ),
                      MyText(
                        text: widget.fullList![widget.index]['companyName'],
                        size: 10,
                        color: kGreyColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
