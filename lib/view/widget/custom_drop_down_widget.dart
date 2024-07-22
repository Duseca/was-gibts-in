import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_fonts.dart';
import 'package:was_gibts_in/constants/app_images.dart';
import 'package:was_gibts_in/main.dart';
import 'package:was_gibts_in/view/widget/common_image_view_widget.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

// ignore: must_be_immutable
class CustomDropDown extends StatelessWidget {
  CustomDropDown({
    required this.hint,
    required this.items,
    this.selectedValue,
    required this.onChanged,
  });

  final List<String>? items;
  String? selectedValue;
  final ValueChanged<dynamic>? onChanged;
  String hint;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            items: List.generate(
              items!.length,
              (index) {
                return DropdownMenuItem<dynamic>(
                  value: items![index],
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1.0,
                          color: kGreyColor3.withOpacity(0.32),
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        CommonImageView(
                          height: 28,
                          width: 28,
                          radius: 100.0,
                          url: dummyImg,
                        ),
                        Expanded(
                          child: MyText(
                            paddingLeft: 12,
                            text: items![index],
                            size: 12,
                            weight: FontWeight.w500,
                            color: kGreyColor2,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            value: selectedValue,
            onChanged: onChanged,
            isDense: true,
            isExpanded: false,
            customButton: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 1.0,
                        color: kSecondaryColor,
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          Assets.imagesSearch,
                          height: 24,
                          color: kSecondaryColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: AppFonts.MONTSERRAT,
                                    color: kBlackColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'in ',
                                    ),
                                    TextSpan(
                                      text: selectedValue == hint
                                          ? hint
                                          : selectedValue!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: kSecondaryColor,
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
            menuItemStyleData: MenuItemStyleData(
              height: 50,
              padding: EdgeInsets.zero,
            ),
            dropdownStyleData: DropdownStyleData(
              elevation: 3,
              maxHeight: 400,
              offset: Offset(0, -5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: kPrimaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
