import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marsous/resources/font_manager.dart';

import '../../../../models/session_model.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/color_manager.dart';
import '../../../../widgets/student_widget/student_previous_lesson_item.dart';
import '../../previous_lesson_details_student/previous_lesson_details_student_view.dart';
import '../../student_homework/student_homework_lesson_view.dart';
import '../controller/student_lesson_getx_controller.dart';

class FlexLessonDetailsStudentView extends StatefulWidget {
  String coursId;
  String coursName;

  FlexLessonDetailsStudentView(
      {required this.coursId, required this.coursName});

  @override
  State<FlexLessonDetailsStudentView> createState() =>
      _FlexLessonDetailsStudentViewState();
}

class _FlexLessonDetailsStudentViewState
    extends State<FlexLessonDetailsStudentView> {
  //controller
  final StudentLessonGetXController _studentLessonGetXController =
      Get.put(StudentLessonGetXController());

  ScrollController _scrollController = ScrollController();
  var page = 1;
  var rows = 5;

  //check if it is the bottom of grid
  void scrollListener() {
    print('you in listner');
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      print("reached the bottom");
      print('page1 : ${page + 1}');
      page = page + 1;
      rows = rows + 5;
      // do something when you reach the bottom of the grid
      _studentLessonGetXController.getPreviousLessons(
          courseId: widget.coursId, pageIndex: page, pageSize: 20);
    }
  }

  @override
  void initState() {
    _studentLessonGetXController.getPreviousLessons(
        courseId: widget.coursId, pageIndex: 1, pageSize: 50);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentLessonGetXController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(widget.coursName),
              SizedBox(width: 5.w),
              Text(
                "(مرنة) ",
                style: TextStyle(color: Colors.green, fontSize: FontSize.s10),
              )
            ],
          ),
        ),
        body: controller.previousLessons == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  SizedBox(
                    width: 300.w,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15.r),
                                ),
                                side: BorderSide(color: ColorManager.primary)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => StudentHomeworkLessonView(
                                  session: controller
                                      .previousLessons!.upcomming!),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Text(
                            "عرض الواجب",
                            style: TextStyle(color: ColorManager.primary),
                          ),
                        )),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: 15.w, left: 15.w, top: 20.w),
                    child: Row(
                      children: [
                        Text(
                          "الجلسات السابقة",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: FontSize.s18,
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
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      Get.put<SessionModel>(
                          controller.previousLessons!.old![index],
                          tag: "${controller.previousLessons!.old![index].id}");
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    PreviousLessonDetailsStudentView(
                                      sessionModel: controller.previousLessons!.old![index],
                                        episodeTitle:
                                            "تقييم جلسة الخميس 15 مارس "),
                              ),
                            );
                          },
                          child: StudentPreviousLessonItem(
                            sessionModel: controller.previousLessons!.old![index],
                            tag:
                                "${controller.previousLessons!.old![index].id}",
                          ));
                    },
                  ))
                ],
              ),
      ),
    );
  }
}
