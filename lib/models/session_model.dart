import 'package:get/get.dart';

class SessionModel extends GetxController {
  String? id;
  String? courseId;
  String? lessonMemorize;
  String? lessonNearReview;
  String? lessonFarReview;
  String? lessonTajweed;
  String? lessonTask;
  String? lessonTest;
  String? taskFilePath;
  String? testFilePath;
  String? centerName;
  String? taskAnswer;
  String? testAnswer;
  int? attendance;
  int? taskGrade;
  int? testGrade;
  String? attendanceAsString;
  String? courseName;
  String? date;
  bool? isSessionToday;
  bool? scheduled;
  String? studentFullName;

  SessionModel({
    this.id,
    this.centerName,
    this.date,
    this.attendance,
    this.attendanceAsString,
    this.courseId,
    this.courseName,
    this.isSessionToday,
    this.lessonFarReview,
    this.lessonMemorize,
    this.lessonNearReview,
    this.lessonTajweed,
    this.lessonTask,
    this.lessonTest,
    this.scheduled,
    this.taskAnswer,
    this.taskFilePath,
    this.taskGrade,
    this.testAnswer,
    this.testFilePath,
    this.testGrade,
    this.studentFullName,
  });

  void updateGrade(int grade) {
   testGrade = grade;
   update(["grade"]);
  }


  factory SessionModel.fromJson(Map<String, dynamic> json) => SessionModel(
        id: json["id"],
        centerName: json["centerName"],
        attendance: json["attendance"],
        attendanceAsString: json["attendanceAsString"],
        courseId: json["courseId"],
        courseName: json["courseName"],
        date: json["date"],
        isSessionToday: json["isSessionToday"],
        lessonFarReview: json["lessonFarReview"],
        lessonMemorize: json["lessonMemorize"],
        lessonNearReview: json["lessonNearReview"],
        lessonTajweed: json["lessonTajweed"],
        lessonTask: json["lessonTask"],
        lessonTest: json["lessonTest"],
        scheduled: json["scheduled"],
        taskAnswer: json["taskAnswer"],
        taskFilePath: json["taskFilePath"],
        taskGrade: json["taskGrade"],
        testAnswer: json["testAnswer"],
        testFilePath: json["testFilePath"],
        testGrade: json["testGrade"],
        studentFullName: json["studentFullName"],
      );
}
