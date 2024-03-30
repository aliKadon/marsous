
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:marsous/app/utils/helpers.dart';
import 'package:marsous/data/api/controllers/teacher_api_controller.dart';
import 'package:marsous/models/api_response.dart';

import '../../../models/submit_grade_model.dart';

class SubmitGradeGetXController extends GetxController with Helpers {
  final TeacherApiController _teacherApiController = TeacherApiController();
  ApiResponse? apiResponse;

  void submitGrade({required BuildContext context,required List<SubmitGradeModel> submitGradeList}) async {
    showLoadingDialog(context: context,title: "loading");
    try {
      apiResponse = await _teacherApiController.submitGrade(
          submitGradeList: submitGradeList);
      if (apiResponse!.status == 200) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        showSnackBar(context, message: apiResponse!.message);
      }else {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        showSnackBar(context, message: apiResponse!.message);
      }
      update();
    } catch (e) {
      Navigator.of(context).pop();
      print("teacher - submit response error : $e");
    }
  }
}
