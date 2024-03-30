import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marsous/models/session_model.dart';
import 'package:marsous/resources/color_manager.dart';
import 'package:marsous/resources/font_manager.dart';

class StudentPreviousLessonItem extends StatefulWidget {
  final String tag;
  final SessionModel sessionModel;

  StudentPreviousLessonItem({ required this.tag,required this.sessionModel});

  @override
  State<StudentPreviousLessonItem> createState() =>
      _StudentPreviousLessonItemState();
}

class _StudentPreviousLessonItemState extends State<StudentPreviousLessonItem> {

  @override
  void dispose() {
    Get.delete<SessionModel>(tag: widget.tag);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SessionModel>(
      tag: widget.tag,
      builder: (controller) => Container(
        padding: EdgeInsets.all(7.w),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          child: Padding(
            padding: EdgeInsets.all(13.w),
            child: Row(
              children: [
                Icon(
                  Icons.date_range_outlined,
                  color: ColorManager.primary,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "${DateFormat('yMMMMEEEEd', 'ar').format(DateTime.parse(widget.sessionModel.date!))}",
                  style: TextStyle(color: Colors.black, fontSize: FontSize.s14),
                ),
                const Spacer(),
                widget.sessionModel.attendanceAsString == "حاضر"
                    ? const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      )
                    : Container(
                        padding: EdgeInsets.only(
                            top: 5.w, bottom: 5.w, right: 15.w, left: 15.w),
                        decoration: BoxDecoration(
                          color: const Color(0x19E05858),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Text(
                          "${widget.sessionModel.attendanceAsString}",
                          style: TextStyle(
                              color: const Color(0xFFE05858),
                              fontWeight: FontWeight.w800,
                              fontSize: FontSize.s14),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
