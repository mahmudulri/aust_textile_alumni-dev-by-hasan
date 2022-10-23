import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/register_controller.dart';

class PageOne extends StatefulWidget {
  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  // const PageOne({Key? key}) : super(key: key);
  final RegisterController regController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeigth = MediaQuery.of(context).size.height;
    return ListView(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: screenHeigth * 0.045,
          ),
          child: Text(
            'Personal Info :',
            style: GoogleFonts.poppins(
                color: Colors.green,
                fontSize: screenHeigth * 0.017,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
        SizedBox(
          height: screenHeigth * 0.020,
        ),
        page_one_textfield(
          screenHeigth,
          screenWidth,
          Icon(
            Icons.person,
            color: Colors.white,
            size: 30,
          ),
          "Full Name",
          1
        ),
        SizedBox(
          height: screenHeigth * 0.010,
        ),
        page_one_textfield(
          screenHeigth,
          screenWidth,
          Icon(
            Icons.person_add_alt_1_rounded,
            color: Colors.white,
            size: 30,
          ),
          "Nick Name",
          0
        ),
        SizedBox(
          height: screenHeigth * 0.010,
        ),
        page_one_textfield(
          screenHeigth,
          screenWidth,
          Icon(
            Icons.batch_prediction,
            color: Colors.white,
            size: 30,
          ),
          "Batch",
          1
        ),
        SizedBox(
          height: screenHeigth * 0.010,
        ),
        page_one_textfield(
          screenHeigth,
          screenWidth,
          Icon(
            Icons.phone,
            color: Colors.white,
            size: 30,
          ),
          "Mobile No.",
          1
        ),
        SizedBox(
          height: screenHeigth * 0.010,
        ),
        page_one_textfield(
          screenHeigth,
          screenWidth,
          Icon(
            Icons.bloodtype,
            color: Colors.white,
            size: 30,
          ),
          "Blood Group",
          1
        ),
        SizedBox(
          height: screenHeigth * 0.010,
        ),
        page_one_textfield(
          screenHeigth,
          screenWidth,
          Icon(
            Icons.stream,
            color: Colors.white,
            size: 30,
          ),
          "Stream",
          0
        ),
        // SizedBox(
        //   height: screenHeigth * 0.010,
        // ),
      ],
    );
  }

  page_one_textfield(
      double screenHeigth, double screenWidth, Widget icon, String hinttxt,int isImportant) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isImportant == 1 ? Colors.red : Color(0xff00602B),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          height: screenHeigth * 0.060,
          width: screenWidth * 0.170,
          // width: 70,
          child: icon,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            border: Border.all(
              width: 1,
              color:  isImportant == 1 ? Colors.red : Color(0xff00602B),
            ),
          ),
          height: screenHeigth * 0.060,
          width: screenWidth * 0.60,
          // width: 600,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: TextFormField(
                  // obscureText: hinttxt == "Password" ? true :
                  //                 hinttxt == "Confirm Password" ? true : false,
                   keyboardType: hinttxt == 'Mobile No.' ?
                             TextInputType.number :
                                       TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hinttxt,
                  ),

                onChanged: (value){
                  hinttxt == "Full Name" ?
                  regController.fullName.value = value.toString() :
                  hinttxt == "Nick Name" ?
                  regController.name.value = value.toString() :
                  hinttxt == "Batch" ?
                  regController.batch.value = value.toString() :
                  hinttxt == "Mobile No." ?
                  regController.mobileNo.value = value.toString() :
                  hinttxt == "Blood Group" ?
                  regController.bloodGroup.value = value.toString() :
                  regController.stream.value = value.toString();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

