import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:marsous/data/api/api_helper.dart';
import 'package:marsous/data/api/api_settings.dart';

import '../../../models/api_response.dart';
import '../../../models/submit_message_model.dart';

class MarsousSubmitMessageApiController with ApiHelper {
  Future<ApiResponse> submitMessage(
      {required SubmitMessageModel submitMessageModel}) async {
    var url =
        Uri.parse("${ApiSettings.baseUrl}/Marsous/sbumit-message-to-marsous");
    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(
        submitMessageModel.toJson(),
      ),
    );

    print("marsous - submit message response status code : ${response.statusCode}");
    print("marsous - submit message response body : ${response.body}");

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      if (jsonData["status"] == 200) {
        return ApiResponse(
            message: jsonData["data"], status: jsonData["status"]);
      }
    }
    return failedResponse;
  }
}
