import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:marsous/app/utils/helpers.dart';
import 'package:marsous/data/api/controllers/student_api_controller.dart';
import 'package:marsous/models/api_response.dart';

class StudentHomeworkGetXController extends GetxController with Helpers{
  final StudentApiController _studentApiController = StudentApiController();
  late final GlobalKey<FormState> formKey = GlobalKey();

  ApiResponse? apiResponse;

  String? answer;
  var file;

  Future uploadTask({required BuildContext context}) async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ['pdf','png','jpg']);
      if (result != null) {
        file = File(result.paths.first!);
        // print("file path upload : $file");
        // fileBytes = await file!.readAsString(encoding:utf8);
      }

      /////////
      // final fileTemp = await ImagePicker().pickImage(source: ImageSource.gallery);
      // if (fileTemp == null) return;
      // file = File(fileTemp.path);

      update();
    } on PlatformException catch (e) {
      print('Failed to pick file: $e');
    }
  }

  void sendTask({
    required BuildContext context,
    required String sessionId,
  }) async {

    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    print("student - sendTask answer : $answer");
    try {
      showLoadingDialog(context: context,title: 'Loading...');
      apiResponse = await _studentApiController.sendTask(
          sessionId: sessionId,answer: answer, file: file);
      if(apiResponse!.status == 200) {
        Navigator.of(context).pop();
        showSnackBar(context, message: "${apiResponse?.message}",error: false);
      }else {
        Navigator.of(context).pop();
        showSnackBar(context, message: "${apiResponse?.message}",error: true);
      }
    }catch (e) {
      Navigator.of(context).pop();
      print("student - send task error : $e");
    }
  }
}
