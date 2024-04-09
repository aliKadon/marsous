import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';

class NextLessonFlexItem extends StatefulWidget {
  final int index;
  NextLessonFlexItem({required this.index});

  @override
  State<NextLessonFlexItem> createState() => _NextLessonFlexItemState();
}

class _NextLessonFlexItemState extends State<NextLessonFlexItem> {
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
                    "الخميس | 17 مارس 2023",
                    style:
                    TextStyle(color: Colors.black, fontSize: FontSize.s14),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                ],
              ),
              Divider(
                thickness: 2,
                color: Colors.grey.withOpacity(0.2),
              ),
              // SizedBox(height: 20.h),
              widget.index == 0
                  ? Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
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

                      },
                      child: const Text("تسجيل الحضور",style: TextStyle(color: Colors.white))),
                ),
              )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}