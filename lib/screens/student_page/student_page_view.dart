import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marsous/widgets/student_widget/student_lesson_record_item.dart';
import 'package:marsous/widgets/student_widget/student_test_record_item.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';

class StudentPageView extends StatefulWidget {
  @override
  State<StudentPageView> createState() => _StudentPageViewState();
}

class _StudentPageViewState extends State<StudentPageView> {
  int select = 0;
  List<bool> list = [false, true, true, false];
  List<bool> list1 = [false, false, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              // color: Colors.red,
              gradient: LinearGradient(
                begin: Alignment(0.50, -1.00),
                end: Alignment(0, 1),
                colors: [ColorManager.primary, Colors.white],
              ),
              image: const DecorationImage(
                  image: AssetImage(ImageAssets.loginMask), fit: BoxFit.fill),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 40.w, right: 20.w, left: 20.w, bottom: 20.w),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.arrow_back),
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        "صفحة الطالب",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: FontSize.s16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 400.w,
                        margin: EdgeInsets.only(top: 40.h),
                        padding: EdgeInsets.only(left: 10.w, right: 10.w),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 25.w, right: 25.w, top: 75.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "محمد عبد الله محمد",
                                  style: TextStyle(
                                      color: ColorManager.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: FontSize.s15),
                                ),
                                SizedBox(height: 5.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: ColorManager.primary,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "الكويت , مدينة الكويت",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: FontSize.s14),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      IconsAssets.loginEmailIcon,
                                      height: 20.h,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "Mohamed Alii@gmail.com",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: FontSize.s14),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.h),
                                IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              "1254",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: FontSize.s16,
                                                  color: ColorManager.black),
                                            ),
                                            Text(
                                              "كود الطالب",
                                              style: TextStyle(
                                                  color: ColorManager
                                                      .secondaryDark,
                                                  fontSize: FontSize.s10,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const VerticalDivider(
                                        thickness: 1,
                                        color: Colors.grey,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              "10",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: FontSize.s16,
                                                  color: Colors.green),
                                            ),
                                            Text(
                                              " ايام الحضور",
                                              style: TextStyle(
                                                  color: ColorManager
                                                      .secondaryDark,
                                                  fontSize: FontSize.s10,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const VerticalDivider(
                                        thickness: 1,
                                        color: Colors.grey,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              "2",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: FontSize.s16,
                                                  color: ColorManager.red),
                                            ),
                                            Text(
                                              " ايام الغياب ",
                                              style: TextStyle(
                                                  color: ColorManager
                                                      .secondaryDark,
                                                  fontSize: FontSize.s10,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const VerticalDivider(
                                        thickness: 1,
                                        color: Colors.grey,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.star,
                                                    color:
                                                        ColorManager.primary),
                                                Text(
                                                  "(4.5)",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: FontSize.s16,
                                                      color:
                                                          ColorManager.primary),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "متوسط التقيمات",
                                              style: TextStyle(
                                                  color: ColorManager
                                                      .secondaryDark,
                                                  fontSize: FontSize.s8,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            // width: MediaQuery.of(context).size.width * 0.5,
                            padding: EdgeInsets.only(right: 20.w, left: 20.w),
                            child: Image.asset(
                              ImageAssets.studentImage,
                              height: 100.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            child: Row(
              children: [
                SizedBox(width: 10.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        select = 0;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color:
                            select == 0 ? ColorManager.primary : Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.r),
                        ),
                      ),
                      child: Text(
                        "سجل المنهج",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: select == 0 ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        select = 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        color:
                            select == 1 ? ColorManager.primary : Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.r),
                        ),
                      ),
                      child: Text(
                        "سجل الاختبارات",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: select == 1 ? Colors.white : Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: FontSize.s14,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30.w),
                Image.asset(
                  IconsAssets.homeworkIcon,
                  height: 23.h,
                  color: Colors.black,
                ),
                SizedBox(width: 10.w),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: 4,
            padding: EdgeInsets.all(5.w),
            itemBuilder: (context, index) {
              return select == 1
                  ? StudentTestRecord(isAttendance: list[index])
                  : StudentLessonRecordItem(isAttendance: list1[index]);
            },
          ))
        ],
      ),
    );
  }
}
