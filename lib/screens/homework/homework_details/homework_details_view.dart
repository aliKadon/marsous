import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:marsous/models/session_model.dart';
import 'package:marsous/widgets/homework_details_item.dart';
import 'package:shimmer/shimmer.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../widgets/shimmer_loading/shimmer_loading_task_test_item.dart';
import '../../home/student_session_getx_controller/student_session_getx_controller.dart';

class HomeworkDetailsView extends StatefulWidget {
  final SessionModel sessionModel;

  HomeworkDetailsView({required this.sessionModel});

  @override
  State<HomeworkDetailsView> createState() => _HomeworkDetailsViewState();
}

class _HomeworkDetailsViewState extends State<HomeworkDetailsView> {
  //CONTROLLER
  final StudentSessionGetXController _studentSessionGetXController =
      Get.put(StudentSessionGetXController());

  @override
  void initState() {
    _studentSessionGetXController.getStudentSession(
        sessionId: widget.sessionModel.id!);
    super.initState();
  }

  List<bool> list = [true, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${DateFormat('yMMMMEEEEd', 'ar').format(DateTime.parse(widget.sessionModel.date!))}"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          _studentSessionGetXController.isLoading = true;
          Navigator.of(context).pop();

          return false;
        },
        child: Container(
          color: Colors.grey.withOpacity(0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
                        child:
                            Image.asset(IconsAssets.searchIcon, height: 23.h),
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
              SizedBox(
                height: 15.h,
              ),
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      ImageAssets.aboutUsStar,
                      height: 25.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    SizedBox(
                      width: 300.w,
                      child: Text(
                        "${widget.sessionModel.lessonTask}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: FontSize.s13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "الطلاب",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: FontSize.s16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GetBuilder<StudentSessionGetXController>(
                builder: (controller) => controller.isLoading == true
                    ? Expanded(
                        child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return getShimmerLoading();
                        },
                      ))
                    : Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.studentSession.length,
                          itemBuilder: (context, index) {
                            Get.put<SessionModel>(
                                controller.studentSession[index],
                                tag: "${controller.studentSession[index].id}");
                            return HomeworkDetailsItem(
                              tag: "${controller.studentSession[index].id}",
                              sessionModel: controller.studentSession[index],
                            );
                          },
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Shimmer getShimmerLoading() {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ShimmerLoadingTaskTestItem());
  }
}
