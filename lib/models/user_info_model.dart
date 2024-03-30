import 'package:get/get.dart';
import 'package:marsous/models/center_model.dart';
import 'package:marsous/models/children_model.dart';

class UserInfoModel extends GetxController {
  String? userName;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? address;
  int? code;
  int? attendanceCount;
  int? absenceCount;
  bool? isParent;
  bool? student;
  bool? turtor;
  String? myToken;
  String? role;
  String? image;
  List<ChildrenModel>? children;
  List<CenterModel>? centers;

  UserInfoModel({
    this.userName,
    this.image,
    this.email,
    this.phoneNumber,
    this.fullName,
    this.role,
    this.address,
    this.children,
    this.code,
    this.isParent,
    this.myToken,
    this.centers,
    this.student,
    this.turtor,
    this.absenceCount,
    this.attendanceCount,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        image: json["image"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        fullName: json["fullName"],
        role: json["role"],
        userName: json["userName"],
        myToken: json["myToken"],
        code: json["code"],
        isParent: json["isParent"],
        children: json["children"] == null
            ? null
            : List<ChildrenModel>.from(
                json["children"].map(
                  (x) => ChildrenModel.fromJson(x),
                ),
              ),
        address: json["address"],
        centers: json["centers"] == null
            ? null
            : List<CenterModel>.from(
          json["centers"].map(
                (x) => CenterModel.fromJson(x),
          ),
        ),
        student: json["student"],
        turtor: json["turtor"],
        absenceCount: json["absenceCount"],
        attendanceCount: json["attendanceCount"],
      );
}
