import 'dart:io';
import 'package:aust_textile_alumni/app/modules/user_post/model/chip_model.dart';
import 'package:aust_textile_alumni/app/modules/user_post/views/test_view.dart';
import 'package:aust_textile_alumni/app/routes/app_pages.dart';
import 'package:aust_textile_alumni/app/utill/app_colors.dart';
import 'package:aust_textile_alumni/app/utill/constant.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../controllers/user_post_controller.dart';
import 'global_post.dart';
import 'job_post.dart';

class UserPostView extends StatefulWidget {
  @override
  State<UserPostView> createState() => _UserPostViewState();
}

class _UserPostViewState extends State<UserPostView> {
  List<String> dropDownPostItem = [
    "Menu 1",
    "Menu 2",
  ];

  var selectedItem;

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime(2000, 11, 01),
    end: DateTime(2050, 11, 11),
  );

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (newDateRange == null) return;
    setState(() {
      dateRange = newDateRange;
    });
  }

  UserPostController controller = Get.put(UserPostController());
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;

    final start = dateRange.start;
    final end = dateRange.end;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Post",
            style: GoogleFonts.poppins(
                color: Colors.green, fontSize: screenHeigth * 0.017),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: screenHeigth * 0.022,
                right: screenHeigth * 0.022,
              ),
              child: Container(
                height: screenHeigth * 0.001,
                color: Colors.green,
                width: screenWidth,
              ),
            ),
            Container(
              height: screenHeigth * 0.070,
              width: screenWidth,
              decoration: BoxDecoration(
                  // color: Color(0xffE5E5E5),
                  ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TabBar(
                  // indicatorColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 4,
                      color: Color(0xFF0FA958),
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 0),
                  ),
                  isScrollable: true,
                  labelColor: Colors.black,
                  tabs: [
                    Text(
                      "Global post",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color(0xff333333),
                        ),
                      ),
                    ),
                    Text(
                      "Job post",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color(0xff333333),
                        ),
                      ),
                    ),
                    Text(
                      "My post",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color(0xff333333),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  GlobalPostView(),
                  JobPostView(),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: screenHeigth * 0.020,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: Container(
                                height: screenHeigth * 0.070,
                                width: screenWidth - 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xffE5E5E5),
                                      blurRadius: 5.0, // soften the shadow
                                      spreadRadius: 3.0, //extend the shadow
                                      offset: Offset(
                                        0.0, // Move to right 5  horizontally
                                        0.0, // Move to bottom 5 Vertically
                                      ),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                  // border: Border.all(
                                  //   color: Color(0xffC4C4C4),
                                  //   width: 2,
                                  // ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                          ),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Expanded(
                                        flex: 1,
                                        child: Icon(
                                          Icons.search,
                                          size: screenHeigth * 0.045,
                                          color: Color(0xff777777),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenHeigth * 0.030,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.calendar_month),
                                  SizedBox(
                                    width: screenWidth * 0.020,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      pickDateRange();
                                    },
                                    child: Text(
                                        '${start.year}  ${start.month.toString()}  ${start.day}'),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.010,
                                  ),
                                  Text("-"),
                                  SizedBox(
                                    width: screenWidth * 0.010,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      pickDateRange();
                                    },
                                    child: Text(
                                        '${end.year}  ${end.month}  ${end.day}'),
                                  ),
                                  Spacer(),
                                  Text("All post"),
                                  SizedBox(
                                    width: screenWidth * 0.010,
                                  ),
                                  Icon(
                                    Icons.filter_list,
                                  ),
                                ],
                              ),
                            ),
                            //  Post List....................................../Post List....................................../Post list post list Start
                            SizedBox(
                              height: screenHeigth * 0.050,
                            ),
                            mypost_list(
                              screenWidth: screenWidth,
                              screenHeigth: screenHeigth,
                            ),
                            SizedBox(
                              height: screenHeigth * 0.050,
                            ),
                            mypost_list(
                              screenWidth: screenWidth,
                              screenHeigth: screenHeigth,
                            ),
                            SizedBox(
                              height: screenHeigth * 0.050,
                            ),
                            mypost_list(
                              screenWidth: screenWidth,
                              screenHeigth: screenHeigth,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class mypost_list extends StatelessWidget {
  const mypost_list({
    Key? key,
    required this.screenWidth,
    required this.screenHeigth,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeigth;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                        ),
                        SizedBox(
                          width: screenWidth * 0.020,
                        ),
                        Text("30 oct 1992"),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              color: Color(0xffF2C94C)),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Help"),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.020,
                        ),
                        Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("General Post"),
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: screenHeigth * 0.010,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(
                        "assets/images/dubai.jpg",
                        height: 100,
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: screenHeigth * 0.015,
                    ),
                    Image.asset(
                      "assets/images/edit.png",
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                SizedBox(
                  width: screenWidth * 0.030,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        longText,
                        maxLines: 5,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: screenHeigth * 0.016,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("#help"),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.020,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("#help"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
