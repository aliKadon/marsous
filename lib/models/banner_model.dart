import 'package:get/get.dart';

class BannerModel extends GetxController {
  String? image;

  BannerModel({
    this.image,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      BannerModel(image: json["image"]);
}
