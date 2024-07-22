import 'package:flutter/material.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_sizes.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class Keywords extends StatelessWidget {
  Keywords({super.key});

  final List<String> _keywords = [
    'Gym',
    'Sports',
    'Training',
    'Gym',
    'Sports',
    'Training',
    'Gym',
    'Sports',
    'Training',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.DEFAULT_HORIZONTAL,
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(
          height: 12,
        ),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: List.generate(
            _keywords.length,
            (index) {
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: MyText(
                  text: _keywords[index],
                  size: 10,
                  weight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
