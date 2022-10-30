import 'package:aust_textile_alumni/app/utill/constant.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyEventsDetails extends StatefulWidget {
  const MyEventsDetails({super.key});

  @override
  State<MyEventsDetails> createState() => _MyEventsDetailsState();
}

class _MyEventsDetailsState extends State<MyEventsDetails> {
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;

    int currentPos = 0;

    List<String> listPaths = [
      "assets/images/dubai.jpg",
      "assets/images/dubai.jpg",
      "assets/images/dubai.jpg",
    ];
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
            "Events Details",
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
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
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
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
                                  ],
                                ),
                              ],
                            ),
                            Icon(
                              Icons.qr_code,
                              size: 60,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeigth * 0.008,
                        ),
                        // Image.asset(
                        //   "assets/images/dubai.jpg",
                        //   height: 100,
                        //   width: screenWidth,
                        //   fit: BoxFit.fill,
                        // ),
                        CarouselSlider.builder(
                          itemCount: listPaths.length,
                          options: CarouselOptions(
                              autoPlay: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentPos = index;
                                });
                              }),
                          itemBuilder: (context, index, realIndex) {
                            return Container(
                              child: Image.asset(
                                listPaths[index],
                                fit: BoxFit.contain,
                              ),
                            );
                          },
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: listPaths.map((url) {
                            int index = listPaths.indexOf(url);
                            return Container(
                              width: 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentPos == index
                                    ? Color.fromRGBO(0, 0, 0, 0.9)
                                    : Color.fromRGBO(0, 0, 0, 0.4),
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        // DotsIndicator(
                        //   dotsCount: 3,
                        //   position: 0,
                        //   decorator: DotsDecorator(
                        //     color: Colors.grey, // Inactive color
                        //     activeColor: Colors.black,
                        //   ),
                        // )
                        // SizedBox(
                        //   height: 300,
                        //   width: double.infinity,
                        //   child: PageView.builder(
                        //     controller: controller,
                        //     onPageChanged: (index) {
                        //       setState(() {
                        //         currentIndex = index % listPaths.length;
                        //       });
                        //     },
                        //     itemBuilder: (context, index) {
                        //       return Padding(
                        //         padding:
                        //             const EdgeInsets.symmetric(horizontal: 20),
                        //         child: SizedBox(
                        //           height: 300,
                        //           width: double.infinity,
                        //           child: Image.network(
                        //             listPaths[index],
                        //             fit: BoxFit.cover,
                        //           ),
                        //         ),
                        //       );
                        //     },
                        //   ),
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     for (var i = 0; i < listPaths.length; i++)
                        //       buildIndicator(currentIndex == i)
                        //   ],
                        // ),
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
              itemCount: 1),
        ),
      ),
    );
  }

  Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        height: isSelected ? 12 : 10,
        width: isSelected ? 12 : 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}

// class MyImageView extends StatelessWidget {
//   String imgPath;

//   MyImageView(this.imgPath);

//   @override
//   Widget build(BuildContext context) {
//     return Image.asset(
//       "assets/images/dubai.jpg",
//       height: 100,
//       width: double.infinity,
//       fit: BoxFit.fill,
//     );
//   }
// }
