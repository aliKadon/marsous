import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marsous/resources/color_manager.dart';

import '../../resources/assets_manager.dart';
import '../../resources/font_manager.dart';

class ConstantStudentRatingWidget extends StatefulWidget {
  final String title;

  ConstantStudentRatingWidget({required this.title});

  @override
  State<ConstantStudentRatingWidget> createState() =>
      _ConstantStudentRatingWidgetState();
}

class _ConstantStudentRatingWidgetState
    extends State<ConstantStudentRatingWidget> {
  int mark = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.w),
      margin: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.square_outlined, color: Colors.grey, size: 20.h),
              SizedBox(
                width: 5.w,
              ),
              Text(
                widget.title,
                style: TextStyle(
                    color: ColorManager.secondaryDark,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Text(
                "البقره ( 150 - 200 ) ",
                style: TextStyle(
                    color: ColorManager.primary, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          SizedBox(
            height: 7.h,
          ),
          Row(
            children: [
              Text(
                "التقيم",
                style: TextStyle(
                    color: ColorManager.secondaryDark.withOpacity(0.5),
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    mark++;
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
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xFFF9F1E9),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    mark--;
                  });
                },
                child: Image.asset(ImageAssets.minus, height: 25.h),
              ),
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          TextFormField(
            maxLines: 2,
            decoration: InputDecoration(
                hintText: "ملاحظات", hintStyle: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
