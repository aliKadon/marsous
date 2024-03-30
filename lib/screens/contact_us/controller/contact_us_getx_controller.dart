import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marsous/app/utils/helpers.dart';
import 'package:marsous/data/api/controllers/marsous_info_api_controller.dart';
import 'package:marsous/data/api/controllers/marsous_submit_message_api_controller.dart';
import 'package:marsous/models/api_response.dart';
import 'package:marsous/models/marsous_info_model.dart';
import 'package:marsous/models/submit_message_model.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/values_manager.dart';

class ContactUsGetxController extends GetxController with Helpers {
  late final GlobalKey<FormState> formKey = GlobalKey();
  final MarsousInfoApiController _marsousInfoApiController =
      MarsousInfoApiController();
  final MarsousSubmitMessageApiController _marsousSubmitMessageApiController =
      MarsousSubmitMessageApiController();

  bool isSelected = false;
  bool isSelected1 = false;

  MarsousInfoModel? marsousInfoModel;
  ApiResponse? apiResponse;

  void submitMessage(
      {required BuildContext context,
      required SubmitMessageModel submitMessageModel}) async {
    showLoadingDialog(context: context, title: "loading");
    try {
      apiResponse = await _marsousSubmitMessageApiController.submitMessage(
          submitMessageModel: submitMessageModel);
      if (apiResponse?.status == 200) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        showSnackBar(context, message: "${apiResponse?.message}");
      } else {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        showSnackBar(context, message: "${apiResponse?.message}",error: true);
      }
      update();
    } catch (e) {
      Navigator.of(context).pop();
      print("marsous - submit message error : $e");
    }
  }

  void getMarsousInfo() async {
    try {
      marsousInfoModel = await _marsousInfoApiController.getMarousInfo();
      update();
    } catch (e) {
      print("marsous - marsous info error: $e");
    }
  }

  Future showSheetContactUs(
          BuildContext context, SubmitMessageModel submitMessageModel) =>
      showSlidingBottomSheet(
        context,
        builder: (context) => SlidingSheetDialog(
          cornerRadius: 20.r,
          snapSpec: SnapSpec(
            snappings: [1.0, 0.8],
          ),
          builder: (context, state) => Material(
            child: StatefulBuilder(
              builder: (context, setState) => Padding(
                padding: EdgeInsets.all(AppSize.s15),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.024,
                      ),
                      Text(
                          textAlign: TextAlign.center,
                          "تحديد جهه الإرسال",
                          style: TextStyle(
                              fontSize: FontSize.s18,
                              fontWeight: FontWeight.w800,
                              color: ColorManager.black)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.024,
                      ),
                      Row(
                        children: [
                          Text(
                            "إرسال إلي إدارة المركز",
                            style: TextStyle(
                                color: Colors.black, fontSize: FontSize.s16),
                          ),
                          const Spacer(),
                          Checkbox(
                            value: isSelected,
                            onChanged: (value) {
                              setState(() {
                                isSelected = !isSelected;
                                submitMessageModel.isToMarsous = isSelected;
                              });
                            },
                          )
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          Text(
                            "إرسال إلي مسؤولي التطبيق",
                            style: TextStyle(
                                color: Colors.black, fontSize: FontSize.s16),
                          ),
                          const Spacer(),
                          Checkbox(
                            value: isSelected1,
                            onChanged: (value) {
                              setState(() {
                                isSelected1 = !isSelected1;
                              });
                            },
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
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
                                    borderRadius: BorderRadius.circular(25.r)),
                              ),
                              onPressed: () {
                                print(submitMessageModel.toJson().toString());
                                submitMessage(
                                    context: context,
                                    submitMessageModel: submitMessageModel);
                              },
                              child: const Text("تأكيد")),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
