import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marsous/screens/constant_lesson/student_lesson_view.dart';
import 'package:marsous/widgets/student_widget/contsant_student_rating_widget.dart';

import '../../resources/color_manager.dart';

class ConstantStudentRateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تقيم  الطالب “ محمد عبد الله “"),
      ),
      body: Container(
        color: Colors.grey.withOpacity(0.1),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ConstantStudentRatingWidget(
                    title: "المراجعه البعيده",
                  ),
                  ConstantStudentRatingWidget(
                    title: "المراجعة القريبة",
                  ),
                  ConstantStudentRatingWidget(
                    title: "التسميع",
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 10.w),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [
                        ColorManager.secondary,
                        ColorManager.secondaryDark
                      ],
                    )),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r)),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => StudentLessonView(),
                        ),
                      );
                    },
                    child: const Text("تأكيد")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
