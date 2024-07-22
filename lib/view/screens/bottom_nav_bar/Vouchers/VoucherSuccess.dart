import 'package:flutter/material.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/Vouchers/vouchers.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';
import 'package:dotted_line/dotted_line.dart';

import '../../../widget/custom_appbar_widget.dart';

class VoucherSuccessScreen extends StatelessWidget {
  const VoucherSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Vouchers',
        action: [
          Container(
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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            MyText(
              text: "Voucher Purchase\nSuccessful",
              size: 16,
              weight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              height: 30,
              width: 120,
              child: MyText(
                  text: "Successful", color: Color(0xff429EBE), size: 14.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xff429EBE).withOpacity(0.1)),
            ),
            SizedBox(height: 20),
            GestureDetector(
                onTap: () {},
                child: Image.asset("assets/images/voucherCard.png")),
                SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Row(
              children: [MyText(text: "Date",color: Color(0xff747D82),size: 13,), Spacer(), MyText(text:"02/02/2021",size: 13,)],
            ),
            SizedBox(height: 10),
            dotedLine(),
             SizedBox(height: 10),
            Row(
              children: [MyText(text:"Reference",color: Color(0xff747D82),size: 13,), Spacer(), MyText(text:"Gift Card",size: 13,),],
            ),
             SizedBox(height: 10),
            dotedLine(),
             SizedBox(height: 10),
            Row(
              children: [MyText(text:"Amount",color: Color(0xff747D82),size: 13,), Spacer(), MyText(text:"1,000 IQD",size: 13,),],
            ),
             SizedBox(height: 10),
            dotedLine(),
            SizedBox(height: 25),
            CompanySheet(showDash: false),
          ],
        ),
      ),
    );
  }

  DottedLine dotedLine() {
    return DottedLine(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            lineLength: double.infinity,
            lineThickness: 1.0,
            dashLength: 8.0,
            dashColor: Color(0xffBAC7CD),
            dashRadius: 0.9,
            dashGapLength: 3.0,
          );
  }
}
