import 'package:aust_textile_alumni/app/modules/user_post/views/test_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../routes/app_pages.dart';
import '../../../utill/app_colors.dart';
import '../controllers/user_post_controller.dart';
import '../model/chip_model.dart';

class GlobalPostView extends StatefulWidget {
  @override
  State<GlobalPostView> createState() => _GlobalPostViewState();
}

class _GlobalPostViewState extends State<GlobalPostView> {

  var selectedItem;

  UserPostController controller =  Get.put(UserPostController());
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //    Get.to(()=> TestView());
      // },
      //
      // ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(

            children: [
              Column(
                children: [
                  Divider(
                    color: titleTextColor,
                    thickness: 1.0,
                  ),
                  SizedBox(
                    height: screenHeight * 0.015,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create your post",
                        style: GoogleFonts.poppins(
                          fontSize: screenHeight * 0.017,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff00602B),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Category",
                        style: GoogleFonts.poppins(
                          fontSize: screenHeight * 0.017,
                          color: Color(0xff00602B),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      width: double.infinity,
                      child:
                      Obx(() =>
                          DropdownButton<String>(
                            isExpanded: true,
                            icon: Icon(
                              Icons.arrow_drop_down,
                            ),
                            hint: Text("Select Category"),
                            onChanged: (val) {
                              controller.postType.value = val.toString();
                              setState(() => selectedItem = val.toString());
                              print(controller.postType.value.toString());
                            },
                            value: this.selectedItem,
                            items:
                            controller.dropDownPostItem.map((quantityValue) {
                              return DropdownMenuItem(
                                  value: quantityValue,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: screenHeight * 0.019
                                    ),
                                    child: Text(
                                      quantityValue,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15.0
                                      ),
                                    ),
                                  ));
                            }).toList(),
                          )
                      )
                  ),
                  SizedBox(
                    height: screenHeight * 0.030,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Post title",
                        style: GoogleFonts.poppins(
                          fontSize: screenHeight * 0.017,
                          color: Color(0xff00602B),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  Container(
                    height: screenHeight * 0.070,
                    width: screenWidth - 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: screenHeight * 0.019,
                          right: screenHeight * 0.019
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.text,
                        minLines: 1,
                        maxLines: 3,
                        onChanged: (value){
                          controller.postTitle.value = value.toString();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your post",
                        style: GoogleFonts.poppins(
                          fontSize: screenHeight * 0.017,
                          color: Color(0xff00602B),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  Container(
                    height: screenHeight * 0.35,
                    width: screenWidth - 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffC4C4C4), width: 2),
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(
                          left: screenHeight * 0.019,
                          right: screenHeight * 0.019
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.text,
                        minLines: 1,
                        maxLines: 30,
                        onChanged: (value){
                          controller.postDescription.value = value.toString();
                        },
                      ),
                    ),
                  ),


                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                   Obx(() =>
                      GestureDetector(
                        onTap: () async {
                          await controller.getImage("global");
                        },
                        child: Container(
                          height: screenHeight * 0.080,
                          width: screenWidth - 20,
                          decoration: BoxDecoration(
                            color: Color(0xff27AE60),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: screenHeight * 0.019,
                                  right: screenHeight * 0.019
                              ),
                              child: controller.selectedImagePath.value == "" ?
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Attach Image / Upload Image',style:  GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: screenHeight * 0.020,
                                          color: Color(0xffFFFFFF)
                                      ),),
                                      Text('(.jpg .jpeg .png .gif only)',style:  GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: screenHeight * 0.015,
                                          color: Color(0xffFFFFFF)
                                      ),)
                                    ],
                                  ) : Center(
                                child: Text(controller.selectedImagePath.value.toString().substring(78,96),
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffFFFFFF)
                                ),),
                              )
                          ),
                        ),
                      ),
                   ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tags",
                        style: GoogleFonts.poppins(
                          fontSize: screenHeight * 0.017,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  Container(
                    height: screenHeight * 0.070,
                    width: screenWidth - 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xffC4C4C4), width: 2),
                    ),
                    child:
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenHeight * 0.019,
                          right: screenHeight * 0.019
                      ),
                      child: TextFormField(
                        controller: controller.chipTextController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.text,
                        minLines: 1,
                        maxLines: 30,
                        onFieldSubmitted: (value){
                          if(value != ""){
                            controller.chipList.add(
                                ChipModel(DateTime.now().toString(), value.toString())
                            );
                            controller.chipTextController.clear();
                          }

                        },

                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  Obx(() => Wrap(
                    spacing: 4.0,
                    children:  controller.chipList.map((chip) => Chip(
                      backgroundColor: titleTextColor,
                      onDeleted: (){
                        controller.chipList.removeWhere((element) => element.id == chip.id);
                      },
                      label: Text(chip.title,
                        style: GoogleFonts.poppins(
                            fontSize: screenHeight * 0.015,
                            color: Colors.white
                        ),),
                    )).toList(),
                  ),),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                  ToggleSwitch(
                    cornerRadius: 10,
                    minWidth: screenWidth * 0.400,
                    minHeight: screenHeight * 0.070,
                    fontSize: screenHeight * 0.018,
                    initialLabelIndex: 1,
                    activeBgColor: [
                      Color(
                        0xff00602B,
                      )
                    ],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Color(0xff0FA958),
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['Draft', 'Share'],
                    onToggle: (index) async {
                      print('switched to: $index');
                      if(index == 1){
                        if(controller.postTitle.value == '' &&
                            controller.postType.value == '' &&
                            controller.postDescription.value == ''){
                          Get.snackbar(
                            "Error",
                            "Fill up all the field",
                            colorText: Colors.white,
                            backgroundColor:Color(0xff00602B),
                            snackPosition: SnackPosition.BOTTOM,

                          );
                        }
                        else if(controller.postTitle.value == '' || controller.postType.value == '' ||
                            controller.postDescription.value == ''){
                          Get.snackbar(
                            "Error",
                            "Fill up all the field",
                            colorText: Colors.white,
                            backgroundColor:Color(0xff00602B),
                            snackPosition: SnackPosition.BOTTOM,

                          );
                        }
                        else{
                          await controller.uploadUserPost();
                        }


                      }
                      else {

                        if(controller.postTitle.value == '' &&
                            controller.postType.value == '' &&
                            controller.postDescription.value == '' &&
                               controller.base64Image.value == ''){
                          Get.snackbar(
                            "Error",
                            "Fill up all the field",
                            colorText: Colors.white,
                            backgroundColor:Color(0xff00602B),
                            snackPosition: SnackPosition.BOTTOM,

                          );
                        }
                        else if (
                        controller.postTitle.value == '' || controller.postType.value == '' ||
                            controller.postDescription.value == '' ||
                             controller.base64Image.value == ''
                        ){
                          Get.snackbar(
                            "Error",
                            "Fill up all the field",
                            colorText: Colors.white,
                            backgroundColor:Color(0xff00602B),
                            snackPosition: SnackPosition.BOTTOM,

                          );
                        }
                        else {
                          await controller.draftUserPost();
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: screenHeight * 0.020,
                  ),
                ],
              ),
              Obx(() => controller.isLoading.value == true ?
              Align(
                alignment: Alignment.center,
                child: Container(
                  color: Colors.white,
                  height: screenHeight * 0.25,
                  width: screenHeight * 0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                          child: Lottie.asset("assets/files/loading.json")
                      ),
                      Text("Please wait ....",style: GoogleFonts.poppins(
                          color: Colors.grey
                      ),)
                    ],
                  ),
                ),
              ) : Visibility(
                  visible: false,
                  child: Container()))
            ],

          ),
        ),
      ),
    );
  }
}