import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marsous/app/utils/helpers.dart';
import 'package:marsous/resources/assets_manager.dart';
import 'package:marsous/screens/about_us/about_us_view.dart';
import 'package:marsous/screens/choose_account/choose_account_view.dart';
import 'package:marsous/screens/choose_center/choose_center_view.dart';
import 'package:marsous/screens/contact_us/contact_us_view.dart';
import 'package:marsous/screens/editing_profile/editing_profile_view.dart';
import 'package:marsous/screens/our_vesion/our_vesion_view.dart';
import 'package:marsous/screens/settings/setting_view.dart';
import 'package:marsous/screens/student_screens/editing_profile_student/editing_profile_student_view.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../app/utils/app_shared_data.dart';
import '../../data/api/controllers/user_details_api_controller.dart';
import '../../models/api_response.dart';
import '../../preferences/shared_pref_controller.dart';
import '../../screens/login/login_view.dart';

class MainDrawer extends StatefulWidget {
  bool isStudent;

  MainDrawer({required this.isStudent});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> with Helpers {
  final UserDetailsApiController _userDetailsApiController =
      UserDetailsApiController();

  ApiResponse? apiResponse;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(ImageAssets.mask2),
            fit: BoxFit.fill,
          ),
          gradient: LinearGradient(
            begin: Alignment(2.0, -1.00),
            end: Alignment(0, 1),
            colors: [ColorManager.secondary, ColorManager.secondaryDark],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back, color: ColorManager.white),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        // width: MediaQuery.of(context).size.width * 0.5,
                        padding:
                            EdgeInsets.only(top: 0.h, right: 0.w, left: 10.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(35.r),
                          child: AppSharedData.userInfoModel == null
                              ? Image.asset(
                                  ImageAssets.accountProfileImage,
                                  height: 50.h,
                                  width: 50.h,
                                )
                              : Image.network(
                                  AppSharedData.userInfoModel!.image!,
                                  height: 50.h,
                                  width: 50.h,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      ImageAssets.accountProfileImage,
                                      height: 50.h,
                                      width: 50.h,
                                    );
                                  },
                                ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 170.w,
                          child: Text(
                            "${AppSharedData.userInfoModel?.fullName}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: FontSize.s12,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          widget.isStudent == false
                              ? "alaa@gmail.com"
                              : "25255588",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontSize: FontSize.s12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => widget.isStudent == false
                        ? EditingProfileView()
                        : EditingProfileStudentView(),
                  ));
                },
                child: drawerItem(
                    image: IconsAssets.sliderIcon1, text: "تعديل البيانات"),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SettingView(),
                    ));
                  },
                  child: drawerItem(
                      image: IconsAssets.sliderIcon2, text: "الإعدادات")),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ContactUsView(),
                    ));
                  },
                  child: drawerItem(
                      image: IconsAssets.sliderIcon4, text: "تواصل معانا")),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AboutUsView(),
                    ));
                  },
                  child: drawerItem(
                      image: IconsAssets.sliderIcon5, text: "عن مرصوص")),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => OurVesionView(),
                    ));
                  },
                  child: drawerItem(
                      image: IconsAssets.sliderIcon6, text: "رؤيتنا")),
              drawerItem(image: IconsAssets.sliderIcon7, text: "تقيم التطبيق"),
              GestureDetector(
                  onTap: () async {
                    showLoadingDialog(context: context, title: "loading");
                    ApiResponse userInfo =
                        await _userDetailsApiController.getMyInfoPrimary();
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          SharedPrefController().centerId.isEmpty
                              ? ChooseAccountView()
                              : ChooseCenterView(),
                    ));
                  },
                  child: drawerItem(
                      image: IconsAssets.sliderIcon5, text: "حساباتي")),
              SizedBox(
                height: 55.h,
              ),
              Row(
                children: [
                  Image.asset(
                    IconsAssets.logout,
                    color: ColorManager.red,
                    height: 22.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  TextButton(
                    onPressed: () {
                      SharedPrefController().logout();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => LoginView(),
                        ),
                      );
                    },
                    child: Text("نسجيل الخروج",
                        style: TextStyle(
                            color: ColorManager.red,
                            fontSize: FontSize.s14,
                            fontWeight: FontWeight.w500)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container drawerItem({
    required String image,
    required String text,
  }) {
    return Container(
      padding: EdgeInsets.only(bottom: 25.h),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 22.w,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            text,
            style: TextStyle(
                color: ColorManager.white,
                fontSize: FontSize.s14,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
