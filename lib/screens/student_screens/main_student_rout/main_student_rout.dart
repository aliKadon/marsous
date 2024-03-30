import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:marsous/app/utils/app_shared_data.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../login/controller/profile_getx_controller.dart';
import 'controller/main_student_rout_getx_controller.dart';

class MainStudentRout extends StatefulWidget {
  final int? index;

  MainStudentRout({this.index});

  @override
  State<MainStudentRout> createState() => _MainStudentRoutState();
}

class _MainStudentRoutState extends State<MainStudentRout> {
  //controller
  final MainStudentRoutGetxController _mainStudentRoutGetxController = Get.put(
    MainStudentRoutGetxController(),
  );
  final ProfileGetXController _profileGetXController =
  Get.find<ProfileGetXController>();

  bool _doubleBackToExitPressedOnce = false;


  @override
  void initState() {
    // TODO: implement initState
    if (AppSharedData.userInfoModel == null) {
      _profileGetXController.getMyInfo(context: context);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainStudentRoutGetxController>(
      builder: (controller) => Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: WillPopScope(
            onWillPop: _onWillPop,
            child: controller.screens[_mainStudentRoutGetxController.currentIndex]),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: Colors.transparent),
          height: 95.h,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.01,
            top: MediaQuery.of(context).size.height * 0.008,
            right: MediaQuery.of(context).size.height * 0.013,
            left: MediaQuery.of(context).size.height * 0.008,
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 350.w,
              height: 80.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                  color: ColorManager.secondaryDark,
                  border: Border.all(color: ColorManager.secondaryDark)),
              child: GetBuilder<MainStudentRoutGetxController>(
                builder: (controller) => GNav(
                    selectedIndex: controller.currentIndex,
                    tabBorderRadius: 50.r,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 7.h,
                    ),
                    duration: Duration(milliseconds: 500),
                    // tab animation duration
                    gap: 5.w,
                    // the tab button gap between icon and text
                    color: Colors.white,
                    // unselected icon color
                    activeColor: Colors.white,
                    // selected icon and text color
                    iconSize: 10.h,
                    // tab button icon size
                    tabBackgroundColor: ColorManager.transparent,
                    // selected tab background color
                    onTabChange: (index) {
                      if (widget.index != null) {
                        controller.changeBottom(index, context);
                      } else {
                        controller.changeBottom(index, context);
                      }
                    },
                    curve: Curves.easeInCirc,
                    tabs: [
                      GButton(
                          icon: Icons.home,
                          leading: controller.currentIndex == 0
                              ? Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 4.w, bottom: 4.w),
                                      child: Image.asset(
                                        IconsAssets.navIcon1,
                                        color: ColorManager.primary,
                                        height: 25.h,
                                        width: 23.w,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text(
                                      "الحلقات",
                                      style: TextStyle(
                                          fontSize: FontSize.s14,
                                          fontWeight: FontWeight.w600,
                                          color: ColorManager.primary),
                                    )
                                  ],
                                )
                              : Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 7.w, bottom: 7.w),
                                      child: Image.asset(
                                        IconsAssets.navIcon1,
                                        color: Colors.grey,
                                        height: 25.h,
                                        width: 23.w,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Text(
                                      "الحلقات",
                                      style: TextStyle(
                                          fontSize: FontSize.s14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey),
                                    )
                                  ],
                                )),
                      GButton(
                        icon: Icons.home,
                        leading: controller.currentIndex == 1
                            ? Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 4.w, bottom: 4.w),
                                    child: Image.asset(
                                      IconsAssets.navIcon2,
                                      color: ColorManager.primary,
                                      height: 30.h,
                                      width: 30.w,

                                      // fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                  Text(
                                    "الإشعارات",
                                    style: TextStyle(
                                        fontSize: FontSize.s14,
                                        fontWeight: FontWeight.w600,
                                        color: ColorManager.primary),
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 4.w, bottom: 4.w),
                                    child: Image.asset(
                                      IconsAssets.navIcon2,
                                      color: Colors.grey,
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                  ),
                                  Text(
                                    "الإشعارات",
                                    style: TextStyle(
                                        fontSize: FontSize.s14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey),
                                  )
                                ],
                              ),
                      ),
                      GButton(
                        icon: Icons.home,
                        leading: controller.currentIndex == 2
                            ? Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 4.w, bottom: 4.w),
                                    child: Image.asset(
                                      IconsAssets.navIcon3,
                                      color: ColorManager.primary,
                                      height: 30.h,
                                      width: 30.w,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Text(
                                    "الواجبات",
                                    style: TextStyle(
                                        fontSize: FontSize.s14,
                                        fontWeight: FontWeight.w600,
                                        color: ColorManager.primary),
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 4.w, bottom: 4.w),
                                    child: Image.asset(
                                      IconsAssets.navIcon3,
                                      color: Colors.grey,
                                      height: 30.h,
                                      width: 30.w,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Text(
                                    "الواجبات",
                                    style: TextStyle(
                                        fontSize: FontSize.s14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey),
                                  )
                                ],
                              ),
                      ),
                      GButton(
                        icon: Icons.home,
                        leading: controller.currentIndex == 3
                            ? Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 4.w, bottom: 4.w),
                                    child: Image.asset(
                                      IconsAssets.navIcon4,
                                      color: ColorManager.primary,
                                      height: 30.h,
                                      width: 30.w,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Text(
                                    "الإختبارات",
                                    style: TextStyle(
                                        fontSize: FontSize.s14,
                                        fontWeight: FontWeight.w600,
                                        color: ColorManager.primary),
                                  )
                                ],
                              )
                            : Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 4.w, bottom: 4.w),
                                    child: Image.asset(
                                      IconsAssets.navIcon4,
                                      color: Colors.grey,
                                      height: 30.h,
                                      width: 30.w,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Text(
                                    "الإختبارات",
                                    style: TextStyle(
                                        fontSize: FontSize.s14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey),
                                  )
                                ],
                              ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (_doubleBackToExitPressedOnce) {
      return true;
    }

    _doubleBackToExitPressedOnce = true;
    Get.snackbar(
      'تنبيه',
      'اضغط زر الرجوع مرة أخرى للخروج من التطبيق',
      backgroundColor: ColorManager.grey,
      borderRadius: 25.r,
    );
    Timer(Duration(seconds: 2), () {
      _doubleBackToExitPressedOnce = false;
    });
    return false;
  }
}
