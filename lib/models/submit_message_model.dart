class SubmitMessageModel {
  String? userMobilePhone = "";
  String? userName = "";
  String? userFullName = "";
  String? userEmail = "";
  String? questuinSubject = "";
  String? questuinBody = "";
  bool? isToMarsous;

  SubmitMessageModel({
    this.userName,
    this.isToMarsous,
    this.questuinBody,
    this.questuinSubject,
    this.userEmail,
    this.userFullName,
    this.userMobilePhone,
  });

  factory SubmitMessageModel.fromJson(Map<String,dynamic> json) => SubmitMessageModel(
    userName: json["userName"],
    isToMarsous: json["isToMarsous"],
    questuinBody: json["questuinBody"],
    questuinSubject: json["questuinSubject"],
    userEmail: json["userEmail"],
    userFullName: json["userFullName"],
    userMobilePhone: json["userMobilePhone"],
  );

  Map<String,dynamic> toJson() => {
    "userName" : userName,
    "isToMarsous" : isToMarsous,
    "questuinBody" : questuinBody,
    "userEmail" : userEmail,
    "userFullName" : userFullName,
    "userMobilePhone" : userMobilePhone,
    "questuinSubject" : questuinSubject,
  };
}
