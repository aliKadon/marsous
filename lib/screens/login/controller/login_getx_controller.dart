import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsous/app/utils/app_shared_data.dart';
import 'package:marsous/app/utils/helpers.dart';
import 'package:marsous/data/api/controllers/auth_api_controller.dart';
import 'package:marsous/data/api/controllers/user_details_api_controller.dart';
import 'package:marsous/models/api_response.dart';
import 'package:marsous/preferences/shared_pref_controller.dart';
import 'package:marsous/screens/choose_account/choose_account_view.dart';
import 'package:marsous/screens/choose_center/choose_center_view.dart';
import 'package:marsous/screens/login/controller/profile_getx_controller.dart';
import 'package:marsous/screens/student_screens/main_student_rout/main_student_rout.dart';

import '../../main_rout/main_rout.dart';

class LoginGetxController extends GetxController with Helpers {
  late final GlobalKey<FormState> formKey = GlobalKey();
  final AuthApiController _apiController = AuthApiController();
  final UserDetailsApiController _userDetailsApiController = UserDetailsApiController();

  ApiResponse? apiResponse;
  String? userName;
  String? password;

  void login({
    required BuildContext context,
  }) async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    showLoadingDialog(context: context, title: 'Logging In');
    try {
      apiResponse =
          await _apiController.login(userName: userName!, password: password!);
      // print("status login  : ${apiResponse?.status}");
      if (apiResponse?.status == 200) {
        ApiResponse userInfo = await _userDetailsApiController.getMyInfo();
        Navigator.of(context).pop();

        //check the role of user
        if (AppSharedData.userInfoModel?.role == "Student") {
          print("user info login: ${AppSharedData.userInfoModel?.isParent}");

          //if the user is parent
          if (AppSharedData.userInfoModel?.isParent == true) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => ChooseAccountView(),
              ),
            );
          }else {
            // if student go to student screens
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => MainStudentRout(),
              ),
            );
          }

        } else if (AppSharedData.userInfoModel?.role == "Tutor"){
          // if not go to teacher screens
          if(AppSharedData.userInfoModel!.centers!.isEmpty) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => MainRout(),
              ),
            );
          }else {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => ChooseCenterView(),
              ),
            );
          }

        }

        // Timer(2.seconds, () {
        //
        // });
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(
        //     builder: (context) => MainStudentRout(),
        //   ),
        // );
      } else {
        Navigator.of(context).pop();
        Get.snackbar("error", apiResponse!.message);
      }
    } catch (e) {
      Navigator.of(context).pop();
      print(e);
    }
  }
}
