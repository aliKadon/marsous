import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marsous/models/center_model.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';

class ChooseCenterItem extends StatefulWidget {

  CenterModel centerModel;
  var isSelected;

  ChooseCenterItem({required this.centerModel,required this.isSelected});

  @override
  State<ChooseCenterItem> createState() => _ChooseCenterItemState();
}

class _ChooseCenterItemState extends State<ChooseCenterItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            ImageAssets.accountProfileImage,
            height: 50.h,
          ),
          SizedBox(width: 10.w),
          SizedBox(
            width: 190.w,
            child: Text("${widget.centerModel.name}",
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
    );
  }
}