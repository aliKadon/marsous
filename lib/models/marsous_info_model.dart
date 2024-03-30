class MarsousInfoModel {
  String? description;
  String? image;
  String? marsEmail;
  String? marsLandPhone;
  String? marsMobilePhone;
  String? marsWebSite;
  String? marsAddress;
  int? studentCount;
  int? tutorCount;
  int? centerCount;

  MarsousInfoModel({
    this.image,
    this.description,
    this.centerCount,
    this.marsAddress,
    this.marsEmail,
    this.marsLandPhone,
    this.marsMobilePhone,
    this.marsWebSite,
    this.studentCount,
    this.tutorCount,
  });

  factory MarsousInfoModel.fromJson(Map<String,dynamic> json) => MarsousInfoModel(
    image: json["image"],
    description: json["description"],
    centerCount: json["centerCount"],
    marsAddress: json["marsAddress"],
    marsEmail: json["marsEmail"],
    marsLandPhone: json["marsLandPhone"],
    marsMobilePhone: json["marsMobilePhone"],
    marsWebSite: json["marsWebSite"],
    studentCount: json["studentCount"],
    tutorCount: json["tutorCount"],
  );
}
