import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:marsous/resources/assets_manager.dart';
import 'package:marsous/resources/color_manager.dart';
import 'package:marsous/resources/font_manager.dart';
import 'package:marsous/screens/login/controller/profile_getx_controller.dart';

import '../../preferences/shared_pref_controller.dart';

class SettingView extends StatefulWidget {
  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  //controller
  final ProfileGetXController _profileGetXController =
      Get.put(ProfileGetXController());

  bool isSelected = SharedPrefController().enableNotifications;
  var passwordVisible = true;
  var passwordVisible1 = true;
  var passwordVisible2 = true;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الإعدادات"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _profileGetXController.formKey,
          child: Container(
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
                    children: [
                      Image.asset(
                        IconsAssets.bellIcon,
                        height: 30.h,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "الإشعارات",
                        style:
                            TextStyle(color: Colors.black, fontSize: FontSize.s16),
                      ),
                      Spacer(),
                      CupertinoSwitch(
                        activeColor: ColorManager.primary,
                        value: isSelected,
                        onChanged: (value) {
                          setState(() {
                            isSelected = !isSelected;
                            SharedPrefController().setEnableNotification(isSelected);
                          });
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.w),
                  margin: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: ExpansionTile(
                    title: Row(
                      children: [
                        Image.asset(
                          IconsAssets.changePasswordIcon,
                          height: 30.h,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "تعديل كلمة المرور",
                          style: TextStyle(
                              color: Colors.black, fontSize: FontSize.s16),
                        ),
                      ],
                    ),
                    children: [
                      SizedBox(height: 15.h),
                      TextFormField(
                        obscureText: passwordVisible,
                        decoration: InputDecoration(
                          label: Text("كلمة المرور السابقة"),
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
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "من فضلك أدخل كلمة المرور السابقة";
                          return null;
                        },
                        onSaved: (value) {
                          _profileGetXController.oldPassword = value;
                        },
                      ),
                      SizedBox(height: 15.h),
                      TextFormField(
                        controller: _profileGetXController.newPassword,
                        obscureText: passwordVisible1,
                        decoration: InputDecoration(
                          label: Text("كلمة المرور الجديدة"),
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
                                passwordVisible1 = !passwordVisible1;
                              });
                            },
                            child: passwordVisible1 == true
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
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "من فضلك أدخل كلمة المرور الجديدة";
                          return null;
                        },
                        onSaved: (value) {
                          _profileGetXController.newPassword.text = value!;
                        },
                      ),
                      SizedBox(height: 15.h),
                      TextFormField(
                        obscureText: passwordVisible2,
                        decoration: InputDecoration(
                          label: Text("تأكيد كلة المرور"),
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
                                passwordVisible2 = !passwordVisible2;
                              });
                            },
                            child: passwordVisible2 == true
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "من فضلك أدخل تأكيد كلمة المرور";

                          }else if(value != _profileGetXController.newPassword.text) {
                            return "كلمة السر غير متطابقة";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _profileGetXController.confirmPassword = value;
                        },
                      ),
                      SizedBox(height: 15.h),
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
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                            ),
                            onPressed: () {
                              _profileGetXController.changePassword(context: context);
                            },
                            child: const Text("تأكيد",style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
