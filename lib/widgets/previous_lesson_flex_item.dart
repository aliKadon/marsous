import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';

class PreviousLessonFlexItem extends StatelessWidget {

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
            ],
          ),
        ),
      ),
    );
  }
}