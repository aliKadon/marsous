import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marsous/app/utils/app_shared_data.dart';
import 'package:marsous/data/api/api_helper.dart';
import 'package:marsous/data/api/api_settings.dart';
import 'package:marsous/preferences/shared_pref_controller.dart';

import '../../../models/api_response.dart';
import '../../../models/user_info_model.dart';

class UserDetailsApiController with ApiHelper {
  var sharedTokedChild = SharedPrefController().tokenChild;

  Future<ApiResponse> getMyInfo() async {
    // print("header child : $sharedTokedChild");
    // print("header  : ${SharedPrefController().token}");
    // print("header child : ${sharedTokedChild.isEmpty}");
    var url = Uri.parse("${ApiSettings.baseUrl}/Account/get-my-info");
    var response = await http.get(url, headers: headers);

    // print("get my info body: ${response.body}");
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      if (jsonData["status"] == 200) {
        UserInfoModel userInfoModel = UserInfoModel.fromJson(jsonData["data"]);
        //save user info in shared preferences
        SharedPrefController().saveUserInfo(
            userInfoModel: userInfoModel);
        AppSharedData.userInfoModel = userInfoModel;
        return ApiResponse(message: jsonData["message"], status: jsonData["status"]);
      }
    }
    return failedResponse;
  }

  Future<ApiResponse> getMyInfoPrimary() async {
    // print("header child : $sharedTokedChild");
    // print("header  : ${SharedPrefController().token}");
    // print("header child : ${sharedTokedChild.isEmpty}");
    var url = Uri.parse("${ApiSettings.baseUrl}/Account/get-my-info");
    var response = await http.get(url, headers: headersPrimary);

    // print("get my info body: ${response.body}");
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      if (jsonData["status"] == 200) {
        UserInfoModel userInfoModel = UserInfoModel.fromJson(jsonData["data"]);
        //save user info in shared preferences
        SharedPrefController().saveUserInfo(
            userInfoModel: userInfoModel);
        AppSharedData.userInfoModel = userInfoModel;
        return ApiResponse(message: jsonData["message"], status: jsonData["status"]);
      }
    }
    return failedResponse;
  }
}
