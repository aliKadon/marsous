import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marsous/app/utils/app_shared_data.dart';
import 'package:marsous/preferences/shared_pref_controller.dart';
import 'package:marsous/screens/login/controller/profile_getx_controller.dart';
import 'package:marsous/screens/login/login_view.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';

class EditingProfileStudentView extends StatefulWidget {
  @override
  State<EditingProfileStudentView> createState() =>
      _EditingProfileStudentViewState();
}

class _EditingProfileStudentViewState extends State<EditingProfileStudentView> {
  //controller
  final ProfileGetXController _profileGetXController =
      Get.find<ProfileGetXController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            // height: 530.h,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 40.w, right: 20.w, left: 20.w, bottom: 20.w),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.arrow_back),
                      ),
                      SizedBox(width: 15.w),
                      Text(
                        "تعديل الصفحة الشخصية",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: FontSize.s16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 550.h,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          // height: 370.h,
                          padding: EdgeInsets.only(
                              left: 10.w, right: 10.w, top: 40.h),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 25.w, right: 25.w, top: 75.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextFormField(
                                    decoration: InputDecoration(
                                      label: Text("الاسم"),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            right: 10.w, left: 10.w),
                                        child: Image.asset(IconsAssets.user,
                                            color: ColorManager.primary,
                                            height: 5.h,
                                            width: 5.w),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      label: Text("رقم الهاتف"),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            right: 10.w, left: 10.w),
                                        child: Image.asset(IconsAssets.call,
                                            color: ColorManager.primary,
                                            height: 5.h,
                                            width: 5.w),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      label: Text("العنوان"),
                                      prefixIcon: Padding(
                                          padding: EdgeInsets.only(
                                              right: 10.w, left: 10.w),
                                          child: Icon(
                                            Icons.location_on_outlined,
                                            color: ColorManager.primary,
                                          )),
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            Clipboard.setData(
                                                ClipboardData(text: "asdada"));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                backgroundColor: Colors.green,
                                                content: Text("تم النسخ"),
                                              ),
                                            );
                                          },
                                          icon: Icon(Icons.copy,
                                              color: ColorManager.primary)),
                                      label: Text("الكود"),
                                      prefixIcon: Padding(
                                          padding: EdgeInsets.only(
                                              right: 10.w, left: 10.w),
                                          child: Icon(
                                            Icons.numbers,
                                            color: ColorManager.primary,
                                          )),
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      label: Text("البريد الالكتروني"),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            right: 10.w, left: 10.w),
                                        child: Image.asset(
                                            IconsAssets.loginEmailIcon,
                                            color: ColorManager.primary,
                                            height: 5.h,
                                            width: 5.w),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      label: Text("اسم المستخدم"),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.only(
                                            right: 10.w, left: 10.w),
                                        child: Image.asset(IconsAssets.user,
                                            color: ColorManager.primary,
                                            height: 5.h,
                                            width: 5.w),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GetBuilder<ProfileGetXController>(
                        builder: (controller) => Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            // width: MediaQuery.of(context).size.width * 0.5,
                            padding: EdgeInsets.only(
                              right: 20.w,
                              left: 20.w,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.r),
                              child: AppSharedData.userInfoModel?.image == null
                                  ? Image.asset(
                                      ImageAssets.accountProfileImage,
                                      height: 100.h,
                                    )
                                  : controller.base64 != null
                                      ? Image.memory(
                                          base64Decode(
                                            controller.base64!,
                                          ),
                                          height: 90,
                                          width: 90,
                                          fit: BoxFit.fill,
                                        )
                                      : Image.network(
                                          AppSharedData.userInfoModel!.image!,
                                          height: 90,
                                          width: 90,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                              ImageAssets.accountProfileImage,
                                              height: 100.h,
                                            );
                                          },
                                        ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: GestureDetector(
                          onTap: () {
                            _profileGetXController.pickImage(context: context);
                          },
                          child: Container(
                            // width: MediaQuery.of(context).size.width * 0.5,
                            padding: EdgeInsets.only(
                                top: 60.w, right: 20.w, left: 100.w),
                            child: Image.asset(
                              IconsAssets.edit2,
                              height: 30.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
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
                      onPressed: () {},
                      child: const Text("حفظ",style: TextStyle(color: Colors.white))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
