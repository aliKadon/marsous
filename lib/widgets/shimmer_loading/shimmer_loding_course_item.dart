import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ShemmerLoadingCourseItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r)),
        child: Padding(
          padding: EdgeInsets.only(
              top: 15.w, bottom: 20.w, left: 10.w, right: 10.w),
          child: Column(
            children: [
              SizedBox(height: 15.h,),
              Row(
                children: [
                  Container(width: 100.w,height: 20.h,color: Colors.white,),
                  const Spacer(),
                  Container(width: 100.w,height: 20.h,color: Colors.white,),
                ],
              ),
              SizedBox(height: 20.h,),
              Container(height: 20.w,width: 150.w,color: Colors.white,),
              SizedBox(height: 50.h,),
              Row(
                children: [
                  Container(width: 50.w,height: 20.h,color: Colors.white,),
                  const Spacer(),
                  Container(width: 50.w,height: 20.h,color: Colors.white,),
                  const Spacer(),
                  Container(width: 50.w,height: 20.h,color: Colors.white,),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}