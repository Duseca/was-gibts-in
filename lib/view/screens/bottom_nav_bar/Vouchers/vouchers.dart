import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_fonts.dart';
import 'package:was_gibts_in/constants/app_sizes.dart';
import 'package:was_gibts_in/constants/app_styling.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/Vouchers/VoucherDetailScreen.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/Vouchers/VoucherSuccess.dart';
import 'package:was_gibts_in/view/screens/drawer/app_drawer.dart';
import 'package:was_gibts_in/view/widget/custom_appbar_widget.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class VouchersPage extends StatelessWidget {
  const VouchersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDrawer(
      child: Scaffold(
        appBar: CustomAppBar(
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
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT_PADDING,
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "Participated Companies Vouchers",
                  weight: FontWeight.w600,
                  color: Colors.black,
                  size: 14,
                  fontFamily: AppFonts.MONTSERRAT,
                ),
                SizedBox(height: 20),
                for (int i = 0; i < 3; i++) ...[
                  
                     GestureDetector(
                      onTap: () {
                        Get.to(()=>VoucherDetailScreen());
                      },
                      child: Image.asset("assets/images/voucherCard.png")),
                  SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => CompanySheet(),
                      );
                    },
                    child: Image.asset(
                      "assets/images/totalVoucher.png",
                      width: 170,
                      height: 40,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ]
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CompanySheet extends StatelessWidget {
 bool showDash;
   CompanySheet({
    super.key,
    this.showDash = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         showDash==true?   Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: 5,
                width: 57,
                decoration: BoxDecoration(
                    color: Color(0xffC7C3C3),
                    borderRadius: BorderRadius.circular(5)),
              ),
            )
          : SizedBox(),
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
    );
  }
}

class FilterSheet extends StatelessWidget {
  const FilterSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: MediaQuery.of(context).size.height * 0.55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              height: 5,
              width: 57,
              decoration: BoxDecoration(
                  color: Color(0xffC7C3C3),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: MyText(
                  text: "Cancel",
                  size: 13,
                  fontFamily: "poppins",
                  weight: FontWeight.w500,
                  color: Color(0xff7BC2FF),
                ),
              ),
              Spacer(),
              MyText(
                  text: "Filter",
                  size: 20,
                  weight: FontWeight.w500,
                  fontFamily: "poppins",
                  color: kBlackColor),
              Spacer(),
              MyText(
                text: "Reset",
                size: 13,
                fontFamily: "poppins",
                weight: FontWeight.w500,
                color: Color(0xff7BC2FF),
              ),
            ],
          ),
          SizedBox(height: 20),
          MyText(
            text: "Select Company",
            fontFamily: "poppins",
            size: 12,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                border: Border.all(
              color: Color(0xffECECEC),
            )),
            width: MediaQuery.of(context).size.width,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                padding: EdgeInsets.symmetric(horizontal: 10),
                value: "Vapodorm",
                items: [
                  DropdownMenuItem(
                    child: MyText(
                      text: "Vapodorm",
                      fontFamily: "poppins",
                      weight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    value: "Vapodorm",
                  ),
                  DropdownMenuItem(
                    child: Text("non select"),
                    value: "non select",
                  )
                ],
                onChanged: (value) {},
              ),
            ),
          ),
          SizedBox(height: 15),
          MyText(
            text: "Select City",
            fontFamily: "poppins",
            size: 12,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                border: Border.all(
              color: Color(0xffECECEC),
            )),
            width: MediaQuery.of(context).size.width,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                padding: EdgeInsets.symmetric(horizontal: 10),
                value: "Istanbul",
                items: [
                  DropdownMenuItem(
                    child: MyText(
                      text: "Istanbul",
                      fontFamily: "poppins",
                      weight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    value: "Istanbul",
                  ),
                  DropdownMenuItem(
                    child: Text("non select"),
                    value: "non select",
                  )
                ],
                onChanged: (value) {},
              ),
            ),
          ),
          SizedBox(height: 15),
          MyText(
            text: "Select Category",
            fontFamily: "poppins",
            size: 12,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                border: Border.all(
              color: Color(0xffECECEC),
            )),
            width: MediaQuery.of(context).size.width,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                padding: EdgeInsets.symmetric(horizontal: 10),
                value: "Vapes",
                items: [
                  DropdownMenuItem(
                    child: MyText(
                      text: "Vapes",
                      fontFamily: "poppins",
                      weight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    value: "Vapes",
                  ),
                  DropdownMenuItem(
                    child: Text("non select"),
                    value: "non select",
                  )
                ],
                onChanged: (value) {},
              ),
            ),
          ),
          SizedBox(height: 15),
          buildButton(
              text: "Apply Filter",
              onTap: () {
                   Navigator.pop(context);
              Get.to(()=> VoucherSuccessScreen(),transition: Transition.downToUp,duration: Duration(milliseconds: 400));
              })
        ],
      ),
    );
  }
}

class buildButton extends StatelessWidget {
  VoidCallback? onTap;
  String? text;
  buildButton({super.key, this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff7BC2FF),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          height: 45,
          width: MediaQuery.of(context).size.width * 0.88,
          child: MyText(
            text: text.toString(),
            size: 13,
            weight: FontWeight.w500,
            fontFamily: "poppins",
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
