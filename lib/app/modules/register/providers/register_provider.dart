import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:io';
import 'package:http/http.dart 'as http;

import '../../../utill/constant.dart';


class RegisterProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  GetStorage _getStorage = GetStorage('app_storage');

  Future<dynamic?> doRegistration(String full_name, String nick_name,
      String email, String batch,
      String phone_no, String blood_group,
      String stream, String job_sector, String job_sub_sector,
      String official_email, String office_address,
      String name_of_company, String present_address, String permanant_address,
      String password,
      String confirm_pass, File image_file, String path,) async {

    print("demo" + full_name);
    print("demo" + nick_name);
    print("demo" + email);
    print("demo" + batch);
    print("demo" + phone_no);
    print("demo" + blood_group);
    print("demo" + stream);
    print("demo" + job_sector);
    print("demo" + job_sub_sector);
    print("demo" + official_email);
    print("demo" + office_address);
    print("demo" + name_of_company);
    print("demo" + present_address);
    print("demo" + permanant_address);
    print("demo" + password);
    print("demo" + confirm_pass);
    print("demo" + path);


    Map<String, String> userData = Map();
    userData['full_name'] = full_name;
    userData['nick_name'] = nick_name;
    userData['email'] = email;
    userData['batch'] = batch;
    userData['phone_no'] = phone_no;
    userData['blood_group'] = blood_group;
    userData['stream'] = email;
    userData['job_sector'] = job_sector;
    userData['job_sub_sector'] = job_sub_sector;
    userData['office_email'] = official_email;
    userData['office_address'] = office_address;
    userData['name_of_company'] = name_of_company;
    userData['present_address'] = present_address;
    userData['permanent_address'] = permanant_address;
    userData['password'] = password;
    userData['confirm_password'] = confirm_pass;


    FormData _formData = FormData({
      'full_name': full_name,
      'nick_name': nick_name,
      'email': email,
      'batch': batch,
      'phone_no': phone_no,
      'blood_group': blood_group,
      'stream': email,
      'job_sector': job_sector,
      'job_sub_sector': job_sub_sector,
      'office_email': official_email,
      'office_address': office_address,
      'name_of_company': name_of_company,
      'present_address': present_address,
      'permanent_address': permanant_address,
      'password': password,
      'confirm_password': confirm_pass,
      'image': MultipartFile(
          image_file, filename: DateTime.now().toString() + path)
    });
    //
    // var response =
    // await post("https://rakib10ms.com/server/public/api/register", _formData);
    //
    final url = Uri.parse("https://rakib10ms.com/server/public/api/register");
    //
    var request = http.MultipartRequest('POST',url);
    //
    request.files.add(await http.MultipartFile.fromPath('image',path ));
    request.fields.addAll(userData);
    //
    //
    var responsed = await request.send();

    var response1 = await http.Response.fromStream(responsed);

    print("res...."+response1.toString());

    var response = json.decode(response1.body);


    print("errorprovider //////////" + userData.toString());

    // print("statuscode //////////" + response['status'].toString());


    if (responsed.statusCode == 200) {
      print("errorafterhit //////////" + response.toString());



      try {
        if (response['status'] == 200) {
          print("bodystatus //////////" + response.toString());
          String user_id = response['emailotp']['user_id'].toString();

          print("resgistration credential ......." + user_id);
           await saveUserId(int.parse(user_id));
          return true;
        }
      } catch (e) {
        print(e.toString());
      }

    }
    else {
      return false;
    }


  }

  saveUserId(int userId) async {
    await _getStorage.write('employee_id', userId);
    final int? emp_id = await _getStorage.read('employee_id');
    print('login provider' + emp_id!.toString());
    return true;
  }
}
