import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marsous/models/notification_model.dart';
import 'package:marsous/resources/assets_manager.dart';
import 'package:marsous/resources/font_manager.dart';

import '../screens/marsous_getx_controller/marsous_getx_controller.dart';

class NotificationItem extends StatefulWidget {
  String tag;

  NotificationItem({required this.tag});

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  //controller
  final MarsousGetXController _marsousGetXController =
      Get.find<MarsousGetXController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationModel>(
      tag: widget.tag,
      builder: (controller) => GestureDetector(
        onTap: () {
          _marsousGetXController.markNotificationAsRead(
              context: context, notiId: controller.id!);
          controller.toggleIsRead();
        },
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10.w),
              padding: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  Image.asset(
                    ImageAssets.notificationImage,
                    height: 50.h,
                  ),
                  SizedBox(width: 7.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "منصة مرصوص",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: FontSize.s14),
                      ),
                      SizedBox(
                        width: 170.w,
                        child: Text(
                          "${controller.message}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: FontSize.s12),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    DateFormat("h:mma")
                        .format(DateTime.parse(controller.createdDate!)),
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            controller.isRead == false
                ? Container(
                    height: 5.h,
                    width: 5.w,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20.r)),
                  )
                : Icon(Icons.done_outline, color: Colors.green),
          ],
        ),
      ),
    );
  }
}
