import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marsous/models/user_info_model.dart';
import 'package:marsous/resources/assets_manager.dart';
import 'package:marsous/resources/color_manager.dart';
import 'package:marsous/screens/choose_center/controller/choose_center_api_controller.dart';

class ChooseAccountItem extends StatefulWidget {
  UserInfoModel userInfoModel;
  bool isSelect;

  ChooseAccountItem({required this.userInfoModel, required this.isSelect});

  @override
  State<ChooseAccountItem> createState() => _ChooseAccountItemState();
}

class _ChooseAccountItemState extends State<ChooseAccountItem> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChooseCenterGetXController>(
      builder: (controller) => Container(
        child: Row(
          children: [
            Image.asset(
              ImageAssets.accountProfileImage,
              height: 50.h,
            ),
            SizedBox(width: 10.w),
            SizedBox(
              width: 190.w,
              child: Text("${widget.userInfoModel.fullName}",
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600)),
            ),
            const Spacer(),
            Visibility(
                visible: widget.isSelect,
                child: Icon(
                  Icons.done_outline,
                  color: ColorManager.primary,
                )),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
