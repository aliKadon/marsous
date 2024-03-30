import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marsous/models/children_model.dart';
import 'package:marsous/preferences/shared_pref_controller.dart';
import 'package:marsous/screens/choose_account/controller/choose_account_getx_controller.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';

class ChooseAccountChildrenItem extends StatefulWidget {
  ChildrenModel childrenModel;
  var isSelected;

  ChooseAccountChildrenItem(
      {required this.childrenModel,required this.isSelected});

  @override
  State<ChooseAccountChildrenItem> createState() =>
      _ChooseAccountChildrenItemState();
}

class _ChooseAccountChildrenItemState extends State<ChooseAccountChildrenItem> {
  //controller
  final ChooseAccountGetXController _accountGetXController =
      Get.find<ChooseAccountGetXController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChooseAccountGetXController>(
      builder:(controller) =>  Container(
          child: Row(
            children: [
              Image.asset(
                ImageAssets.accountProfileImage,
                height: 50.h,
              ),
              SizedBox(width: 10.w),
              SizedBox(
                width: 190.w,
                child: Text("${widget.childrenModel.name}",
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600)),
              ),
              const Spacer(),
              Visibility(
                  visible: widget.isSelected,
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
