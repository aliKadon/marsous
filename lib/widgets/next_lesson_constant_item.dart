import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../screens/constant_lesson/constant_recording_attendance_view.dart';

class NextLessonConstantItem extends StatefulWidget {
  final int index;

  NextLessonConstantItem({required this.index});

  @override
  State<NextLessonConstantItem> createState() => _NextLessonConstantItemState();
}

class _NextLessonConstantItemState extends State<NextLessonConstantItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7.w),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        child: Padding(
          padding: EdgeInsets.all(13.w),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    color: ColorManager.primary,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "الخميس | 17 مارس 2023",
                    style:
                        TextStyle(color: Colors.black, fontSize: FontSize.s14),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                ],
              ),
              Divider(
                thickness: 2,
                color: Colors.grey.withOpacity(0.2),
              ),
              lessonDetailsItem(title: "التسميع", sora: "البقره ( 150 - 200 )"),
              lessonDetailsItem(
                  title: "المراجعه البعيده", sora: "البقره ( 150 - 200 )"),
              lessonDetailsItem(
                  title: "المراجعة القريبة ", sora: "البقره ( 150 - 200 )"),
              lessonDetailsItem(title: "التجويد", sora: "البقره ( 150 - 200 )"),
              SizedBox(height: 20.h),
              widget.index == 0
                  ? Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
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
                                  builder: (context) =>
                                      ConstantRecordingAttendaceView(),
                                ),
                              );
                            },
                            child: const Text("تسجيل الحضور",style: TextStyle(color: Colors.white))),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Container lessonDetailsItem({
    required String title,
    required String sora,
  }) {
    return Container(
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: FontSize.s12,
                fontWeight: FontWeight.w400),
          ),
          const Spacer(),
          SizedBox(
            width: 200.w,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                sora,
                style: TextStyle(
                    color: ColorManager.primary,
                    fontSize: FontSize.s12,
                    fontWeight: FontWeight.w800),
              ),
            ),
          )
        ],
      ),
    );
  }
}
