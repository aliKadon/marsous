import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marsous/models/session_model.dart';
import 'package:marsous/models/submit_grade_model.dart';
import 'package:marsous/screens/home/submit_grade_getx_controller/submit_grade_getx_controller.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../../app/utils/helpers.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/values_manager.dart';

class TestGetxController extends GetxController {
  int mark = 0;
  String? birthDate;
  bool isSelected = false;
  bool isSelected1 = false;
  SubmitGradeModel submitGrade = SubmitGradeModel();
  List<SubmitGradeModel> submitGradeList = [];

  late final TextEditingController selectDateTextEditingController =
      TextEditingController();

  // select date.
  void selectDateFrom({
    required BuildContext context,
  }) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: birthDate == null
          ? DateTime(DateTime.now().year)
          : DateTime.parse(birthDate!),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (date == null) return;
    birthDate = Helpers.formatDate(date);
    selectDateTextEditingController.text = birthDate!;
  }

  Future showSheetFilter(BuildContext context) => showSlidingBottomSheet(
        context,
        builder: (context) => SlidingSheetDialog(
          cornerRadius: 20.r,
          snapSpec: SnapSpec(
            snappings: [1.0, 0.8],
          ),
          builder: (context, state) => Material(
            child: StatefulBuilder(
              builder: (context, setState) => Padding(
                padding: EdgeInsets.all(AppSize.s15),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.024,
                      ),
                      Text(
                          textAlign: TextAlign.center,
                          "تصفية حسب",
                          style: TextStyle(
                              fontSize: FontSize.s20,
                              fontWeight: FontWeight.w800,
                              color: ColorManager.black)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.024,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: selectDateTextEditingController,
                              decoration: InputDecoration(
                                  label: const Text(
                                    "من",
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.date_range_outlined,
                                        color: ColorManager.primary),
                                    onPressed: () =>
                                        selectDateFrom(context: context),
                                  )),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            ":",
                            style: TextStyle(
                                color: ColorManager.primary,
                                fontWeight: FontWeight.w700,
                                fontSize: FontSize.s18),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: TextFormField(
                              controller: selectDateTextEditingController,
                              decoration: InputDecoration(
                                  label: const Text(
                                    "إلي",
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.date_range_outlined,
                                        color: ColorManager.primary),
                                    onPressed: () =>
                                        selectDateFrom(context: context),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      TextFormField(
                        maxLines: 1,
                        decoration: const InputDecoration(
                          label: Text(
                            "اسم الحلقة",
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Container(
                        padding: EdgeInsets.all(5.h),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.r),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text("حالة الاختبار"),
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isSelected = true;
                                });
                              },
                              child: Row(
                                children: [
                                  isSelected == true
                                      ? Image.asset(IconsAssets.doneCircle,
                                          height: 20.h)
                                      : Image.asset(IconsAssets.circle,
                                          height: 20.h),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    "تم اختباره",
                                    style: isSelected == true
                                        ? TextStyle(color: ColorManager.primary)
                                        : TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  isSelected = false;
                                });
                              },
                              child: Row(
                                children: [
                                  isSelected == false
                                      ? Image.asset(IconsAssets.doneCircle,
                                          height: 20.h)
                                      : Image.asset(IconsAssets.circle,
                                          height: 20.h),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    "لم يتم",
                                    style: isSelected == false
                                        ? TextStyle(color: ColorManager.primary)
                                        : TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15.h),
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
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
                              onPressed: () {},
                              child: const Text("عرض النتائج",style: TextStyle(color: Colors.white))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  Future showSheetAddTestDetails(
          BuildContext context,
          SubmitGradeGetXController submitGradeGetXController,
          SessionModel sessionModel) =>
      showSlidingBottomSheet(
        context,
        builder: (context) => SlidingSheetDialog(
          cornerRadius: 20.r,
          snapSpec: const SnapSpec(
            snappings: [1.0, 0.8],
          ),
          builder: (context, state) => Material(
            child: StatefulBuilder(
              builder: (context, setState) => Padding(
                padding: EdgeInsets.all(AppSize.s15),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.024,
                      ),
                      Text(
                          textAlign: TextAlign.center,
                          "اختبر",
                          style: TextStyle(
                              fontSize: FontSize.s20,
                              fontWeight: FontWeight.w800,
                              color: ColorManager.black)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.024,
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          Text(
                            "التقيم",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: FontSize.s14,
                                fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                mark = mark + 1;
                              });
                            },
                            child: Icon(Icons.add),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            "$mark",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: FontSize.s16,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(width: 5.w),
                          ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                Color(0xFFF9F1E9),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                if (mark > 0) {
                                  mark = mark - 1;
                                }
                              });
                            },
                            child: Image.asset(ImageAssets.minus, height: 25.h),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
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
                                submitGradeList = [];
                                submitGrade.testGrade = mark;
                                submitGrade.sessionId = sessionModel.id;
                                submitGrade.taskGrade = sessionModel.taskGrade;
                                submitGradeList.add(submitGrade);
                                sessionModel.testGrade = mark;
                                sessionModel.update();
                                submitGradeGetXController.submitGrade(
                                    context: context,
                                    submitGradeList: submitGradeList);
                              },
                              child: const Text("تأكيد",style: TextStyle(color: Colors.white))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
