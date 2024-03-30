import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marsous/models/session_model.dart';
import 'package:marsous/screens/student_screens/student_homework/controller/student_homework_getx_controller.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';

class StudentHomeworkLessonView extends StatefulWidget {
  SessionModel session;
  StudentHomeworkLessonView({required this.session});
  @override
  State<StudentHomeworkLessonView> createState() =>
      _StudentHomeworkLessonViewState();
}

class _StudentHomeworkLessonViewState extends State<StudentHomeworkLessonView> {
  //controller
  final StudentHomeworkGetXController _studentHomeworkGetXController =
      Get.put(StudentHomeworkGetXController());

  @override
  void initState() {
    super.initState();
    _studentHomeworkGetXController.file = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("الواجب"),
      ),
      body: GetBuilder<StudentHomeworkGetXController>(
        builder: (controller) => Form(
          key: controller.formKey,
          child: Container(
            color: Colors.grey.withOpacity(0.1),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.w),
                  margin: EdgeInsets.all(10.w),
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
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      SizedBox(
                        width: 300.w,
                        child: Text(
                          "${widget.session.lessonTask}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: FontSize.s14),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.w),
                  margin: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.w),
                        margin: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: TextFormField(
                          validator: (value) {
                            if ((value == null && controller.file == null) || (value!.isEmpty && controller.file == null))
                              return "من فضلك أدخل الإجابة أو ارفع ملف الإجابة";
                            return null;
                          },
                          onSaved: (newValue) {
                            controller.answer = newValue;
                            print("student - on save function answer value : ${controller.answer}");
                          },
                          maxLines: 3,
                          decoration: const InputDecoration(
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "الإجابة",
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.uploadTask(context: context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(15.w),
                          margin: EdgeInsets.all(10.w),
                          decoration: BoxDecoration(
                            color: Color(0xFFFCF9F5),
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: ColorManager.primary,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                IconsAssets.uploadIcon,
                                height: 30.h,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "رفع ملف الواجب",
                                style: TextStyle(color: ColorManager.primary),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (controller.file != null) ...[
                        Row(
                          children: [
                            SizedBox(
                              width: 16.w,
                            ),
                            const Text(
                              "تم تحميل الملف بنجاح",
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      width: MediaQuery.of(context).size.width * 0.8,
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
                            controller.sendTask(context: context, sessionId: widget.session.id!,);
                          },
                          child: const Text("حفظ")),
                    ),
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
