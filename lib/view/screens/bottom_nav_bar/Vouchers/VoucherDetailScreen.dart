import 'package:flutter/material.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_fonts.dart';
import 'package:was_gibts_in/constants/app_styling.dart';
import 'package:was_gibts_in/view/widget/custom_appbar_widget.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class VoucherDetailScreen extends StatelessWidget {
  const VoucherDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:CustomAppBar(
          title: 'Vouchers',
          action: [
            GestureDetector(
              onTap: () {
                // showModalBottomSheet(
                //     context: context, builder: (context) => FilterSheet());
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: kSecondaryColor,
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/Vector.png",
                      height: 20,
                      width: 20,
                    ),
                  )),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/voucherCard.png"),
              SizedBox(height: 10),
               MyText(
                paddingTop: 20,
                text: 'Voucher Benefits',
                size: 12,
                weight: FontWeight.w600,
                paddingBottom: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 6,
                    width: 22,
                    decoration: AppStyling.INDICATOR,
                  ),
                ],
              ),
              SizedBox(height: 15),
              MyText(text:"A 30% Discount",size: 14,weight: FontWeight.w600,),
              SizedBox(height: 5),
              MyText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempo",
              size: 12,weight: FontWeight.w400,color: Color(0xff484848),
              ),
               SizedBox(height: 15),
              MyText(text:"A Free Drink",size: 14,weight: FontWeight.w600,),
              SizedBox(height: 5),
              MyText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempo",
              size: 12,weight: FontWeight.w400,color: Color(0xff484848),
              ),
              SizedBox(height: 20),
              MyText(
                paddingTop: 20,
                text: 'Participated Companies',
                size: 12,
                weight: FontWeight.w600,
                paddingBottom: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 6,
                    width: 22,
                    decoration: AppStyling.INDICATOR,
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(height: 20),
              GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, mainAxisExtent: 50),
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xffD9D9D9),
                      ),
                      SizedBox(width: 10),
                      MyText(
                        text: "Company",
                        size: 10,
                        fontFamily: AppFonts.MONTSERRAT,
                      ),
                    ],
                  );
                },
              )
                     
              ],
            ),
          ),
        ),
    );
  }
}