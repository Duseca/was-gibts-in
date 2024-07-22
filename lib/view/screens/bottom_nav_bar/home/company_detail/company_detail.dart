import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:was_gibts_in/constants/app_colors.dart';
import 'package:was_gibts_in/constants/app_fonts.dart';
import 'package:was_gibts_in/constants/app_sizes.dart';
import 'package:was_gibts_in/main.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/home/company_detail/about_company.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/home/company_detail/contact_us.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/home/company_detail/keywords.dart';
import 'package:was_gibts_in/view/screens/bottom_nav_bar/home/company_detail/opening_hours.dart';
import 'package:was_gibts_in/view/screens/drawer/app_drawer.dart';
import 'package:was_gibts_in/view/widget/common_image_view_widget.dart';
import 'package:was_gibts_in/view/widget/custom_appbar_widget.dart';
import 'package:was_gibts_in/view/widget/custom_tab_indicator_widget.dart';
import 'package:was_gibts_in/view/widget/my_text_widget.dart';

class CompanyDetail extends StatefulWidget {
  CompanyDetail({
    super.key,
    this.haveTitle = true,
    this.title,
    this.data,
  });
  var data;
  bool? haveTitle;
  String? title;

  @override
  State<CompanyDetail> createState() => _CompanyDetailState();
}

class _CompanyDetailState extends State<CompanyDetail>
    with SingleTickerProviderStateMixin {
  final List<String> _dummyImages = [
    dummyClub,
    dummyImg,
    dummyClub,
    dummyImg,
    dummyClub,
    dummyImg,
    dummyClub,
    dummyImg,
    dummyClub,
  ];

  late TabController _tabController;

  int _currentTab = 0;

  final List<String> _tabs = [
   'About Company',
    'Opening Hours',
    'Contact Us',
  ];

  // final List<Widget> _tabBarView = [
  //   OpeningHours(),
  //   AboutCompany(),
  //   ContactUs(),
  //   Keywords(),
  // ];
  String dayOfWeek = '';

  @override
  void initState() {
    var day = DateTime.now();
    dayOfWeek = DateFormat('EEEE').format(day);
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTab = _tabController.index;
      });
    });
  }

  final List<String> _weekDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  bool isGreen = true;
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var CurrentTime = DateFormat.Hm().format(now);
    var currentSplitList = CurrentTime.split(":").toList();
    var currentHour = currentSplitList[0];
    var currentMint = currentSplitList[1];
    print(CurrentTime);
    var daysList = widget.data['time'].keys.toList();
    var closingTime = widget.data['time'][dayOfWeek]['closingTime'];
    print(closingTime);
    var splitList = closingTime.split(":").toList();
    var closingHour = splitList[0];
    var closingMint = splitList[1];
    print("hour $closingHour");
    print("mnit $closingMint");
    if (int.parse(closingHour) > int.parse(currentHour)) {
       isGreen = true;
      print("green da");
    } else {
      isGreen = false;
    }
     if(int.parse(closingHour) == int.parse(currentHour)){
     if(int.parse(closingMint) > int.parse(currentMint)){
     isGreen = true;
     }else{
      isGreen = false;
     }
      }

    return AppDrawer(
      child: Scaffold(
        appBar: CustomAppBar(
          title: widget.title ?? 'Club 59',
        ),
        body: ListView(
          shrinkWrap: true,
          padding: AppSizes.DEFAULT_VERTICAL,
          physics: BouncingScrollPhysics(),
          children: [
            if (widget.haveTitle!)
              MyText(
                text: '“ YOUR training + YOUR time = YOUR GYM “',
                size: 12,
                weight: FontWeight.bold,
                textAlign: TextAlign.center,
                paddingBottom: 24,
              ),
            SizedBox(
              height: 255,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 20),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: _dummyImages.length,
                itemBuilder: (context, index) {
                  if (index.isEven) {
                    return Column(
                      children: [
                        Expanded(
                          flex: 8,
                          // child: Image.asset(widget.image,   width: 138,fit: BoxFit.cover,)
                          child: CommonImageView(
                            height: Get.height,
                            width: 138,
                            radius: 8,
                            url: widget.data['image'],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          flex: 3,
                          // child: Image.asset(widget.image,   width: 138,fit: BoxFit.cover,)
                          child: CommonImageView(
                            height: Get.height,
                            width: 138,
                            radius: 8,
                            url: widget.data['image'],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      //child: Image.asset(widget.image,   width: 138,fit: BoxFit.cover,),
                      child: CommonImageView(
                        height: Get.height,
                        width: 138,
                        radius: 8,
                        url: widget.data['image'],
                      ),
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: AppSizes.DEFAULT_HORIZONTAL,
              child: Row(
                children: [
                  CommonImageView(
                    height: 50,
                    width: 50,
                    url: widget.data['image'],
                    radius: 100.0,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: widget.data['name'],
                          size: 14,
                          weight: FontWeight.bold,
                          paddingBottom: 6,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: MyText(
                            text: 'Sports',
                            size: 8,
                            weight: FontWeight.w600,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                          radius: 5,
                          backgroundColor: isGreen ? Colors.green : kGreyColor),
                      MyText(
                        text: dayOfWeek,
                        size: 12.sp,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            TabBar(
              tabAlignment: TabAlignment.start,
              padding: EdgeInsets.symmetric(horizontal: 20),
              physics: BouncingScrollPhysics(),
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: CustomTabIndicator(
                color: kSecondaryColor,
                height: 6,
                horizontalRadius: 50,
                indicatorWidth: 22,
              ),
              controller: _tabController,
              labelColor: kTertiaryColor,
              unselectedLabelColor: kGreyColor3,
              labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.MONTSERRAT,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.MONTSERRAT,
              ),
              tabs: List.generate(
                _tabs.length,
                (index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: 12,
                    ),
                    child: Text(
                      _tabs[index],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            IndexedStack(
              index: _currentTab,
              children: [
                AboutCompany(),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: daysList.length,
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
                              text: daysList[index],
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
                            text: widget.data['time'][daysList[index]]
                                ['openingTime'],
                            size: 12,
                            weight:
                                index == 0 ? FontWeight.bold : FontWeight.w400,
                          ),
                          MyText(
                            paddingLeft: index == 0 ? 23 : 27,
                            text: widget.data['time'][daysList[index]]
                                ['closingTime'],
                            size: 12,
                            weight:
                                index == 0 ? FontWeight.bold : FontWeight.w400,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                ContactUs(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
