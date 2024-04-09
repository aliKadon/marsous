import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marsous/app/utils/helpers.dart';
import 'package:marsous/screens/main_rout/main_rout.dart';
import 'package:marsous/widgets/choose_center_item.dart';

import '../../app/utils/app_shared_data.dart';
import '../../preferences/shared_pref_controller.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import 'controller/choose_center_api_controller.dart';

class ChooseCenterView extends StatefulWidget {
  @override
  State<ChooseCenterView> createState() => _ChooseCenterViewState();
}

class _ChooseCenterViewState extends State<ChooseCenterView> with Helpers{
  //controller
  final ChooseCenterGetXController _centerGetXController =
      Get.put(ChooseCenterGetXController());

  bool _checkData() {
    if (_centerGetXController.isSelected == false &&
        _centerGetXController.selectedChildren == -1) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ChooseCenterGetXController>(
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
                          // GestureDetector(
                          //   onTap: () {
                          //     setState(() {
                          //       controller.isSelected = true;
                          //       controller.update();
                          //     });
                          //     _centerGetXController.centerId =
                          //     SharedPrefController().setCenterId(
                          //         AppSharedData.userInfoModel!.myToken!);
                          //   },
                          //   child: ChooseAccountItem(
                          //       isSelect: _accountGetXController.isSelected,
                          //       userInfoModel: AppSharedData.userInfoModel!),
                          // ),
                          // const Divider(
                          //   thickness: 1,
                          //   color: Colors.grey,
                          // ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                AppSharedData.userInfoModel!.centers!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  controller.centerId = AppSharedData
                                      .userInfoModel!.centers![index].id;
                                  SharedPrefController()
                                      .setCenterId(controller.centerId!);
                                  setState(() {
                                    controller.isSelected = false;
                                    controller.selectedChildren = index;
                                    controller.update();
                                  });
                                },
                                child: ChooseCenterItem(
                                  isSelected: controller.isSelected == true
                                      ? false
                                      : controller.selectedChildren == index
                                          ? true
                                          : false,
                                  centerModel: AppSharedData
                                      .userInfoModel!.centers![index],
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
                                    } else {
                                      showLoadingDialog(
                                          context: context,
                                          title: 'Loading...');
                                      //check if account is for child or the parents
                                      Timer(2.seconds, () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MainRout(index: 0),
                                          ),
                                        );
                                      });
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
