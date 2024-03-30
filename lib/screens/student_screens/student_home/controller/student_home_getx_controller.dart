import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:marsous/app/utils/helpers.dart';
import 'package:marsous/data/api/controllers/student_api_controller.dart';

import '../../../../models/course_model.dart';
import '../../../../models/session_model.dart';

class StudentHomeGetXController extends GetxController with Helpers {
  final StudentApiController _studentApiController = StudentApiController();

  List<CourseModel> myCourses = [];
  List<SessionModel> sessionModel = [];
  List<SessionModel> homeWorkSessions = [];
  List<SessionModel> testSessions = [];
  int homeWorkCount = 0;
  int index = 0;

  void getMyCourses(
      {required BuildContext context, int? pageIndex, int? pageSize}) async {
    try {
      myCourses = await _studentApiController.getMyCourses(
          pageIndex: pageIndex, pageSize: pageSize);
      update(["myCourses"]);
    } catch (e) {
      print("student _ get my courses error: $e");
    }
  }

  void getMySession({int? pageIndex = 1, int? pageSize = 20}) async {
    try {
      sessionModel = await _studentApiController.getMySession(
          pageSize: pageSize, pageIndex: pageIndex);
      //count the session that have home to use in list view as a item count.
      while (index <= sessionModel.length) {
        index++;
        if (sessionModel[index].lessonTask!.isNotEmpty) {
          // homeWorkCount++;
          homeWorkSessions.add(sessionModel[index]);
        }
        if (sessionModel[index].lessonTest!.isNotEmpty) {
          testSessions.add(sessionModel[index]);
        }
      }
      print("student - homeWork count : ${homeWorkSessions.length}");
      update();
    } catch (e) {
      print("student - get my session error : $e");
    }
  }
}
