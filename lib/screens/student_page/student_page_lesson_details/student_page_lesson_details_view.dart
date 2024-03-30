import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';

class StudentPageLessonDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("مقرر الخميس | 16 مارس"),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(10.w),
        color: Colors.grey.withOpacity(0.1),
        child: SingleChildScrollView(
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
                    "سجل المنهج",
                    style:
                        TextStyle(color: Colors.black, fontSize: FontSize.s16),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.r),
                  ),
                ),
                child: Column(
                  children: [
                    lessonItem(
                        title: "سوره البقرة الايات ( 120-150 )",
                        note: "لا يوجد ملاحظات",
                        type: "التسميع"),
                    Divider(
                      color: Colors.grey.withOpacity(0.3),
                      thickness: 1,
                    ),
                    lessonItem(
                        title: "سوره البقرة الايات ( 120-150 )",
                        note: "لا يوجد ملاحظات",
                        type: "المراجعه البعيدة"),
                    Divider(
                      color: Colors.grey.withOpacity(0.3),
                      thickness: 1,
                    ),
                    lessonItem(
                        title: "سوره البقرة الايات ( 120-150 )",
                        note: "لا يوجد ملاحظات",
                        type: "المراجعة القريبه"),
                    Divider(
                      color: Colors.grey.withOpacity(0.3),
                      thickness: 1,
                    ),
                    lessonItem(
                        title: "احكام النون الساكنة",
                        note:
                            "يجب مراجعه احكام التجويد قبل بدء الحفظ و يجب مراجعه احكام التجويد قبل بدء الحفظ و يجب مراجعه احكام التجويد قبل بدء الحفظ",
                        type: "التجويد"),
                  ],
                ),
              ),
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
                    "سؤال الواجب",
                    style:
                        TextStyle(color: Colors.black, fontSize: FontSize.s16),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.r),
                    )),
                child: Row(
                  children: [
                    SizedBox(
                      width: 240.w,
                      child: Text(
                          "اكتب ثلاث آيات من أول كل سورة مما يأتي : (الأنفال - الحجر - المنافقون )",
                          style: TextStyle(
                              color: Colors.black, fontSize: FontSize.s14)),
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.only(
                          top: 5.w, bottom: 5.w, right: 15.w, left: 15.w),
                      decoration: BoxDecoration(
                        color: const Color(0x19E05858),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        "لم يكتمل",
                        style: TextStyle(
                            color: const Color(0xFFE05858),
                            fontWeight: FontWeight.w800,
                            fontSize: FontSize.s14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container lessonItem({
    required String title,
    required String type,
    required String note,
  }) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: FontSize.s14,
                      fontWeight: FontWeight.w500)),
              Spacer(),
              Stack(
                children: [
                  Image.asset(
                    ImageAssets.star,
                    height: 40.h,
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "10",
                        style: TextStyle(color: ColorManager.primary),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          Text(type, style: TextStyle(color: ColorManager.primary)),
          Text(note,
              style: TextStyle(color: Colors.grey, fontSize: FontSize.s13)),
        ],
      ),
    );
  }
}
