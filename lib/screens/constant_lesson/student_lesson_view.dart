import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marsous/resources/font_manager.dart';
import 'package:marsous/widgets/student_widget/student_lesson_item.dart';

import '../../resources/assets_manager.dart';

class StudentLessonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("طلاب الحلقة"),
      ),
      body: Container(
        color: Colors.grey.withOpacity(0.1),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.r))),
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                        color: Color(0xFFF9F1E9),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                      child: Image.asset(IconsAssets.searchIcon, height: 23.h),
                    ),
                    SizedBox(
                      width: 300.w,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "بحث بإسم الطالب / كود الطالب",
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: FontSize.s14),
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(5.w),
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5.w,
                    crossAxisSpacing: 5.w),
                itemBuilder: (context, index) {
                  return StudentLessonItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
