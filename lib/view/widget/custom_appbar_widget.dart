import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_images.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    this.title,
    this.action,
    this.backgroundColor,
    this.drawerColor,
    this.textColor,
  });
 Color?  backgroundColor;
  String? title;
  var action;
  Color? drawerColor;
  Color? textColor;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor??Colors.white,
      centerTitle: true,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              ZoomDrawer.of(context)!.isOpen()
                  ? ZoomDrawer.of(context)!.close()
                  : ZoomDrawer.of(context)!.open();
            },
            child: Image.asset(
              Assets.imagesMenu,
              height: 12,
              color: drawerColor??Colors.black,
            ),
          ),
        ],
      ),
      title: MyText(
        text: title ?? '',
        size: 16,
        color:textColor?? kTertiaryColor,
        weight: FontWeight.w600,
      ),
      actions: action,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(57);
}
