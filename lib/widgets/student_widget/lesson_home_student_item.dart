import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marsous/models/course_model.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../screens/student_screens/student_lessons/constant_lesson_student/constant_lesson_details_student_view.dart';
import '../../screens/student_screens/student_lessons/flex_lesson_student/flex_lesson_details_student_view.dart';

class LessonHomeStudentHome extends StatefulWidget {
  final String tag;
  final CourseModel courseModel;

  LessonHomeStudentHome({required this.tag,required this.courseModel});

  @override
  State<LessonHomeStudentHome> createState() => _LessonHomeStudentHomeState();
}

class _LessonHomeStudentHomeState extends State<LessonHomeStudentHome> {

  @override
  void dispose() {
    Get.delete<CourseModel>(tag: widget.tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseModel>(
      tag: widget.tag,
      builder: (controller) => Container(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
        ),
        child: GestureDetector(
          onTap: () {
            widget.courseModel.typeName == "ثابتة"
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ConstantLessonDetailsStudentView(
                          coursId: widget.courseModel.id!,
                          coursName: widget.courseModel.name!),
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FlexLessonDetailsStudentView(
                          coursId: widget.courseModel.id!,
                          coursName: widget.courseModel.name!
                      ),
                    ),
                  );
          },
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r)),
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
                                  top: 5.w,
                                  bottom: 5.w,
                                  right: 15.w,
                                  left: 15.w),
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
                                  top: 5.w,
                                  bottom: 5.w,
                                  right: 15.w,
                                  left: 15.w),
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
                      items(
                          text: "${widget.courseModel.maxNumberOfStudents}  طالب",
                          isArrow: true),
                    ],
                  ),
                  Visibility(
                      visible: true,
                      child: Column(
                        children: [
                          Divider(
                            color: Colors.grey.withOpacity(0.4),
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.date_range_outlined,
                                color: ColorManager.primary,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                "السبت  - الإثنين-  الأربعاء",
                                style: TextStyle(
                                    color: ColorManager.primary,
                                    fontSize: FontSize.s14),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.access_time_outlined,
                                color: ColorManager.primary,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                "4:00 م",
                                style: TextStyle(
                                    color: ColorManager.primary,
                                    fontSize: FontSize.s14),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
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
