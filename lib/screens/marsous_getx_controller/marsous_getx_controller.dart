import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsous/data/api/controllers/notification_api_controller.dart';
import 'package:marsous/models/api_response.dart';

import '../../data/api/controllers/banner_api_controller.dart';
import '../../models/banner_model.dart';
import '../../models/notification_model.dart';

class MarsousGetXController extends GetxController {
  //this controller has GetX controller for banner api, notification api, Marsous info api

  final BannerApiController _bannerApiController = BannerApiController();
  final NotificationApiController _notificationApiController =
      NotificationApiController();

  List<BannerModel> banners = [];
  List<NotificationModel> notifications = [];
  ApiResponse? apiResponse;


  void getBanners({required BuildContext context}) async {
    try {
      banners = await _bannerApiController.getBanners();
      update(["banners"]);
    } catch (e) {
      print("student - banner error : $e");
    }
  }

  void getNotifications({required BuildContext context}) async {
    try {
      notifications = await _notificationApiController.getNotifications();
      update(["notifications"]);
    } catch (e) {
      print("marsous - get notification error : $e");
    }
  }

  void markNotificationAsRead({
    required BuildContext context,
    required String notiId,
  }) async {
    try {
      apiResponse = await _notificationApiController.makeNotificationAsRead(
          notiId: notiId);
      update();
    } catch (e) {
      print("marsous - mark notification as read api error : $e");
    }
  }
}
