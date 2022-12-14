import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:aust_textile_alumni/app/modules/user_post/db_helper/database_helper.dart';
import 'package:aust_textile_alumni/app/modules/user_post/model/jobpost_model.dart';
import 'package:aust_textile_alumni/app/modules/user_post/model/post_model.dart';
import 'package:aust_textile_alumni/app/modules/user_post/providers/user_post_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../model/chip_model.dart';
import '../model/job_dept_model.dart';
import '../model/jobpost_type_model.dart';
import '../model/post_type_model.dart';

class UserPostController extends GetxController {
  //TODO: Implement UserPostController

  final count = 0.obs;

  GetStorage _getStorage = GetStorage('app_storage');


  var selectedImagePath = ''.obs;

  File? imageFile;

  var base64Image = "".obs;

  var selectedJobImagePath = ''.obs;

  File? jobImageFile;

  var base64JobImage = "".obs;

  File? documentFile;

  var fileName = ''.obs;

  var postTitle = ''.obs;
  var postType = ''.obs;
  var postDescription = ''.obs;
  var postedBy = '1234'.obs;
  var date = DateTime.now().toString().substring(0,16);
  var isPublished = '0';
  var tag = ''.obs;
  var dropDownPostItem = <String>[].obs;

  var jobTitle = "".obs;
  var companyName = "".obs;
  var jobDept = "".obs;
  var jobType = "".obs;
  var jobLocation = "".obs;
  var jobDescription = "".obs;
  var isArchived = '1';
  var jobStatus = '1';
  var application_deadline = 'Select application deadline'.obs;
  var jobLink = 'joblink.com'.obs;
  var dropDownJobPostItem = <String>[].obs;
  var dropDownJobPostDept = <String>[].obs;
  var dropDownJobLocationItem = <String>["On Site","Remote"];

  var isLoading = false.obs;
  var isProcessing = false.obs;
  var posttype = PostType().obs;

  var jobposttype = JobPostType().obs;
  var jobpostdept = JobDepartment().obs;


  List chipList = <ChipModel>[].obs as List<ChipModel>;

  var draftPost = <PostModel>[].obs;

  List<JobPostModel> draftJobPost = <JobPostModel>[].obs;



  TextEditingController chipTextController = TextEditingController();






  @override
  void onInit() {
    super.onInit();
    postedBy.value =  _getStorage.read('employee_id').toString();
    fetchPostType();
    fetchJobPostType();
    fetchDraftPost();
    fetchDraftJobPost();
    fetchJobPostDept();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    DatabaseHelper.instance.close();
  }
  void increment() => count.value++;


  chooseApplicationDaadLine() async{

    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2130),
        builder: (context,widget) => Theme(
          data: ThemeData().copyWith(
            colorScheme: ColorScheme.dark(
                surface: Colors.green
            ),
            dialogBackgroundColor: Colors.green.shade200,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.green, // button text color
              ),
            ),
          ),
          child: widget!,
        )
    );
    application_deadline.value = pickedDate.toString().substring(0,11);

  }


  Future<void> getImage(String postType) async {

    if(postType == "global") {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImagePath.value = pickedFile.path;
        imageFile = File(pickedFile.path);
        base64Image.value = base64Encode(imageFile!.readAsBytesSync());
      } else {
        print("No image selected");
      }
    }
    else {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedJobImagePath.value = pickedFile.path;
        jobImageFile = File(pickedFile.path);
        base64JobImage.value = base64Encode(imageFile!.readAsBytesSync());
      } else {
        print("No image selected");
      }
    }


  }

  Future<void> getFile() async {

    final pickedFile = await FilePicker.platform.pickFiles();

    if(pickedFile != null){
      documentFile = File(pickedFile.files.single.path.toString());
      fileName.value = pickedFile.files.single.name.toString();

    }
  }

  Future<void> uploadUserPost() async {

    isLoading.value = true;

    for(int i = 0 ; i<chipList.length ; i++){
      tag.value = tag+ " " + chipList[i].title.toString();
      print(tag.value.toString());
    }

    var status = await UserPostProvider()
        .uploadPost(postTitle.toString(), postType.toString(), postDescription.toString(), postedBy.toString(), date.toString(), isPublished.toString(), imageFile as File,selectedImagePath.toString(),tag.value);
    print("login status ......." + status.toString());

    if (status == true) {
      isLoading.value = false;
      Get.snackbar(
        "Status",
        "Post Uploaded",
        colorText: Colors.white,
        backgroundColor:Color(0xff00602B),
        snackPosition: SnackPosition.BOTTOM,

      );
    } else {
      isLoading.value = false;
      Get.snackbar(
        "Status",
        "Could not upload the post",
        colorText: Colors.white,
        backgroundColor:Color(0xff00602B),
        snackPosition: SnackPosition.BOTTOM,

      );
    }
  }


  Future<void> fetchPostType() async {
    try{
      var posttypes = await UserPostProvider().getPostType();
      if ( posttypes!= null )
        posttype.value = posttypes;
         for(int i = 0 ; i<posttype.value.postType!.length ; i++){
           dropDownPostItem.add(
             posttype.value.postType![i].typeName.toString());
         }
       }
    catch(e){
      print(e.toString());
    }
  }


  Future<void> fetchJobPostType() async {
    try{
      var jobpostdepts = await UserPostProvider().getJobPostDept();
      if ( jobpostdepts!= null )
        jobpostdept.value = jobpostdepts;
      for(int i = 0 ; i<jobpostdept.value.department!.length ; i++){
        dropDownJobPostDept.add(
            jobpostdept.value.department![i].departmentName.toString());
      }
    }
    catch(e){
      print(e.toString());
    }
  }

  Future<void> fetchJobPostDept() async {
    try{
      var posttypes = await UserPostProvider().getJobPostType();
      if ( posttypes!= null )
        jobposttype.value = posttypes;
      for(int i = 0 ; i<jobposttype.value.jobType!.length ; i++){
        dropDownJobPostItem.add(
            jobposttype.value.jobType![i].typeName.toString());
      }
    }
    catch(e){
      print(e.toString());
    }
  }

  Future<void> uploadUserJobPost() async {

    isProcessing.value = true;

    for(int i = 0 ; i<chipList.length ; i++){
      tag.value = tag+ " " + chipList[i].title.toString();
      print(tag.value.toString());
    }

    var status = await UserPostProvider()
        .uploadJobPost(jobTitle.toString(), jobType.toString(), jobDescription.toString(),
            postedBy.toString(), date.toString(), isPublished.toString(),
              jobImageFile as File,selectedJobImagePath.toString(), jobLink.value,isArchived.toString(),
              application_deadline.value,jobDept.value.toString(),jobLocation.value.toString(),companyName.value.toString()
    );
    print("login status ......." + status.toString());

    if (status == true) {
      isProcessing.value = false;
      Get.snackbar(
        "Status",
        "Post Uploaded",
        colorText: Colors.white,
        backgroundColor:Color(0xff00602B),
        snackPosition: SnackPosition.BOTTOM,

      );
    } else {
      isProcessing.value = false;
      Get.snackbar(
        "Status",
        "Could not upload the post",
        colorText: Colors.white,
        backgroundColor:Color(0xff00602B),
        snackPosition: SnackPosition.BOTTOM,

      );
    }
  }

  Future draftUserPost() async {

    PostModel postModel = PostModel(
         postTitle: postTitle.value,
         postType: postType.value,
         postDescription: postDescription.value,
         image: base64Image.value,
         postedBy: postedBy.value,
         date: date,
         isPublished: isPublished,
         tag: tag.value
    );

    int i =  await DatabaseHelper.instance.insertPost(postModel);
    if( i != 0 && i != null){
      Get.snackbar(
        "Status",
        "Your post has been saved",
        colorText: Colors.white,
        backgroundColor:Color(0xff00602B),
        snackPosition: SnackPosition.BOTTOM,

      );
    }
    else {
      Get.snackbar(
        "Status",
        "Your post has not been saved",
        colorText: Colors.white,
        backgroundColor:Color(0xff00602B),
        snackPosition: SnackPosition.BOTTOM,

      );
    }

  }

  Future<void> fetchDraftPost() async {
   draftPost.value =  await DatabaseHelper.instance.getPostList();

  }

  Future updateDraftPost(PostModel postModel) async {
   int  i = await DatabaseHelper.instance.updatePost(postModel);
   if( i != 0){
     fetchDraftPost();
     draftPost.refresh();
   }
   print("post list "+i.toString());
  }

  Future deleteDraftPost(int j) async {
    int  i = await DatabaseHelper.instance.deletePost(j);
    if( i != 0){
      fetchDraftPost();
      draftPost.refresh();
    }
    print("post list "+i.toString());
  }

  Future draftUserJobPost() async {

    JobPostModel jobPostModel = JobPostModel(
       companyName: companyName.value.toString(),
       jobType: jobType.value.toString(),
       jobTitle: jobTitle.value.toString(),
       jobDescription: jobDescription.value.toString(),
       jobLink: jobLink.value.toString(),
       jobImage:  base64JobImage.value.toString(),
       jobPostedBy: postedBy.value.toString(),
       jobLocation: jobLocation.value.toString(),
       isJobPublished : isPublished,
       isJobIsArchived: isArchived,
       applicationDeadline: application_deadline.value.toString(),
       departmentName: jobDept.value.toString(),
    );

    int i =  await DatabaseHelper.instance.insertJobPost(jobPostModel);

    print("post list "+i.toString());

    if( i != 0 && i != null){
      Get.snackbar(
        "Status",
        "Your post has been saved",
        colorText: Colors.white,
        backgroundColor:Color(0xff00602B),
        snackPosition: SnackPosition.BOTTOM,

      );
    }
    else {
      Get.snackbar(
        "Status",
        "Your post has not been saved",
        colorText: Colors.white,
        backgroundColor:Color(0xff00602B),
        snackPosition: SnackPosition.BOTTOM,

      );
    }

  }

  Future<void> fetchDraftJobPost() async {
    draftJobPost =  await DatabaseHelper.instance.getJobPostList();

  }


  Future updateDraftJobPost(JobPostModel jobPostModel) async {
    int  i = await DatabaseHelper.instance.updateJobPost(jobPostModel);
    if( i != 0){
      fetchDraftPost();
    }
    print("post list "+i.toString());
  }

  Future deleteDraftJobPost(int j) async {
    int  i = await DatabaseHelper.instance.deleteJobPost(j);
    print("post list "+i.toString());
  }


}
