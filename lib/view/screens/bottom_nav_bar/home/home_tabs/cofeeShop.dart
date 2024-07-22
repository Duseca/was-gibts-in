import 'package:flutter/material.dart';
import 'package:was_gibts_in/main.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/home/home_tabs/restaurants.dart';

class CopeShope extends StatelessWidget {
  var dataList;
   CopeShope({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
            var list = dataList.where((e)=> e['type']== "copy").toList();

    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 14),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return RestaurantCard(
            profileImage: dummyImg,
            personName: 'Amanda',
            coverImage: list[index]['image'],
            description:
                'Padar Island, Caribben Sensation in Eastern Indonasia',
            likes: '2,145',
            comments: '145',
            onTap: () {},
          );
        },
      ),
    );
  }
}
