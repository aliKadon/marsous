import 'dart:convert';

import 'package:marsous/data/api/api_helper.dart';
import 'package:marsous/data/api/api_settings.dart';

import '../../../models/api_response.dart';
import '../../../notifications/firebase_messaging_service.dart';
import '../../../preferences/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

class AuthApiController with ApiHelper {

  Future<ApiResponse> login(
      {required String userName, required String password}) async {
    Uri uri = Uri.parse("${ApiSettings.baseUrl}/Account/login");
    var response = await http.post(uri,
        headers: headers,
        body: jsonEncode({
          'userName': userName,
          'password': password,
          // 'fcm_token': "asdasd",
          'fcm_token': await FirebaseMessagingService.instance.getToken(),
          'langCode' :SharedPrefController().lang1,
        }));
    // print('111');
    // print('============================================log in');
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      // print('222');
      // print('======================================fcm');
      // print(' ++++++++++====================this is fcm ${await FirebaseMessagingService.instance.getToken()}');
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == 200) {
        SharedPrefController().setToken(jsonResponse['data']);
        SharedPrefController().setPrimaryToken(jsonResponse['data']);
      }
      return ApiResponse(
        message: jsonResponse['message'],
        status: jsonResponse['status'],
      );
    }
    return failedResponse;
  }
}