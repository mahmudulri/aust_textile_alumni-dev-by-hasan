import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../utill/constant.dart';

class LoginProvider extends GetConnect {
  GetStorage _getStorage = GetStorage('app_storage');
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<dynamic> verifyUserLogin(String email, String password) async {
    var userData = new Map();
    userData['email'] = email;
    userData['password'] = password;

    print("user data otp......" + userData.toString());

    var response =
    await post(BASE_URL+"user-login", userData);

    print("errorprovider1 //////////" + response.statusCode.toString());

    if (response.statusCode == 200) {
      print("afterserver //////////" + response.body.toString());

      try {
        if (response.body['status'] == 200) {
          await _getStorage.write('token', response.body['token']);
          return true;
        } else {
          return false;
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
