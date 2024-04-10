import 'package:get/get.dart';
import 'package:marsous/data/api/controllers/teacher_api_controller.dart';

import '../../../models/course_model.dart';
import '../../../models/session_model.dart';

class HomeGetXController extends GetxController {
  final TeacherApiController _teacherApiController = TeacherApiController();

  List<CourseModel> courses = [];
  List<SessionModel> sessionModel = [];
  List<SessionModel> homeWorkSessions = [];
  List<SessionModel> testSessions = [];
  int index = 0;
  var isLoading = true;

  void getTeacherCourses({int? pageIndex, int? pageSize}) async {
    isLoading = true;
    try {
      courses = await _teacherApiController.getTeacherCourses(
          pageIndex: pageIndex, pageSize: pageSize);
      isLoading = false;
      update(['teacherCourses']);
    } catch (e) {
      print("teacher - get courses teacher error : $e");
    }
  }

  void geTeacherSession({int? pageIndex = 1, int? pageSize = 20}) async {
    try {
      sessionModel = await _teacherApiController.getTeacherSession(
          pageSize: pageSize, pageIndex: pageIndex);
      //count the session that have home to use in list view as a item count.
      while (index < sessionModel.length) {

        if (sessionModel[index].lessonTask!.isNotEmpty) {
          // homeWorkCount++;
          homeWorkSessions.add(sessionModel[index]);
        }
        if (sessionModel[index].lessonTest!.isNotEmpty) {
          testSessions.add(sessionModel[index]);
        }
        index++;
      }
      print("student - homeWork count : ${homeWorkSessions.length}");
      update();
    } catch (e) {
      print("student - get my session error : $e");
    }
  }
}
