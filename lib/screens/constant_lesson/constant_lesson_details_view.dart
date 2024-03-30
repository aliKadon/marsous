import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marsous/screens/constant_lesson/constant_previous_lesson_details_view.dart';
import 'package:marsous/screens/constant_lesson/constant_recording_attendance_view.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../widgets/previous_lesson_item.dart';
import '../../widgets/student_widget/student_previous_lesson_item.dart';

class ConstantLessonDetailsView extends StatefulWidget {
  @override
  State<ConstantLessonDetailsView> createState() => _ConstantLessonDetailsViewState();
}

class _ConstantLessonDetailsViewState extends State<ConstantLessonDetailsView> {
  List<bool> list = [false,true,true];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تفاصيل الحلقة"),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ConstantRecordingAttendaceView(),
                ),
              );
            },
            child: Container(
              width: 370.w,
              padding: EdgeInsets.only(
                top: 15.w,
                bottom: 15.w,
              ),
              // margin: EdgeInsets.only(right: 15.w, left: 15.w),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(ImageAssets.loginMask),
                      fit: BoxFit.fill),
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Row(
                children: [
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "تسجيل الحضور",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: FontSize.s16,
                            color: Colors.white),
                      ),
                      Text(
                        "من هنا يمكنك تسجيل حضور الطلاب وتسجيل تقييمهم اليومي بالحلقة ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: FontSize.s10,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: ColorManager.white,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r)),
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          ImageAssets.aboutUsStar,
                          height: 20.h,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "مقرر حلقه اليوم",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: FontSize.s15,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Text(
                          "15 مارس 2023",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2.w,
                    ),
                    lessonDetailsItem(
                        title: "التسميع", sora: "البقره ( 150 - 200 )"),
                    lessonDetailsItem(
                        title: "المراجعه البعيده",
                        sora: "البقره ( 150 - 200 )"),
                    lessonDetailsItem(
                        title: "المراجعة القريبة ",
                        sora: "البقره ( 150 - 200 )"),
                    lessonDetailsItem(
                        title: "التجويد", sora: "البقره ( 150 - 200 )"),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15.w, left: 15.w, top: 20.w),
            child: Row(
              children: [
                Text(
                  "الجلسات السابقة",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: FontSize.s16,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Image.asset(
                  IconsAssets.homeworkIcon,
                  height: 23.h,
                  color: Colors.black,
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ConstantPreviousLessonDetailsView(
                            episodeTitle: "جلسة الخميس | 16 مارس "),
                      ),
                    );
                  },
                  child: PreviousLessonItem());
            },
          ))
        ],
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
          Spacer(),
          Text(
            sora,
            style: TextStyle(
                color: ColorManager.primary,
                fontSize: FontSize.s12,
                fontWeight: FontWeight.w800),
          )
        ],
      ),
    );
  }
}
