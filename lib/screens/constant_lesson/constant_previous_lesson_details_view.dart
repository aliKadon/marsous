import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../widgets/previous_lesson_details_item.dart';

class ConstantPreviousLessonDetailsView extends StatefulWidget {
  final String episodeTitle;

  ConstantPreviousLessonDetailsView({required this.episodeTitle});

  @override
  State<ConstantPreviousLessonDetailsView> createState() =>
      _ConstantPreviousLessonDetailsViewState();
}

class _ConstantPreviousLessonDetailsViewState
    extends State<ConstantPreviousLessonDetailsView> {

  List<bool> listAttendance = [false,true,true,true,true];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.episodeTitle),
      ),
      body: Container(
        padding: EdgeInsets.all(10.w),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                            "المقرر",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: FontSize.s15,
                                fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
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
            Text(
              "الطلاب",
              style: TextStyle(
                color: Colors.black,
                fontSize: FontSize.s16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return PreviousLessonDetailsItem(
                  isAttendance: listAttendance[index],
                );
              },
            ))
          ],
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
