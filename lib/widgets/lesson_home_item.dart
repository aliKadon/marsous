import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marsous/resources/assets_manager.dart';
import 'package:marsous/resources/color_manager.dart';
import 'package:marsous/resources/font_manager.dart';
import 'package:marsous/screens/constant_lesson/constant_lesson_details_view.dart';

import '../models/course_model.dart';
import '../screens/flex_lesson/flex_lesson_details_view.dart';

class LessoneHomeItem extends StatefulWidget {
  final CourseModel courseModel;

  LessoneHomeItem({required this.courseModel});

  @override
  State<LessoneHomeItem> createState() => _LessoneHomeItemState();
}

class _LessoneHomeItemState extends State<LessoneHomeItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
      ),
      child: GestureDetector(
        onTap: () {
          widget.courseModel.typeName == "ثابتة"
              ? Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ConstantLessonDetailsView(),
                  ),
                )
              : Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FlexLessonDetailsView(),
                  ),
                );
        },
        child: Card(
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          child: Padding(
            padding: EdgeInsets.only(
                top: 15.w, bottom: 20.w, left: 10.w, right: 10.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "${widget.courseModel.name}",
                      style: TextStyle(
                          color: ColorManager.secondaryDark,
                          fontWeight: FontWeight.w800,
                          fontSize: FontSize.s14),
                    ),
                    const Spacer(),
                    widget.courseModel.typeName != "ثابتة"
                        ? Container(
                            padding: EdgeInsets.only(
                                top: 5.w, bottom: 5.w, right: 15.w, left: 15.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE6F5F1),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              "مرنة",
                              style: TextStyle(
                                  color: const Color(0xFF059A6D),
                                  fontWeight: FontWeight.w800,
                                  fontSize: FontSize.s14),
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.only(
                                top: 5.w, bottom: 5.w, right: 15.w, left: 15.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9F1E9),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              "ثابتة",
                              style: TextStyle(
                                  color: const Color(0xFFE1BB93),
                                  fontWeight: FontWeight.w800,
                                  fontSize: FontSize.s14),
                            ),
                          ),
                  ],
                ),
                SizedBox(height: 5.w),
                Text(
                  "${widget.courseModel.description}ً",
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 5.w),
                Row(
                  children: [
                    items(text: "${widget.courseModel.courseLevel}"),
                    const Spacer(),
                    items(text: "${widget.courseModel.courseAttendanceTypeName}"),
                    const Spacer(),
                    items(text: "${widget.courseModel.maxNumberOfStudents}  طالب", isArrow: true),
                  ],
                ),
                // Visibility(
                //     visible: !widget.isConstant,
                //     child: Column(
                //       children: [
                //         Divider(
                //           color: Colors.grey.withOpacity(0.4),
                //           thickness: 1,
                //         ),
                //         Row(
                //           children: [
                //             Icon(
                //               Icons.date_range_outlined,
                //               color: ColorManager.primary,
                //             ),
                //             SizedBox(width: 5.w),
                //             Text(
                //               "السبت  - الإثنين-  الأربعاء",
                //               style: TextStyle(
                //                   color: ColorManager.primary,
                //                   fontSize: FontSize.s14),
                //             ),
                //             const Spacer(),
                //             Icon(
                //               Icons.access_time_outlined,
                //               color: ColorManager.primary,
                //             ),
                //             SizedBox(width: 5.w),
                //             Text(
                //               "4:00 م",
                //               style: TextStyle(
                //                   color: ColorManager.primary,
                //                   fontSize: FontSize.s14),
                //             )
                //           ],
                //         )
                //       ],
                //     ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container items({
    required String text,
    bool isArrow = false,
  }) {
    return Container(
      padding: EdgeInsets.all(7.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.grey.withOpacity(0.2),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF797D7D),
            ),
          ),
          SizedBox(width: 7.w),
          Visibility(
              visible: isArrow,
              child: Image.asset(
                ImageAssets.arrow,
                height: 10.w,
              ))
        ],
      ),
    );
  }
}
