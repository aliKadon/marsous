import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marsous/resources/assets_manager.dart';
import 'package:marsous/resources/font_manager.dart';

import '../../../resources/color_manager.dart';

class StudentHomeworkDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تفاصيل واجب 20 مارس"),
      ),
      body: Container(
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
                      "اكتب ثلاث آيات من أول كل سورة مما يأتي : (الأنفال - الحجر - المنافقون )",
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
                    child: Text(
                        " إِذَا جَآءَكَ ٱلْمُنَٰفِقُونَ قَالُوا۟ نَشْهَدُ إِنَّكَ لَرَسُولُ ٱللَّهِ ۗ وَٱللَّهُ يَعْلَمُ إِنَّكَ لَرَسُولُهُۥ وَٱللَّهُ يَشْهَدُ إِنَّ ٱلْمُنَٰفِقِينَ لَكَٰذِبُونَ ۝ ٱتَّخَذُوٓا۟ أَيْمَٰنَهُمْ جُنَّةًۭ فَصَدُّوا۟ عَن سَبِيلِ ٱللَّهِ ۚ إِنَّهُمْ سَآءَ مَا كَانُوا۟ يَعْمَلُونَ ۝ ذَٰلِكَ بِأَنَّهُمْ ءَامَنُوا۟ ثُمَّ كَفَرُوا۟ فَطُبِعَ عَلَىٰ قُلُوبِهِمْ فَهُمْ لَا يَفْقَهُونَ ۝ ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: FontSize.s14,
                            fontWeight: FontWeight.w500)),
                  ),
                  Container(
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
                          IconsAssets.downloadIcon,
                          height: 30.h,
                        ),
                        SizedBox(width: 5.w,),
                        Text(
                          "تنزيل ملف الواجب",
                          style: TextStyle(color: ColorManager.primary),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1,color: Colors.grey.withOpacity(0.4),),
                  Padding(
                    padding:  EdgeInsets.all(10.w),
                    child: Row(
                      children: [
                        Text(
                          "الدرجة",
                          style: TextStyle(
                              color: ColorManager.primary,
                              fontSize: FontSize.s14),
                        ),
                        const Spacer(),
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
