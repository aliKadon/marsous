import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marsous/models/session_model.dart';
import 'package:marsous/screens/student_screens/previous_lesson_details_student/previous_lesson_details_student_view.dart';
import 'package:marsous/screens/student_screens/student_homework/student_homework_lesson_view.dart';
import 'package:marsous/screens/student_screens/student_lessons/controller/student_lesson_getx_controller.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/font_manager.dart';
import '../../../../widgets/student_widget/student_previous_lesson_item.dart';

class ConstantLessonDetailsStudentView extends StatefulWidget {
  String coursId;
  String coursName;

  ConstantLessonDetailsStudentView(
      {required this.coursId, required this.coursName});

  @override
  State<ConstantLessonDetailsStudentView> createState() =>
      _ConstantLessonDetailsStudentViewState();
}

class _ConstantLessonDetailsStudentViewState
    extends State<ConstantLessonDetailsStudentView> {
  //controller
  final StudentLessonGetXController _studentLessonGetXController =
      Get.put(StudentLessonGetXController());

  // final StudentHomeGetXController _studentHomeGetXController = Get.put(StudentHomeGetXController());

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
                "(ثابتة) ",
                style: TextStyle(
                    color: ColorManager.primary, fontSize: FontSize.s10),
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
                  Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
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
                                  "${DateFormat('yMMMMEEEEd', 'ar').format(DateTime.parse(controller.previousLessons!.upcomming!.date!))}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 2.w,
                            ),
                            controller.previousLessons!.upcomming!
                                    .lessonMemorize!.isEmpty
                                ? Container()
                                : lessonDetailsItem(
                                    title: "التسميع",
                                    sora:
                                        "${controller.previousLessons?.upcomming?.lessonMemorize}"),
                            controller.previousLessons!.upcomming!
                                    .lessonFarReview!.isEmpty
                                ? Container()
                                : lessonDetailsItem(
                                    title: "المراجعه البعيده",
                                    sora:
                                        "${controller.previousLessons!.upcomming!.lessonFarReview}"),
                            controller.previousLessons!.upcomming!
                                    .lessonNearReview!.isEmpty
                                ? Container()
                                : lessonDetailsItem(
                                    title: "المراجعة القريبة ",
                                    sora:
                                        "${controller.previousLessons!.upcomming!.lessonNearReview}"),
                            controller.previousLessons!.upcomming!
                                    .lessonTajweed!.isEmpty
                                ? Container()
                                : lessonDetailsItem(
                                    title: "التجويد",
                                    sora:
                                        "${controller.previousLessons!.upcomming!.lessonTajweed}"),
                            SizedBox(
                              height: 15.h,
                            ),
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
                                          side: BorderSide(
                                              color: ColorManager.primary)),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            StudentHomeworkLessonView(
                                                session: controller
                                                    .previousLessons!
                                                    .upcomming!),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(10.w),
                                    child: Text(
                                      "عرض الواجب",
                                      style: TextStyle(
                                          color: ColorManager.primary),
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                          ],
                        ),
                      ),
                    ),
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
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.previousLessons!.old!.length,
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
                                            "تقييم جلسة ${DateFormat('yMMMMEEEEd', 'ar').format(DateTime.parse(controller.previousLessons!.old![index].date!))} "),
                              ),
                            );
                          },
                          child: StudentPreviousLessonItem(
                            sessionModel:
                                controller.previousLessons!.old![index],
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

  Container lessonDetailsItem({
    required String title,
    required String sora,
  }) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 90.w,
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: FontSize.s12,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Spacer(),
          SizedBox(
            width: 230.w,
            child: Text(
              sora,
              textAlign: TextAlign.end,
              style: TextStyle(
                  color: ColorManager.primary,
                  fontSize: FontSize.s12,
                  fontWeight: FontWeight.w800),
            ),
          )
        ],
      ),
    );
  }
}
