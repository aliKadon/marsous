import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';

class AboutUsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                // color: Colors.red,
                gradient: LinearGradient(
                  begin: Alignment(0.50, -1.00),
                  end: Alignment(0, 1),
                  colors: [ColorManager.primary, Colors.white],
                ),
                image: const DecorationImage(
                    image: AssetImage(ImageAssets.loginMask), fit: BoxFit.fill),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 40.w, right: 20.w, left: 20.w, bottom: 20.w),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(Icons.arrow_back),
                        ),
                        SizedBox(width: 15.w),
                        Text(
                          "عن مرصوص",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: FontSize.s16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(top: 40.h),
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 25.w, right: 25.w, top: 75.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(height: 20.h),
                                  aboutUsItem(
                                    title: " تطبيق مراكز تحفيظ القرآن",
                                    text:
                                        "مرصوص هو تطبيق إلكتروني يهدف إلى تسهيل عملية تحفيظ القرآن الكريم للأطفال والكبار، حيث يوفر التطبيق مجموعة من الميزات التي تجعل عملية التحفيظ أكثر سهولة ومتعة.",
                                  ),
                                  SizedBox(height: 15.h),
                                  aboutUsItem(
                                    title: "مميزات التطبيق",
                                    text:
                                        "يوفر التطبيق مجموعة من الميزات التي تجعل عملية التحفيظ أكثر سهولة ومتعة، منها:",
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 12.h),
                                        height: 5.h,
                                        width: 5.w,
                                        decoration: BoxDecoration(
                                            color: ColorManager.primary,
                                            borderRadius:
                                                BorderRadius.circular(50.r)),
                                      ),
                                      SizedBox(width: 5.w),
                                      Container(
                                          width: 260.w,
                                          child: RichText(
                                            text: TextSpan(
                                              text: "نظام تحفيظ متدرج :",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "NotoKufiArabic",
                                                  fontSize: FontSize.s14),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text:
                                                      "يقسم التطبيق القرآن الكريم إلى أجزاء صغيرة، ويقدم لكل جزء مجموعة من الدروس والتدريبات التي تساعد المتعلم على حفظه.",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "NotoKufiArabic",
                                                      fontSize: FontSize.s12),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 12.h),
                                        height: 5.h,
                                        width: 5.w,
                                        decoration: BoxDecoration(
                                            color: ColorManager.primary,
                                            borderRadius:
                                                BorderRadius.circular(50.r)),
                                      ),
                                      SizedBox(width: 5.w),
                                      Container(
                                          width: 260.w,
                                          child: RichText(
                                            text: TextSpan(
                                              text: "ختبارات تفاعلية : ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "NotoKufiArabic",
                                                  fontSize: FontSize.s14),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text:
                                                      "يوفر التطبيق اختبارات تفاعلية تساعد المتعلم على تقييم مستواه في الحفظ.",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "NotoKufiArabic",
                                                      fontSize: FontSize.s12),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 12.h),
                                        height: 5.h,
                                        width: 5.w,
                                        decoration: BoxDecoration(
                                            color: ColorManager.primary,
                                            borderRadius:
                                                BorderRadius.circular(50.r)),
                                      ),
                                      SizedBox(width: 5.w),
                                      Container(
                                          width: 260.w,
                                          child: RichText(
                                            text: TextSpan(
                                              text: "متابعه مستمرة : ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: "NotoKufiArabic",
                                                  fontSize: FontSize.s14),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text:
                                                      "يوفر التطبيق اختبارات تفاعلية تساعد المتعلم على تقييم مستواه في الحفظ.",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "NotoKufiArabic",
                                                      fontSize: FontSize.s12),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                  SizedBox(height: 15.h),
                                  aboutUsItem(
                                    title: "الفوائد",
                                    text:
                                    "يوفر تطبيق مرصوص مجموعة من الفوائد للمتعلمين، منها:",
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 12.h),
                                        height: 5.h,
                                        width: 5.w,
                                        decoration: BoxDecoration(
                                            color: ColorManager.primary,
                                            borderRadius:
                                            BorderRadius.circular(50.r)),
                                      ),
                                      SizedBox(width: 5.w),
                                      Container(
                                          width: 260.w,
                                          child: RichText(
                                            text: TextSpan(
                                              text: "سهولة الحفظ : ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: FontSize.s14,fontFamily: "NotoKufiArabic"),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text:
                                                  "ييساعد نظام التحفيظ المتدرج في التطبيق على تسهيل عملية الحفظ، حيث يقسم القرآن الكريم إلى أجزاء صغيرة، ويقدم لكل جزء مجموعة من الدروس والتدريبات التي تساعد المتعلم على حفظه.",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                      FontWeight.w400,
                                                      fontFamily: "NotoKufiArabic",
                                                      fontSize: FontSize.s12),
                                                ),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              // width: MediaQuery.of(context).size.width * 0.5,
                              padding:
                                  EdgeInsets.only(right: 20.w, left: 20.w),
                              child: Image.asset(
                                ImageAssets.notificationImage,
                                height: 100.h,
                              ),
                            ),
                          ),
                          Text(
                            "منصه مرصوص",
                            style: TextStyle(
                                color: ColorManager.secondaryDark,
                                fontWeight: FontWeight.w700,
                                fontSize: FontSize.s15),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container aboutUsItem({
    required String title,
    required String text,
  }) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(ImageAssets.aboutUsStar, height: 20.h),
              Text(
                title,
                style: TextStyle(
                    color: ColorManager.secondaryDark, fontSize: FontSize.s15),
              ),
            ],
          ),
          Text(
            text,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
