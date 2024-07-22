import 'package:flutter/material.dart';
import 'package:was_gibts_in/constants/app_colors.dart';

class AppStyling {
  static const BOTTOM_SHEET_DEC = BoxDecoration(
    color: kPrimaryColor,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(28),
      topRight: Radius.circular(28),
    ),
  );
  static final INDICATOR = BoxDecoration(
    color: kSecondaryColor,
    borderRadius: BorderRadius.circular(50),
  );
}
