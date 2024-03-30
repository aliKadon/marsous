import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marsous/app/utils/helpers.dart';
import 'package:marsous/data/api/controllers/change_password_api_controler.dart';
import 'package:marsous/data/api/controllers/update_profile_api_controller.dart';
import 'package:marsous/data/api/controllers/user_details_api_controller.dart';
import 'package:marsous/models/api_response.dart';
import 'package:marsous/screens/login/login_view.dart';

class ProfileGetXController extends GetxController with Helpers {
  final UserDetailsApiController _userDetailsApiController =
  UserDetailsApiController();
  final UpdateProfileApiController _updateProfileApiController =
  UpdateProfileApiController();
  final ChangePasswordApiController _changePasswordApiController =
  ChangePasswordApiController();

  final TextEditingController newPassword = TextEditingController();
  late final GlobalKey<FormState> formKey = GlobalKey();

  File? image;
  String? base64;
  List<String> listImage = [];

  ApiResponse? userInfoModel;
  String? phoneNumber;
  String? title;
  String? firstName;
  String? middleName;
  String? lastName;
  String? birthDate;
  String? nationality;
  String? nationalCardId;
  String? oldPassword;
  // String? newPassword;
  String? confirmPassword;

  void getMyInfo({required BuildContext context}) async {
    try {
      userInfoModel = await _userDetailsApiController.getMyInfo();
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



  void changeProfileImage(
      {required BuildContext context, required File file}) async {
    try {
      print("file : ${file.path}");
      showLoadingDialog(context: context, title: 'Logging...');
      final ApiResponse apiResponse = await _updateProfileApiController
          .updateProfileImage(file: file);
      if (apiResponse.status == 200) {
        Navigator.of(context).pop();
        showSnackBar(context, message: apiResponse.message, error: false);
      } else {
        Navigator.of(context).pop();
        showSnackBar(context, message: apiResponse.message, error: true);
      }
    } catch (e) {
      Navigator.of(context).pop();
      print("======================error");
      print(e.toString());
      showSnackBar(context, message: e.toString(), error: true);
    }
  }


  Future pickImage({required BuildContext context}) async {
    try {
      final image1 = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image1 == null) return;
      final imageTemp = File(image1.path);
      this.image = imageTemp;
      List<int> byts = (await image!.readAsBytes());
      base64 = base64Encode(byts);
      listImage.add('data:image/jpeg;base64,$base64');
      if (imageTemp != null) {
        changeProfileImage(context: context, file: imageTemp!);
      }
      update();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void updateProfile({required BuildContext context}) async {
    userInfoModel = await _updateProfileApiController.updateProfile(
      phoneNumber: phoneNumber,
      title: title,
      lastName: lastName,
      firstName: firstName,
      birthDate: birthDate,
      middleName: middleName,
      nationalCardId: nationalCardId,
      nationality: nationalCardId,
    );
  }

  void changePassword({required BuildContext context}) async {
    try {
      if (!formKey.currentState!.validate()) return;
      formKey.currentState!.save();
      showLoadingDialog(context: context, title: 'Logging...');
      userInfoModel = await _changePasswordApiController.changePassword(
          oldPassword: oldPassword!, newPassword: newPassword.text);
      if (userInfoModel!.status == 200) {
        Navigator.of(context).pop();
        showSnackBar(context, message: userInfoModel!.message, error: false);

      }else {
        Navigator.of(context).pop();
        showSnackBar(context, message: userInfoModel!.message, error: true);
      }
    }catch (e) {
      Navigator.of(context).pop();
      showSnackBar(context, message: e.toString(), error: true);
    }
  }
}
