import 'package:flutter/material.dart';
import 'package:was_gibts_in/constants/app_sizes.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class AboutCompany extends StatelessWidget {
  AboutCompany({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.DEFAULT_HORIZONTAL,
      physics: BouncingScrollPhysics(),
      children: [
        MyText(
          text: 'From the C.E.O',
          size: 14,
          weight: FontWeight.bold,
        ),
        MyText(
          paddingTop: 8,
          text:
              '“ Club 59 exclusively offers only 59 members in the heart of Bamberg the opportunity to focus on their own training. Instead of queuing and being watched, you can use your time for yourself and your training with us!',
          size: 12,
          lineHeight: 1.5,
        ),
      ],
    );
  }
}
