import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:was_gibts_in/constants/app_sizes.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class OpeningHours extends StatelessWidget {
  var data;
  OpeningHours({super.key,this.data});

  final List<String> _weekDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  Map d = {
    "name":"kamran"
  };
  @override
  Widget build(BuildContext context) {
   var day =DateTime.now();
    String dayOfWeek = DateFormat('EEEE').format(day);
     print(dayOfWeek);
    print(data['time'][dayOfWeek]['openingTime']);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _weekDays.length,
      padding: AppSizes.DEFAULT_HORIZONTAL,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 90,
                child: MyText(
                  text: _weekDays[index],
                  size: 12,
                ),
              ),
              Expanded(
                child: Container(
                  height: 1,
                  color: Color(0xff737479).withOpacity(0.2),
                ),
              ),
              MyText(
                paddingLeft: index == 0 ? 23 : 27,
                text: data['time']['Monday']['openingTime'],
                size: 12,
                weight: index == 0 ? FontWeight.bold : FontWeight.w400,
              ),

                MyText(
                paddingLeft: index == 0 ? 23 : 27,
                text: data['time']['Monday']['closingTime'],
                size: 12,
                weight: index == 0 ? FontWeight.bold : FontWeight.w400,
              ),
            ],
          ),
        );
      },
    );
  
  }
}
