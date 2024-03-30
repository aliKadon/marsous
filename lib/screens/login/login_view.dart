import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marsous/resources/assets_manager.dart';
import 'package:marsous/resources/color_manager.dart';
import 'package:marsous/resources/font_manager.dart';
import 'package:marsous/screens/forget_password/forget_password_view.dart';
import 'package:marsous/screens/login/controller/login_getx_controller.dart';
import 'package:marsous/screens/student_screens/main_student_rout/main_student_rout.dart';

import '../main_rout/main_rout.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //controller
  final LoginGetxController _loginGetxController = Get.put(LoginGetxController());


  var passwordVisible = true;

  // var passwordVisible = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _loginGetxController.formKey,
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
              SizedBox(
                width: 330.w,
                // height: 340.h,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 7.w, right: 7.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Text(
                            "تسجيل الدخول",
                            style: TextStyle(
                                fontSize: FontSize.s18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "من فضلك أدخل البريد الالكتروني أو اسم المستخدم";
                            return null;
                          },
                          onSaved: (value) {
                            _loginGetxController.userName = value;
                          },
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
                        SizedBox(
                          height: 20.h,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return "من فضلك أدخل كلمة المرور";
                            return null;
                          },
                          onSaved: (value) {
                            _loginGetxController.password = value;
                          },
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                            label: Text("الرقم السري"),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(right: 10.w, left: 10.w),
                              child: Image.asset(IconsAssets.lock,
                                  color: ColorManager.primary,
                                  height: 2.h,
                                  width: 2.w),
                            ),
                            // prefix: Image.asset(IconsAssets.loginEmailIcon,height: 25.h, width: 25.w),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              child: passwordVisible == true
                                  ? const Icon(
                                      Icons.visibility_off,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                    ),
                            ),
                            // suffixIconColor: Colors.red,
                            focusColor: ColorManager.primary,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ForgetPasswordView(),
                              ),
                            );
                          },
                          child: Text(
                            "هل نسيت كلمة المرور؟",
                            style: TextStyle(
                                color: ColorManager.primary,
                                fontWeight: FontWeight.w800,
                                fontSize: FontSize.s16),
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
                                  _loginGetxController.login(context: context);
                                },
                                child: const Text("تسجيل الدخول")),
                          ),
                        ),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
