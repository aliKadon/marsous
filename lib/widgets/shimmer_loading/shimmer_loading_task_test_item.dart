import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ShimmerLoadingTaskTestItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(15.w),
        child: Row(
          children: [
            Container(
              height: 40.h,
                    width: 40.w,
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.r)),
                  ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(width: 150.w,height: 23.h,color: Colors.white,),
                SizedBox(height: 20.w),
                Container(
                  width: 200.w,
                  height: 23.h,color: Colors.white,
                ),
              ],
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
