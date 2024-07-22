import 'package:flutter/material.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_images.dart';
import 'package:was_gibts_in/view/widget/common_image_view_widget.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    super.key,
    required this.image,
    required this.name,
    required this.occupation,
    required this.distance,
    required this.timeRequired,
    required this.onViewDetail,
    required this.onMore,
  });

  final String image, name, occupation, distance, timeRequired;
  final VoidCallback onViewDetail;
  final VoidCallback onMore;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1.0,
          color: kSecondaryColor,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CommonImageView(
                height: 48,
                width: 48,
                radius: 100.0,
                url: image,
              ),
              Positioned(
                bottom: 0,
                right: 2,
                child: Image.asset(
                  Assets.imagesOnline,
                  height: 12,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: MyText(
                        text: name,
                        size: 16,
                        weight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: onMore,
                      child: Image.asset(
                        Assets.imagesMoreHoriz,
                        height: 4,
                      ),
                    ),
                  ],
                ),
                MyText(
                  paddingTop: 4,
                  text: occupation,
                  size: 14,
                  color: kGreyColor,
                  paddingBottom: 10,
                  weight: FontWeight.w500,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: '$distance km   .   $timeRequired mins',
                      size: 10,
                      color: kGreyColor,
                    ),
                    MyText(
                      onTap: onViewDetail,
                      text: 'View details',
                      size: 10,
                      weight: FontWeight.bold,
                      color: kSecondaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
