import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_images.dart';
import 'package:was_gibts_in/view/screens/auth/loginScreen.dart';
import 'package:was_gibts_in/view/screens/location/request_location_permission.dart';
import 'package:was_gibts_in/view/widget/common_image_view_widget.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final List<Map<String, String>> _onBoardingContent = [
    {
      'title': 'Get latest nearby\nheadlines and locations',
      'subTitle':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'image': Assets.imagesOn1,
    },
    {
      'title': 'Get latest nearby\nheadlines and locations 2',
      'subTitle':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'image': Assets.imagesOn2,
    },
    {
      'title': 'Get latest nearby\nheadlines and locations 3',
      'subTitle':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      'image': Assets.imagesOn3,
    },
  ];

  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (index) => _onPageChanged(index),
            controller: _pageController,
            itemCount: _onBoardingContent.length,
            itemBuilder: (context, index) {
              return CommonImageView(
                height: Get.height,
                width: Get.width,
                radius: 0.0,
                imagePath: _onBoardingContent[index]['image'],
              );
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 60),
                    height: 214,
                    width: Get.width,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: AssetImage(Assets.imagesBlurEffect),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyText(
                          text: _onBoardingContent[_currentIndex]['title']!,
                          color: kWhiteColor2,
                          size: 18,
                          weight: FontWeight.w600,
                          textAlign: TextAlign.center,
                          lineHeight: 1.6,
                        ),
                        MyText(
                          text: _onBoardingContent[_currentIndex]['subTitle']!,
                          color: kLightGreyColor,
                          size: 12,
                          textAlign: TextAlign.center,
                          lineHeight: 1.6,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: GestureDetector(
                        onTap: () {
                          (_currentIndex == _onBoardingContent.length - 1)
                          // RequestLocationPermission()
                              ? Get.to(() => RequestLocationPermission(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 500))
                              : _pageController.nextPage(
                                  duration: Duration(
                                    milliseconds: 700,
                                  ),
                                  curve: Curves.easeInOutCubic,
                                );
                        },
                        child: Center(
                          child: CircularPercentIndicator(
                            radius: 38.0,
                            lineWidth: 2.0,
                            percent: _currentIndex.toDouble() /
                                (_onBoardingContent.length - 1),
                            animation: true,
                            restartAnimation: false,
                            center: GestureDetector(
                              child: Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                  color: kSecondaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      (_currentIndex ==
                                              _onBoardingContent.length - 1)
                                          ? () {}
                                          : _pageController.nextPage(
                                              duration: Duration(
                                                milliseconds: 700,
                                              ),
                                              curve: Curves.easeInOutCubic,
                                            );
                                    },
                                    child: Image.asset(
                                      Assets.imagesArrowNext,
                                      width: 17.38,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            backgroundColor: kLightGreyColor,
                            progressColor: kSecondaryColor,
                          ),
                        ),
                      ),
                  ),
                  
               
                ],
              ),
             
            ],
          ),
        ],
      ),
    );
  }
}
