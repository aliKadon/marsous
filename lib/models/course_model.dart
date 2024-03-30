import 'package:get/get.dart';

class CourseModel extends GetxController {
  String? id;
  int? type;
  String? courseAttendanceTypeId;
  String? name;
  String? courseLevelId;
  int? maxNumberOfStudents;
  String? description;
  String? startDate;
  String? endDate;
  String? marsCenterId;
  bool? isDeleted;
  bool? student;
  bool? status;
  int? enrolledStudents;
  String? courseLevel;
  String? courseAttendanceTypeName;
  String? typeName;
  String? centerName;

  CourseModel({
    this.id,
    this.name,
    this.student,
    this.status,
    this.type,
    this.description,
    this.startDate,
    this.endDate,
    this.centerName,
    this.courseAttendanceTypeId,
    this.courseAttendanceTypeName,
    this.courseLevel,
    this.courseLevelId,
    this.enrolledStudents,
    this.isDeleted,
    this.marsCenterId,
    this.maxNumberOfStudents,
    this.typeName,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        name: json["name"],
        id: json["id"],
        student: json["student"],
        type: json["type"],
        description: json["description"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        centerName: json["centerName"],
        courseAttendanceTypeId: json["courseAttendanceTypeId"],
        courseAttendanceTypeName: json["courseAttendanceTypeName"],
        courseLevel: json["courseLevel"],
        courseLevelId: json["courseLevelId"],
        enrolledStudents: json["enrolledStudents"],
        isDeleted: json["isDeleted"],
        marsCenterId: json["marsCenterId"],
        maxNumberOfStudents: json["maxNumberOfStudents"],
        status: json["status"],
        typeName: json["typeName"],
      );
}
