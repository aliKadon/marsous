import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:marsous/resources/assets_manager.dart';
import 'package:marsous/resources/font_manager.dart';

import '../models/session_model.dart';
import '../screens/homework/homework_details/homework_details_view.dart';

class HomeworkItem extends StatefulWidget {
  final SessionModel sessionModel;

  HomeworkItem({required this.sessionModel});

  @override
  State<HomeworkItem> createState() => _HomeworkItemState();
}

class _HomeworkItemState extends State<HomeworkItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                HomeworkDetailsView(sessionModel: widget.sessionModel),
          ),
        );
      },
      child: Card(
        child: Container(
          // width: double.infinity,
          padding: EdgeInsets.all(15.w),
          height: 90.h,
          child: Row(
            children: [
              widget.sessionModel.taskGrade != -1
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
                    DateFormat('yMMMMEEEEd', 'ar').format(DateTime.parse(
                        widget.sessionModel.date ?? "02024-04-07 00:00")),
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "${widget.sessionModel.lessonTask}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: FontSize.s14,
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
