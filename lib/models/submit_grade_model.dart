import 'package:get/get.dart';

class SubmitGradeModel extends GetxController{
  String? sessionId;
  int? testGrade;
  int? taskGrade;

  SubmitGradeModel({this.testGrade, this.taskGrade, this.sessionId});

  // final SessionModel sessionModel = Get.find<SessionModel>();
  //
  // void updateGradeTest() {
  //   sessionModel.testGrade = testGrade;
  //   update();
  // }

  factory SubmitGradeModel.fromJson(Map<String, dynamic> json) => SubmitGradeModel(
        sessionId: json["sessionId"],
        testGrade: json["testGrade"],
        taskGrade: json["taskGrade"],
      );

  Map<String, dynamic> toJson() => {
        "SessionId": sessionId,
        "TaskGrade": taskGrade,
        "TestGrade": testGrade,
      };
}
