import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../models/session_model.dart';
import '../resources/assets_manager.dart';
import '../resources/font_manager.dart';

class TestsItem extends StatefulWidget {
  final SessionModel? sessionModel;

  TestsItem({this.sessionModel});

  @override
  State<TestsItem> createState() => _TestsItemState();
}

class _TestsItemState extends State<TestsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(15.w),
          child: Row(
            children: [
              widget.sessionModel!.testGrade != -1
                  ? Container(
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Image.asset(
                        IconsAssets.done,
                        height: 25.h,
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Image.asset(
                        IconsAssets.clockHomework,
                        height: 40.h,
                      ),
                    ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${DateFormat('yMMMMEEEEd', 'ar').format(DateTime.parse(widget.sessionModel!.date!))}",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 220.w,
                    child: Row(
                      children: [
                        Text(
                          "${widget.sessionModel?.lessonTest}",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: FontSize.s15,
                          ),
                        ),
                        // Visibility(
                        //   visible: !widget.isEnded,
                        //   child: Text(
                        //     "(جديد)",
                        //     overflow: TextOverflow.ellipsis,
                        //     style: TextStyle(
                        //       color: ColorManager.primary,
                        //       fontWeight: FontWeight.w600,
                        //       fontSize: FontSize.s15,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
