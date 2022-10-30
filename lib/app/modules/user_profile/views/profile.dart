import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    // final left = screenWidth / 6;
    // final right = screenHeight / 10;

    final top = screenHeight / 8;
    var myheight = screenHeight - top;

    var body = top / 2;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
        ),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff0FA958),
      ),
      backgroundColor: Color(0xff0FA958),
      // backgroundColor: Colors.purple,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: top - 20,
            child: Container(
              height: myheight,
              width: screenWidth,
              decoration: BoxDecoration(
                color: Color(0xffE5E5E5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                ),
              ),
            ),
          ),
          // Positioned(
          //   left: left,
          //   top: newtop,
          //   child: CircleAvatar(
          //     radius: profileHeight / 2,
          //     backgroundColor: Colors.grey,
          //     child: CircleAvatar(
          //       radius: screenWidth * 0.100,
          //       backgroundImage: AssetImage("assets/images/dummy_profile.jpg"),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   right: left,
          //   top: 70,
          //   child: CircleAvatar(
          //     radius: profileHeight / 5,
          //     backgroundColor: Color(0xff95a5a6),
          //     child: Icon(
          //       Icons.edit,
          //     ),
          //   ),
          // ),

          Positioned(
            top: top - body / 2 - 20,
            left: 50,
            child: Container(
              height: body,
              width: body,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: screenHeight * 0.100,
                backgroundImage: AssetImage("assets/images/dummy_profile.jpg"),
              ),
            ),
          ),
          Positioned(
            top: top - body / 3 - 20,
            right: 20,
            child: Container(
              height: body / 1.5,
              width: body / 1.5,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.edit,
                // size: screenWidth * 0.050,
                color: Colors.grey,
              ),
            ),
          ),

          // Positioned(
          //   left: left,
          //   top: top,
          //   child: Container(
          //     height: screenHeight * 0.200,
          //     width: screenWidth * 0.200,
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //     ),
          //     child: CircleAvatar(
          //       radius: screenWidth * 0.060,
          //       backgroundColor: Colors.black,
          //       child: CircleAvatar(
          //         radius: screenWidth * 0.090,
          //         backgroundColor: Colors.green,
          //         backgroundImage:
          //             AssetImage("assets/images/dummy_profile.jpg"),
          //       ),
          //     ),
          //   ),
          // ),

          // Positioned(
          //   right: screenWidth * 0.050,
          //   top: top - myradius * 2,
          //   child: Container(
          //     height: screenHeight * 0.100,
          //     width: screenWidth * 0.100,
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //     ),
          //     child: CircleAvatar(
          //       radius: myradius,
          //       backgroundColor: Colors.white,
          //       child: Image.asset(
          //         "assets/images/edit.png",
          //         height: screenHeight * 0.025,
          //         width: screenWidth * 0.050,
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),
          // ),
          Positioned(
            left: 120,
            top: top - body + 5 - 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning",
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                  ),
                ),
                Text(
                  "Rakibul Islam Khan",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 120,
            top: top + screenHeight * 0.010 - 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Managing Director",
                  style: TextStyle(
                    color: Color(0xff777777),
                    fontFamily: "Ubuntu",
                  ),
                ),
                Text(
                  "Pakiza Technovation Limited",
                  style: TextStyle(
                    color: Color(0xff777777),
                    fontFamily: "Ubuntu",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
