import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:marsous/data/api/api_helper.dart';
import 'package:marsous/data/api/api_settings.dart';

import '../../../models/api_response.dart';

class UpdateProfileApiController with ApiHelper {
  Future<ApiResponse> updateProfileImage({required File file}) async {
    var url =
        Uri.parse("${ApiSettings.baseUrl}/Account/update-my-profile-image");
    var request = http.MultipartRequest(
      "POST",
      url,
    );
    request.headers.addAll(headers);
    request.files.add(
      await http.MultipartFile.fromPath('file', file.path),
    );
    var response = await request.send();
    print("response for update profile image : ${response.statusCode}");
    print("response for update profile image : ${response.reasonPhrase}");
    if (response.statusCode == 200) {
      print('File uploaded successfully!');
      return ApiResponse(message: "File uploaded successfully!", status: 200);
    }
    return failedResponse;
  }

  Future<ApiResponse?> updateProfile({
    String? phoneNumber,
    String? title,
    String? firstName,
    String? middleName,
    String? lastName,
    String? birthDate,
    String? nationality,
    String? nationalCardId,
  }) async {
    var url = Uri.parse("${ApiSettings.baseUrl}/Account/update-my-profile");
    var response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(
        {
          "phoneNumber": phoneNumber,
          "title": title,
          "firstName": firstName,
          "middleName": middleName,
          "lastName": lastName,
          "birthDate": birthDate,
          "nationality": nationality,
          "nationalCardId": nationalCardId,
        },
      ),
    );
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
