import 'package:flutter/material.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class NearbyBottomSheetHandle extends StatelessWidget {
  const NearbyBottomSheetHandle({
    super.key,
    required this.controller,
  });

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      child: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: GlowingOverscrollIndicator(
          color: kPrimaryColor,
          axisDirection: AxisDirection.down,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  height: 6,
                  width: 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kSecondaryColor,
                  ),
                ),
              ),
              MyText(
                text: 'Nearby places',
                size: 16,
                weight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
