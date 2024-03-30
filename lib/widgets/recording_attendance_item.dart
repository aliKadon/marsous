import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marsous/resources/assets_manager.dart';
import 'package:marsous/resources/color_manager.dart';
import 'package:marsous/resources/font_manager.dart';
import 'package:marsous/screens/constant_lesson/constant_student_rate_view.dart';

import '../screens/flex_lesson/student_rate_view.dart';

class RecordingAttendanceItem extends StatefulWidget {
  final bool isSelected;
  final bool isFlex;

  RecordingAttendanceItem({required this.isSelected, required this.isFlex});

  @override
  State<RecordingAttendanceItem> createState() =>
      _RecordingAttendanceItemState();
}

class _RecordingAttendanceItemState extends State<RecordingAttendanceItem> {
  bool isAttendance = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.white,
          border: widget.isSelected == true
              ? Border.all(color: ColorManager.primary)
              : Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Row(
            children: [
              Image.asset(ImageAssets.studentImage, height: 60.h),
              SizedBox(
                width: 5.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "محمد عبد الله عبد الله",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: FontSize.s14,
                    ),
                  ),
                  Row(
                    children: [
                      isAttendance == false
                          ? ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13.r),
                                    side:
                                        BorderSide(color: ColorManager.primary),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  isAttendance = !isAttendance;
                                });
                              },
                              child: Text("تسجيل الحضور",
                                  style: TextStyle(
                                      color: ColorManager.primary,
                                      fontSize: FontSize.s14)),
                            )
                          : ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    ColorManager.primary),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13.r),
                                    side:
                                        BorderSide(color: ColorManager.primary),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  isAttendance = !isAttendance;
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(2.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.r),
                                      border: Border.all(
                                          color: Colors.white, width: 1.5.w),
                                    ),
                                    child: Icon(Icons.done_outlined,
                                        color: Colors.white, size: 12.h),
                                  ),
                                  SizedBox(width: 3.w),
                                  Text("تم التسجيل",
                                      style: TextStyle(
                                          color: ColorManager.white,
                                          fontSize: FontSize.s14)),
                                ],
                              ),
                            ),
                      SizedBox(width: 15.w),
                      SizedBox(
                        width: 125.w,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13.r),
                                side: BorderSide(color: ColorManager.primary),
                              ),
                            ),
                          ),
                          onPressed: () {
                            widget.isFlex == true
                                ? Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => StudentRateView(),
                                    ),
                                  )
                                : Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ConstantStudentRateView(),
                                    ),
                                  );
                          },
                          child: Text("تقيم",
                              style: TextStyle(
                                  color: ColorManager.primary,
                                  fontSize: FontSize.s16)),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     setState(() {
                      //       isAttendance == !isAttendance;
                      //     });
                      //   },
                      //   child: isAttendance == false
                      //       ? Container(
                      //           padding: EdgeInsets.only(
                      //               top: 12.w,
                      //               bottom: 12.w,
                      //               left: 20.w,
                      //               right: 20.w),
                      //           decoration: BoxDecoration(
                      //             border:
                      //                 Border.all(color: ColorManager.primary),
                      //             borderRadius: BorderRadius.all(
                      //               Radius.circular(15.r),
                      //             ),
                      //           ),
                      //           child: Text(
                      //             "تسجيل الحضور",
                      //             style: TextStyle(color: ColorManager.primary),
                      //           ),
                      //         )
                      //       : Container(
                      //           padding: EdgeInsets.only(
                      //               top: 12.w,
                      //               bottom: 12.w,
                      //               left: 20.w,
                      //               right: 20.w),
                      //           decoration: BoxDecoration(
                      //             color: ColorManager.primary,
                      //             border:
                      //                 Border.all(color: ColorManager.primary),
                      //             borderRadius: BorderRadius.all(
                      //               Radius.circular(15.r),
                      //             ),
                      //           ),
                      //           child: Text(
                      //             "تم التسجيل",
                      //             style: TextStyle(color: ColorManager.white),
                      //           ),
                      //         ),
                      // ),

                      // Container(
                      //   padding: EdgeInsets.only(
                      //       top: 12.w, bottom: 12.w, right: 45.w, left: 45.w),
                      //   decoration: BoxDecoration(
                      //     border: Border.all(color: ColorManager.primary),
                      //     borderRadius: BorderRadius.all(
                      //       Radius.circular(15.r),
                      //     ),
                      //   ),
                      //   child: Text(
                      //     "تقيم",
                      //     style: TextStyle(color: ColorManager.primary),
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
