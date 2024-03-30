import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marsous/models/notification_model.dart';
import 'package:marsous/resources/assets_manager.dart';
import 'package:marsous/resources/font_manager.dart';
import 'package:marsous/screens/marsous_getx_controller/marsous_getx_controller.dart';
import 'package:marsous/widgets/notification_item.dart';
import 'package:marsous/widgets/shimmer_loading/shimmer_loading_notification_item.dart';
import 'package:shimmer/shimmer.dart';

import '../../resources/color_manager.dart';

class NotificationsView extends StatefulWidget {
  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  //controller
  final MarsousGetXController _marsousGetXController =
      Get.find<MarsousGetXController>();
  final NotificationModel _notificationModel = Get.put(NotificationModel());

  @override
  void initState() {
    _marsousGetXController.getNotifications(context: context);
    super.initState();
  }

  var isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MarsousGetXController>(
        id: "notifications",
        builder: (controller) => Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(2.00, -1.50),
              end: Alignment(0, 1),
              colors: [ColorManager.primary, Colors.white],
            ),
            image: const DecorationImage(
              image: AssetImage(ImageAssets.loginMask),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("الإشعارات",
                    style: TextStyle(
                        fontSize: FontSize.s20,
                        color: Colors.black,
                        fontWeight: FontWeight.w700)),
                controller.notifications.isEmpty
                    ? Expanded(
                        child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) => getShimmerLoading(),
                      ))
                    : Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.notifications.length,
                          itemBuilder: (context, index) {
                            Get.put<NotificationModel>(
                                controller.notifications[index],
                                tag: "${controller.notifications[index].id}");
                            return NotificationItem(
                              tag: "${controller.notifications[index].id}",
                            );
                          },
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Shimmer getShimmerLoading() {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ShimmerLoadingNotificationItem());
  }
}
