import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';

class PreviousLessonConstantItem extends StatefulWidget {
  @override
  State<PreviousLessonConstantItem> createState() =>
      _PreviousLessonConstantItemState();
}

class _PreviousLessonConstantItemState
    extends State<PreviousLessonConstantItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7.w),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        child: Padding(
          padding: EdgeInsets.all(13.w),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    color: ColorManager.primary,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "الخميس | 16 مارس 2023",
                    style:
                        TextStyle(color: Colors.black, fontSize: FontSize.s14),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )
                ],
              ),
              Divider(
                thickness: 2,
                color: Colors.grey.withOpacity(0.2),
              ),
              lessonDetailsItem(title: "التسميع", sora: "البقره ( 150 - 200 )"),
              lessonDetailsItem(
                  title: "المراجعه البعيده", sora: "البقره ( 150 - 200 )"),
              lessonDetailsItem(
                  title: "المراجعة القريبة ", sora: "البقره ( 150 - 200 )"),
              lessonDetailsItem(title: "التجويد", sora: "البقره ( 150 - 200 )"),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      "عرض الطلاب",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: FontSize.s14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ],
          ),
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
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: FontSize.s12,
                fontWeight: FontWeight.w400),
          ),
          const Spacer(),
          SizedBox(
            width: 200.w,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                sora,
                style: TextStyle(
                    color: ColorManager.primary,
                    fontSize: FontSize.s12,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
