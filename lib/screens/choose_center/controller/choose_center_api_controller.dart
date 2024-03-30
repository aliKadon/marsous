import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/controllers/user_details_api_controller.dart';
import '../../../models/api_response.dart';
import '../../login/login_view.dart';

class ChooseCenterGetXController extends GetxController {
  final UserDetailsApiController _userDetailsApiController = UserDetailsApiController();

  ApiResponse? userInfoModel;

  String? centerId;
  var isSelected = false;
  int selectedChildren = -1;


  void getMyInfoPrimary({required BuildContext context}) async {
    try {
      userInfoModel = await _userDetailsApiController.getMyInfoPrimary();
      update();
    } catch (e) {
      //if the token that saved in shared preferences expired go to login
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginView(),
        ),
      );
      print("error getMyInfo function : $e");
    }
  }
}