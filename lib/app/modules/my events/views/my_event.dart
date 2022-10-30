import 'package:aust_textile_alumni/app/utill/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyEvents extends StatelessWidget {
  const MyEvents({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Color(0xffE5E5E5),
          leading: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          title: Text(
            "My Events",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: screenHeigth * 0.017,
                color: Color(0xff0FA958),
              ),
            ),
          ),
          bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                color: Color(0xff00602B),
                height: 2.0,
              ),
            ),
            preferredSize: Size.fromHeight(4.0),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: ListView.separated(
              itemBuilder: ((context, index) {
                return Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Image.asset(
                                  "assets/images/dubai.jpg",
                                  height: 80,
                                  width: 100,
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "seminer on carer path".toUpperCase(),
                                    style: TextStyle(
                                      fontFamily: "Ubuntu",
                                      fontSize: screenWidth * 0.040,
                                    ),
                                  ),
                                  Text(
                                    longText,
                                    maxLines: 4,
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeigth * 0.008,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Color(0xff56CCF2),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_sharp,
                                      size: screenWidth * 0.040,
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.010,
                                    ),
                                    Text(
                                      "12.30 Pm | 29 December 2022",
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // 2nd container........................................2nd container..................//

                            // SizedBox(
                            //   width: screenWidth * 0.010,
                            // ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Color(0xff2F80ED),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month_sharp,
                                      color: Colors.white,
                                      size: screenWidth * 0.040,
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.010,
                                    ),
                                    Text(
                                      "semener",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // 3rd container........................................3rd container..................//
                            // SizedBox(
                            //   width: screenWidth * 0.010,
                            // ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: Color(0xff0FA958),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.white,
                                      size: screenWidth * 0.040,
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.010,
                                    ),
                                    Text(
                                      "Paid",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: screenWidth * 0.010,
                            // ),
                            Icon(Icons.qr_code),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
              separatorBuilder: ((context, index) {
                return SizedBox(
                  height: screenHeigth * 0.015,
                );
              }),
              itemCount: 20),
        ),
      ),
    );
  }
}
