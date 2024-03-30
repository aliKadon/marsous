import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/font_manager.dart';

class ShimmerLoadingNotificationItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.w),
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Container(
            height: 40.h,
            width: 40.w,
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50.r)),
          ),
          SizedBox(width: 7.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 150.w,
                height: 23.h,
                color: Colors.white,
              ),
              SizedBox(height: 15.w),
              Container(
                width: 150.w,
                height: 23.h,
                color: Colors.white,
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 50.w,
            height: 23.h,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
