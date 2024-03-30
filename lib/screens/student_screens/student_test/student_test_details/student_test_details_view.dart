import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/session_model.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';

class StudentTestDetailsView extends StatefulWidget {
  final SessionModel sessionModel;

  StudentTestDetailsView({required this.sessionModel});

  @override
  State<StudentTestDetailsView> createState() => _StudentTestDetailsViewState();
}

class _StudentTestDetailsViewState extends State<StudentTestDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الاختبار"),
      ),
      body: Container(
        color: Colors.grey.withOpacity(0.1),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              margin: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r)),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.w,
                  ),
                  Text(
                    "${widget.sessionModel.lessonTest}",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.4),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  widget.sessionModel.testGrade == -1
                      ? const Text(
                          "الاختبار لم يتم الإجابة عليه أو قيد التصحيح!",
                          style: TextStyle(color: Colors.black),
                        )
                      : Row(
                          children: [
                            Text(
                              "الدرجة",
                              style: TextStyle(
                                  color: ColorManager.primary,
                                  fontSize: FontSize.s14),
                            ),
                            const Spacer(),
                            Stack(
                              children: [
                                Image.asset(
                                  ImageAssets.star,
                                  height: 40.h,
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${widget.sessionModel.testGrade}",
                                      style: TextStyle(
                                          color: ColorManager.primary),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
