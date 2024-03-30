import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marsous/screens/student_page/student_page_view.dart';
import 'package:marsous/screens/tests/controller/test_getx_controller.dart';

import '../models/session_model.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../screens/home/student_session_getx_controller/student_session_getx_controller.dart';
import '../screens/home/submit_grade_getx_controller/submit_grade_getx_controller.dart';

class TestDetailsItem extends StatefulWidget {
  final SessionModel sessionModel;
  final String tag;

  TestDetailsItem({required this.sessionModel, required this.tag});

  @override
  State<TestDetailsItem> createState() => _TestDetailsItemState();
}

class _TestDetailsItemState extends State<TestDetailsItem> {
  //controller
  final TestGetxController _testGetxController = Get.put(
    TestGetxController(),
  );
  final SubmitGradeGetXController _submitGradeGetXController =
      Get.put(SubmitGradeGetXController());

  //CONTROLLER
  final StudentSessionGetXController _studentSessionGetXController =
      Get.find<StudentSessionGetXController>();

  @override
  void dispose() {
    Get.delete<SessionModel>(tag: widget.tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();

        return false;
      },
      child: GetBuilder<SessionModel>(
        tag: widget.tag,
        builder: (controller) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => StudentPageView(),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(10.w),
            margin: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              children: [
                Image.asset(
                  ImageAssets.studentImage,
                  height: 50.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.sessionModel.studentFullName}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: FontSize.s12),
                    ),
                  ],
                ),
                Spacer(),
                controller.testGrade == -1
                    ? ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              side: BorderSide(color: ColorManager.primary),
                            ),
                          ),
                        ),
                        onPressed: () {
                          _testGetxController.showSheetAddTestDetails(context,
                              _submitGradeGetXController, widget.sessionModel);
                        },
                        child: Text(
                          "اختبر",
                          style: TextStyle(color: ColorManager.primary),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          // _testGetxController.showSheetAddTestDetails(context,
                          //     _submitGradeGetXController, widget.sessionModel);
                          _testGetxController.showSheetFilter(context);
                        },
                        child: Stack(
                          children: [
                            Image.asset(
                              ImageAssets.star,
                              height: 40.h,
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${controller.testGrade}",
                                  style: TextStyle(color: ColorManager.primary),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
