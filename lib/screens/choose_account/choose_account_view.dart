import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marsous/app/utils/app_shared_data.dart';
import 'package:marsous/app/utils/helpers.dart';
import 'package:marsous/preferences/shared_pref_controller.dart';
import 'package:marsous/screens/choose_account/controller/choose_account_getx_controller.dart';
import 'package:marsous/screens/login/controller/profile_getx_controller.dart';
import 'package:marsous/widgets/student_widget/choose_account_children_item.dart';
import 'package:marsous/widgets/choose_account_item.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../student_screens/main_student_rout/main_student_rout.dart';

class ChooseAccountView extends StatefulWidget {
  @override
  State<ChooseAccountView> createState() => _ChooseAccountViewState();
}

class _ChooseAccountViewState extends State<ChooseAccountView> with Helpers {
  //controller
  final ChooseAccountGetXController _accountGetXController =
      Get.put(ChooseAccountGetXController());
  final ProfileGetXController _profileGetXController =
      Get.find<ProfileGetXController>();

  bool _checkData() {
    if (_accountGetXController.isSelected == false &&
        _accountGetXController.selectedChildren == -1) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ChooseAccountGetXController>(
        builder: (controller) => SingleChildScrollView(
          child: Form(
            // key: _loginGetxController.formKey,
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
                        image: AssetImage(ImageAssets.loginMask),
                        fit: BoxFit.fill),
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 7.w, right: 7.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Text(
                              "اختر الحساب",
                              style: TextStyle(
                                  fontSize: FontSize.s18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Text(
                              "يجب عليك اختيار احد الحسابات لكي يتم تسجيل الدخول",
                              style: TextStyle(
                                  fontSize: FontSize.s12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                controller.isSelected = true;
                                controller.update();
                              });

                              _accountGetXController.tokenAccount =
                                  AppSharedData.userInfoModel!.myToken!;
                              SharedPrefController().setToken(
                                  AppSharedData.userInfoModel!.myToken!);
                            },
                            child: ChooseAccountItem(
                                isSelect: _accountGetXController.isSelected,
                                userInfoModel: AppSharedData.userInfoModel!),
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                AppSharedData.userInfoModel!.children!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  controller.tokenAccount = AppSharedData
                                      .userInfoModel!.children![index].token!;
                                  SharedPrefController()
                                      .setToken(controller.tokenAccount!);
                                  setState(() {
                                    controller.isSelected = false;
                                    controller.selectedChildren = index;
                                    controller.update();
                                  });
                                },
                                child: ChooseAccountChildrenItem(
                                  isSelected: controller.isSelected == true
                                      ? false
                                      : controller.selectedChildren == index
                                          ? true
                                          : false,
                                  childrenModel: AppSharedData
                                      .userInfoModel!.children![index],
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 30.h),
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
                                        borderRadius:
                                            BorderRadius.circular(25.r)),
                                  ),
                                  onPressed: () {
                                    //check if the user select an account or not
                                    if (!_checkData()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              "من فضلك اختر أحد الحسابات!"),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }else {
                                      showLoadingDialog(
                                          context: context, title: 'Loading...');
                                      //check if account is for child or the parents
                                      if (_accountGetXController.tokenAccount !=
                                          AppSharedData.userInfoModel!.myToken!) {
                                        _accountGetXController
                                            .getChildProfileInfo();
                                        Timer(2.seconds, () {
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MainStudentRout(index: 0),
                                            ),
                                          );
                                        });
                                      } else {
                                        Timer(2.seconds, () {
                                          Navigator.of(context).pop();

                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MainStudentRout(index: 0),
                                            ),
                                          );
                                        });
                                      }
                                    }
                                  },
                                  child: const Text("التالي",style: TextStyle(color: Colors.white))),
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
      ),
    );
  }
}
