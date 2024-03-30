import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marsous/data/api/api_helper.dart';
import 'package:marsous/data/api/api_settings.dart';
import 'package:marsous/models/notification_model.dart';
import 'package:marsous/preferences/shared_pref_controller.dart';

import '../../../models/api_response.dart';

class NotificationApiController with ApiHelper {
  // var sharedTokedChild = SharedPrefController().tokenChild;

  Future<List<NotificationModel>> getNotifications() async {
    // print("header child : $sharedTokedChild");
    // print("header child : ${sharedTokedChild.isEmpty}");
    // print("header student : $headers");
    var url = Uri.parse("${ApiSettings.baseUrl}/Marsous/get-my-notifications");
    var response = await http.get(url,
        headers: headers);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      if (jsonData["status"] == 200) {
        return List<NotificationModel>.from(
          jsonData["data"].map(
            (x) => NotificationModel.fromJson(x),
          ),
        );
      }
    }
    return [];
  }

  Future<ApiResponse> makeNotificationAsRead({required String notiId}) async {
    // print("header child : $sharedTokedChild");
    // print("header child : ${sharedTokedChild.isEmpty}");
    var url = Uri.parse(
        "${ApiSettings.baseUrl}/Marsous/mark-notification-as-read?notiId=$notiId");
    var response = await http.post(
      url,
      headers: headers,
    );

    print("notification - mark as read response status Code: ${response.statusCode}");
    print("notification - mark as read response body: ${response.body}");

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      if (jsonData["status"] == 200) {
        return ApiResponse(
            message: jsonData["message"], status: jsonData["status"]);
      }
    }
    return failedResponse;
  }
}
