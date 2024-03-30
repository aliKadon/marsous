import 'package:get/get.dart';

import '../../../data/api/controllers/teacher_api_controller.dart';
import '../../../models/session_model.dart';

class StudentSessionGetXController extends GetxController {

  var isLoading = true;

  final TeacherApiController _teacherApiController = TeacherApiController();
  List<SessionModel> studentSession = [];

  void getStudentSession({required String sessionId}) async {
    try {
      studentSession = await _teacherApiController.getStudentSession(sessionId: sessionId);
      isLoading = false;
      update();
    }catch (e) {
      print("teacher - student session error : $e");
    }
  }

}