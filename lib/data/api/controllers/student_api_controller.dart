import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:marsous/data/api/api_helper.dart';
import 'package:marsous/data/api/api_settings.dart';
import 'package:marsous/models/previouse_session_model.dart';
import 'package:marsous/models/session_model.dart';

import '../../../models/api_response.dart';
import '../../../models/course_model.dart';

class StudentApiController with ApiHelper {
  // var sharedTokedChild = SharedPrefController().tokenChild;

  Future<List<CourseModel>> getMyCourses(
      {int? pageIndex, int? pageSize}) async {
    // print("header child get my courses: $sharedTokedChild");
    // print("header child get my courses: ${sharedTokedChild.isEmpty}");

    var url = Uri.parse(
        "${ApiSettings.baseUrl}/Student/get-my-courses?pageIndex=$pageIndex&pageSize=$pageSize");
    var response = await http.get(
      url,
      headers: headers,
    );
    print("response body get my courses: ${response.body}");
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      if (jsonData["status"] == 200) {
        return List<CourseModel>.from(
          jsonData["data"].map(
            (x) => CourseModel.fromJson(x),
          ),
        );
      }
    }
    return [];
  }

  Future<ApiResponse> sendTask(
      {required String sessionId, String? answer, File? file}) async {
    // print("header child : $sharedTokedChild");
    // print("header child : ${sharedTokedChild.isEmpty}");
    var url = Uri.parse(
        "${ApiSettings.baseUrl}/Student/send-session-task-answer?sessionId=$sessionId&taskAnswer=$answer");
    var request = http.MultipartRequest(
      "POST",
      url,
    );
    request.headers.addAll(headers);
    if (file != null) {
      request.files.add(
        await http.MultipartFile.fromPath('taskFile', file.path),
      );
    }
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      if (jsonData["status"] == 200) {
        return ApiResponse(
            message: jsonData["data"], status: jsonData["status"]);
      }
    }
    return failedResponse;
  }

  Future<PreviousSessionModel?> getPreviousSession(
      {String? courseId, int? pageIndex, int? pageSize}) async {
    // print("header child : $sharedTokedChild");
    // print("header child : ${sharedTokedChild.isEmpty}");
    var url = Uri.parse(
        "${ApiSettings.baseUrl}/Student/get-my-previous-session?pageIndex=$pageIndex&pageSize=$pageSize&courseId=$courseId");
    var response = await http.get(url, headers: headers);

    print(
        "student - previous lesson api response status: ${response.statusCode} ");
    print("student - previous lesson api response body: ${response.body} ");

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      if (jsonData["status"] == 200) {
        return PreviousSessionModel.fromJson(jsonData["data"]);
      }
    }
    return null;
  }

  Future<List<SessionModel>> getMySession(
      {int? pageIndex, int? pageSize}) async {
    var url = Uri.parse(
        "${ApiSettings.baseUrl}/Student/get-my-session?pageIndex=$pageIndex&pageSize=$pageSize");
    var response = await http.get(url, headers: headers);

    print("student - my session api response status code: ${response.statusCode} ");
    print("student - my session api response body: ${response.body} ");
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      if (jsonData["status"] == 200) {
        return List<SessionModel>.from(
          jsonData["data"].map(
            (x) => SessionModel.fromJson(x),
          ),
        );
      }
    }
    return [];
  }
}
