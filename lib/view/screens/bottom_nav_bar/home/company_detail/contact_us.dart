import 'package:flutter/material.dart';
import 'package:was_gibts_in/constants/app_images.dart';
import 'package:was_gibts_in/constants/app_sizes.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class ContactUs extends StatelessWidget {
  ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: AppSizes.DEFAULT_HORIZONTAL,
      physics: BouncingScrollPhysics(),
      children: [
       
                      
                   SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset("assets/location.png",height: 150,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,))
                  ,
        // _contactTile(
      //   icon: Assets.imagesPhone
        //   title: '0951 18084888',
        // ),
        // _contactTile(
        //   icon: Assets.imagesWeb,
        //   title: 'www.club59-deingym.de',
        // ),
        // _contactTile(
        //   icon: Assets.imagesMail,
        //   title: 'info@club59-deingym.de',
        // ),
        // _contactTile(
        //   icon: Assets.imagesLocation,
        //   title: 'bere Koenigstrasse 31, 96052 Bamberg',
        // ),
      
      ],
    );
  }

  Widget _contactTile({
    required String icon,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Image.asset(
            icon,
            height: 16,
            width: 16,
          ),
          Expanded(
            child: MyText(
              paddingLeft: 10,
              text: title,
              size: 12,
            ),
          ),
        ],
      ),
    );
  }
}
