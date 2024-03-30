import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marsous/resources/font_manager.dart';
import 'package:marsous/widgets/previous_lesson_details_item.dart';

class FlexPrevoiusLessonDetailsView extends StatefulWidget {
  final String episodeTitle;

  FlexPrevoiusLessonDetailsView({required this.episodeTitle});

  @override
  State<FlexPrevoiusLessonDetailsView> createState() =>
      _FlexPrevoiusLessonDetailsViewState();
}

class _FlexPrevoiusLessonDetailsViewState
    extends State<FlexPrevoiusLessonDetailsView> {

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
            Text(
              "الطلاب",
              style: TextStyle(
                color: Colors.black,
                fontSize: FontSize.s18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return PreviousLessonDetailsItem(isAttendance: listAttendance[index],);
              },
            ))
          ],
        ),
      ),
    );
  }
}
