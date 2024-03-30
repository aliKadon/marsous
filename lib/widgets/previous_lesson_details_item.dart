import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marsous/resources/assets_manager.dart';
import 'package:marsous/resources/color_manager.dart';
import 'package:marsous/resources/font_manager.dart';
import 'package:marsous/screens/student_page/student_page_view.dart';

class PreviousLessonDetailsItem extends StatefulWidget {
  final bool isAttendance;

  PreviousLessonDetailsItem({required this.isAttendance});

  @override
  State<PreviousLessonDetailsItem> createState() =>
      _PreviousLessonDetailsItemState();
}

class _PreviousLessonDetailsItemState extends State<PreviousLessonDetailsItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => StudentPageView(),
          ),
        );
      },
      child: Container(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(13.w),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.studentImage,
                  height: 50.h,
                ),
                SizedBox(width: 5.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "#255255",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "محمد عبد الله عبد الله",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: FontSize.s12),
                    ),
                  ],
                ),
                const Spacer(),
                widget.isAttendance == true
                    ? Stack(
                        children: [
                          Image.asset(
                            ImageAssets.star,
                            height: 40.h,
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "10",
                                style: TextStyle(color: ColorManager.primary),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(
                        padding: EdgeInsets.only(
                            top: 5.w, bottom: 5.w, right: 15.w, left: 15.w),
                        decoration: BoxDecoration(
                          color: const Color(0x19E05858),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Text(
                          "غائب",
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
