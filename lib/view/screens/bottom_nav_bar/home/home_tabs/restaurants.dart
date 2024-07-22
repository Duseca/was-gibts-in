import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_images.dart';
import 'package:was_gibts_in/main.dart';
import 'package:was_gibts_in/view/widget/common_image_view_widget.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class Restaurants extends StatelessWidget {
  var dataList;
   Restaurants({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    var list = dataList.where((e)=> e['type']== "restaurant").toList();
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 14),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return RestaurantCard(
            profileImage: dummyImg,
            personName: 'Amanda',
            coverImage: list[index]['image'],
            description:
                'Padar Island, Caribben Sensation in Eastern Indonasia',
            likes: '2,145',
            comments: '145',
            onTap: () {},
          );
        },
      ),
    );
  
  }
}

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    required this.profileImage,
    required this.personName,
    required this.coverImage,
    required this.description,
    required this.likes,
    required this.comments,
    required this.onTap,
  });

  final String profileImage,
      personName,
      coverImage,
      description,
      likes,
      comments;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            CommonImageView(
              height: Get.height,
              width: 227,
              radius: 12.78,
              url: coverImage,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.78),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 1,
                  sigmaY: 1,
                ),
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: Get.height,
                  width: 227,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.78),
                    color: kBlackColor.withOpacity(0.26),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CommonImageView(
                            height: 23,
                            width: 23,
                            radius: 6,
                            url: profileImage,
                          ),
                          Expanded(
                            child: MyText(
                              paddingLeft: 6,
                              text: personName,
                              size: 10,
                              weight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      MyText(
                        text: description,
                        size: 10,
                        weight: FontWeight.bold,
                        color: kPrimaryColor,
                        lineHeight: 1.5,
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Image.asset(
                                      Assets.imagesHeartEmpty,
                                      height: 15,
                                    ),
                                    MyText(
                                      paddingLeft: 5,
                                      text: likes,
                                      size: 8,
                                      weight: FontWeight.bold,
                                      color: kPrimaryColor,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Image.asset(
                                      Assets.imagesComments,
                                      height: 15,
                                    ),
                                    MyText(
                                      paddingLeft: 5,
                                      text: comments,
                                      size: 8,
                                      weight: FontWeight.bold,
                                      color: kPrimaryColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Image.asset(
                                Assets.imagesArrowNext,
                                height: 11,
                                color: kSecondaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
