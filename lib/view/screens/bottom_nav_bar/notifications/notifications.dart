import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_images.dart';
import 'package:was_gibts_in/constants/app_sizes.dart';
import 'package:was_gibts_in/main.dart';
import 'package:was_gibts_in/view/screens/drawer/app_drawer.dart';
import 'package:was_gibts_in/view/widget/common_image_view_widget.dart';
import 'package:was_gibts_in/view/widget/custom_appbar_widget.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDrawer(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Notifications',
        ),
        body: ListView.builder(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT_PADDING,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return _NotificationTile(
              image: dummyImg,
              notificationText: 'You have new notification.',
              time: '8 hours ago',
              isNew: index == 0,
              onTap: () {
                ZoomDrawer.of(context)!.isOpen()
                    ? ZoomDrawer.of(context)!.close()
                    : ZoomDrawer.of(context)!.open();
              },
            );
          },
        ),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({
    required this.notificationText,
    required this.time,
    required this.isNew,
    required this.onTap,
    required this.image,
  });

  final String image, notificationText, time;
  final bool isNew;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: Color(0xff787C8E).withOpacity(0.3),
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: kSecondaryColor,
                ),
              ),
              child: CommonImageView(
                height: Get.height,
                width: Get.width,
                radius: 100.0,
                url: image,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyText(
                    text: notificationText,
                    size: 14,
                    weight: FontWeight.w500,
                    color: kTertiaryColor,
                    paddingBottom: 6,
                  ),
                  MyText(
                    text: time,
                    size: 12,
                    color: kGreyColor4,
                  ),
                ],
              ),
            ),
            if (isNew)
              Image.asset(
                Assets.imagesIsNew,
                height: 21,
              ),
          ],
        ),
      ),
    );
  }
}
