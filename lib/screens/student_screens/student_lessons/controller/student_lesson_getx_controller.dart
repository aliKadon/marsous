import 'package:get/get.dart';
import 'package:marsous/data/api/controllers/student_api_controller.dart';

import '../../../../models/previouse_session_model.dart';

class StudentLessonGetXController extends GetxController {
  final StudentApiController _studentApiController = StudentApiController();

  PreviousSessionModel? previousLessons;


  void getPreviousLessons(
      {String? courseId = "", int? pageIndex, int? pageSize}) async {
    try {
      // print("student - prevoius lesson getx controller1 : $previousLessons");
      previousLessons = await _studentApiController.getPreviousSession(
          courseId: courseId, pageSize: pageSize, pageIndex: pageIndex);
      update();
      print("student - prevoius lesson getx controller : $previousLessons");


    }catch (e) {
      print("student - previous lesson error : $e");
    }
  }


}
