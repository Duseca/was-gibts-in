import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:was_gibts_in/SweepTask/SweepTask.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_images.dart';
import 'package:was_gibts_in/view/screens/location/change_location.dart';
import 'package:was_gibts_in/view/widget/common_image_view_widget.dart';
import 'package:was_gibts_in/view/widget/custom_route_widget.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({
    super.key,
    required this.child,
  });

  final _controller = ZoomDrawerController();

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _controller,
      style: DrawerStyle.defaultStyle,
      menuScreen: _Menu(),
      mainScreen: child,
      borderRadius: 24.0,
      showShadow: true,
      angle: 0.0,
      menuBackgroundColor: kSecondaryColor,
      drawerShadowsBackgroundColor: Color(0xff1990F6),
      slideWidth: MediaQuery.of(context).size.width * .7,
      mainScreenScale: 0.16,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
    );
  }
}

class _Menu extends StatefulWidget {
  @override
  State<_Menu> createState() => _MenuState();
}

class _MenuState extends State<_Menu> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12, top: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              CommonImageView(
                height: 50,
                width: 50,
                radius: 100.0,
                imagePath: Assets.imagesDrawerLogo,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    MyText(
                      text: 'WAS GIBTS IN',
                      weight: FontWeight.bold,
                      color: kPrimaryColor,
                      size: 12,
                    ),
                    MyText(
                      paddingTop: 6,
                      text: 'Erlebe Deine Stadt neu',
                      weight: FontWeight.w600,
                      size: 8,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 1,
            color: kPrimaryColor,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              children: [
                ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final List<String> _items = [
                      'Contests',
                      'Locations',
                      'Sweepstake',
                      'Become a Partner',
                      'Contact Us',
                    ];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                        });

                        if (_currentIndex == 1) {
                          ZoomDrawer.of(context)!.close();

                         
                            Get.to(()=> ChangeLocation());
                        
                        }
                        if (_currentIndex == 2) {
                          ZoomDrawer.of(context)!.close();

                         
                            Get.to(()=> SweepTaskScreen());
                        
                        }

                      },
                      child: AnimatedContainer(
                        duration: Duration(
                          milliseconds: 160,
                        ),
                        alignment: Alignment.centerLeft,
                        height: 37,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: _currentIndex == index
                              ? kPrimaryColor
                              : kSecondaryColor,
                        ),
                        child: MyText(
                          paddingLeft: 10,
                          text: _items[index],
                          size: 14,
                          color: _currentIndex == index
                              ? Color(0xff1990F6)
                              : kPrimaryColor,
                          weight: FontWeight.w600,
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 1,
                  color: kPrimaryColor,
                ),
                MyText(
                  text: 'Contest Terms',
                  color: kPrimaryColor,
                  paddingBottom: 9,
                  size: 10,
                  weight: FontWeight.w600,
                ),
                MyText(
                  text: 'Privacy Policy',
                  color: kPrimaryColor,
                  paddingBottom: 9,
                  size: 10,
                  weight: FontWeight.w600,
                ),
                MyText(
                  text: 'App Version 1.0',
                  color: kPrimaryColor,
                  size: 10,
                  weight: FontWeight.w600,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 1,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
          MyText(
            text: 'Follow Us',
            color: kPrimaryColor,
            paddingBottom: 9,
            size: 12,
            weight: FontWeight.w600,
          ),
          Wrap(
            spacing: 18,
            children: [
              CommonImageView(
                height: 36,
                width: 36,
                imagePath: Assets.imagesCircle,
              ),
              CommonImageView(
                height: 36,
                width: 36,
                imagePath: Assets.imagesCircle,
              ),
              CommonImageView(
                height: 36,
                width: 36,
                imagePath: Assets.imagesCircle,
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
