import 'package:get/get.dart';

class NotificationModel extends GetxController{
  String? id;
  String? createdDate;
  String? notiHeader;
  String? notiBody;
  String? message;
  String? notiImage;
  String? personId;
  String? marsCenterId;
  int? receiverType;
  bool? isAuto;
  bool? isRead;
  bool? fromSysAdmin;

  NotificationModel({
    this.message,
    this.marsCenterId,
    this.id,
    this.isRead,
    this.isAuto,
    this.createdDate,
    this.fromSysAdmin,
    this.notiBody,
    this.notiHeader,
    this.notiImage,
    this.personId,
    this.receiverType,
  });

  void toggleIsRead() {
    isRead = !isRead!;
    update();
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["id"],
    marsCenterId: json["marsCenterId"],
    message: json["message"],
    isRead: json["isRead"],
    isAuto: json["isAuto"],
    createdDate: json["createdDate"],
    fromSysAdmin: json["fromSysAdmin"],
    notiBody: json["notiBody"],
    notiHeader: json["notiHeader"],
    notiImage: json["notiImage"],
    personId: json["personId"],
    receiverType: json["receiverType"],

  );
}
