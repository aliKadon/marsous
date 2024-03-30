import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';

class ForgetPasswordView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300.h,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClipRRect(
                    child: Image.asset(
                      ImageAssets.loginLogo,
                      height: 150.h,
                      width: 130.w,
                      fit: BoxFit.scaleDown,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: 330.w,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                child: Padding(
                  padding: EdgeInsets.only(left: 7.w, right: 7.w,bottom: 13.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Text(
                          "إعادة تعين كلمة السر",
                          style: TextStyle(
                              fontSize: FontSize.s16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),

                      Text(
                        "يجب ادخال البريد الإلكتروني الخاص بك لإرسال كود التحقق",
                        style: TextStyle(
                            fontSize: FontSize.s12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text("البريد الالكتروني"),
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(right: 10.w, left: 10.w),
                            child: Image.asset(IconsAssets.loginEmailIcon,
                                color: ColorManager.primary,
                                height: 5.h,
                                width: 5.w),
                          ),
                        ),
                      ),



                      SizedBox(height: 16.h),
                      Align(
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
                              child: const Text("التالي")),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}