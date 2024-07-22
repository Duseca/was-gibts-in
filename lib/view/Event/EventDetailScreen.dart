import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/view/screens/drawer/app_drawer.dart';
import 'package:was_gibts_in/view/widget/custom_appbar_widget.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class EventDetails extends StatelessWidget {
  String? image;
  EventDetails({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return AppDrawer(
      child: Scaffold(
       
        body: SlidingUpPanel(
          color: Colors.transparent,
          minHeight: MediaQuery.of(context).size.height * 0.75,
          maxHeight: MediaQuery.of(context).size.height * 0.75,
          panel: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40),)
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    MyText(text: "Music Event",size: 22,weight: FontWeight.w600,),
                   SizedBox(height: 20),
                    MyText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    size:  12,
                    weight: FontWeight.w500,
                    color: Color(0xff868686),
                    ),
                     SizedBox(height: 20),
                    MyText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    size:  12,
                    weight: FontWeight.w500,
                    color: Color(0xff868686),
                    ),
                    SizedBox(height: 10),
                   Divider(
                    thickness: 1,
                    color: Color(0xffE1E1E1),
                   ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(text: "Date",size: 18,weight: FontWeight.w600),
                          MyText(text: "Thursday, May 23, 2023",size: 12,weight: FontWeight.w500,color: Color(0xff868686),)
                        ],
                      )
                    ,Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(text: "Time",size: 18,weight: FontWeight.w600),
                          MyText(text: "9:00 PM - 10:00 PMW",size: 12,weight: FontWeight.w500,color: Color(0xff868686),)
                        ],
                      ),
                
                     
                   
                    ],
                   ),
                    SizedBox(height: 20),
                      MyText(text: "Location",size: 18,weight: FontWeight.w600,),
                      
                   SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset("assets/location.png",height: 150,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,))
                  
                  ],
                ),
              ),
            ),
          ),
          isDraggable: false,
          body: Stack(
            children: [
              Image.network(
                image.toString(),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
             CustomAppBar(
             backgroundColor: Colors.transparent,
             drawerColor: Colors.white,
             textColor: Colors.white,
            title:  'Club 59',
          ),
            ],
          ),
        ),
      ),
    );
  }
}
