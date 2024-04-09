import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:marsous/app/utils/app_shared_data.dart';
import 'package:marsous/models/submit_message_model.dart';
import 'package:marsous/screens/contact_us/controller/contact_us_getx_controller.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';

class ContactUsView extends StatefulWidget {
  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  //controller
  final ContactUsGetxController _contactUsGetxController = Get.put(
    ContactUsGetxController(),
  );

  int selected = 0;

  SubmitMessageModel submitMessageModel = SubmitMessageModel();


  @override
  void initState() {
    _contactUsGetxController.getMarsousInfo();
    submitMessageModel.userName = AppSharedData.userInfoModel!.userName;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ContactUsGetxController>(
        builder: (controller) => SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    gradient: LinearGradient(
                      begin: Alignment(0.50, -1.00),
                      end: Alignment(0, 1),
                      colors: [ColorManager.primary, Colors.white],
                    ),
                    image: const DecorationImage(
                        image: AssetImage(ImageAssets.loginMask), fit: BoxFit.fill),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 40.w, right: 20.w, left: 20.w, bottom: 20.w),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: Icon(Icons.arrow_back),
                            ),
                            SizedBox(width: 15.w),
                            Text(
                              "تواصل معانا",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: FontSize.s16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.only(top: 40.h),
                              padding: EdgeInsets.only(left: 10.w, right: 10.w),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.w, right: 25.w, top: 100.h),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      IntrinsicHeight(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "${controller.marsousInfoModel?.studentCount}",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: FontSize.s16,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    "اجمالي الطلاب",
                                                    style: TextStyle(
                                                        color: ColorManager
                                                            .secondaryDark),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const VerticalDivider(
                                              thickness: 1,
                                              color: Colors.grey,
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "${controller.marsousInfoModel?.centerCount}",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: FontSize.s16,
                                                        color:
                                                            ColorManager.primary),
                                                  ),
                                                  Text(
                                                    "اجمالي المراكز",
                                                    style: TextStyle(
                                                        color: ColorManager
                                                            .secondaryDark),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const VerticalDivider(
                                              thickness: 1,
                                              color: Colors.grey,
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "${controller.marsousInfoModel?.tutorCount}",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: FontSize.s16,
                                                        color:
                                                            ColorManager.primary),
                                                  ),
                                                  Text(
                                                    "اجمالي المعلمين",
                                                    style: TextStyle(
                                                        color: ColorManager
                                                            .secondaryDark),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              style: selected == 0
                                                  ? ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              ColorManager.primary),
                                                    )
                                                  : ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              ColorManager.white),
                                                    ),
                                              onPressed: () {
                                                setState(() {
                                                  selected = 0;
                                                });
                                              },
                                              child: Text(
                                                "تواصل معانا",
                                                style: selected == 0
                                                    ? TextStyle(
                                                        color: Colors.white,
                                                      )
                                                    : TextStyle(
                                                        color:
                                                            ColorManager.primary),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          Expanded(
                                            child: ElevatedButton(
                                              style: selected == 1
                                                  ? ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              ColorManager.primary),
                                                    )
                                                  : ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              ColorManager.white),
                                                    ),
                                              onPressed: () {
                                                setState(() {
                                                  selected = 1;
                                                });
                                              },
                                              child: Text(
                                                "المراسلة",
                                                style: selected == 1
                                                    ? TextStyle(
                                                        color: Colors.white,
                                                      )
                                                    : TextStyle(
                                                        color:
                                                            ColorManager.primary),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      selected == 0
                                          ? Column(
                                              children: [
                                                contactUsItem(
                                                    image: IconsAssets.call,
                                                    text: "رقم الهاتف",
                                                    infoText: "${controller.marsousInfoModel?.marsMobilePhone}"),
                                                SizedBox(height: 15.h),
                                                contactUsItem(
                                                    image: IconsAssets.call2,
                                                    text: "الرقم الأرضي",
                                                    infoText: "${controller.marsousInfoModel?.marsLandPhone}"),
                                                SizedBox(height: 15.h),
                                                contactUsItem(
                                                    image:
                                                        IconsAssets.loginEmailIcon,
                                                    text: "البريد الإلكتروني",
                                                    infoText: "${controller.marsousInfoModel?.marsEmail}"),
                                                SizedBox(height: 15.h),
                                                contactUsItem(
                                                    image: IconsAssets.global,
                                                    text: "الموقع الالكتروني",
                                                    infoText: "${controller.marsousInfoModel?.marsWebSite}"),
                                                SizedBox(height: 15.h),
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            IconsAssets.location,
                                                            height: 20.h,
                                                          ),
                                                          SizedBox(
                                                            width: 5.w,
                                                          ),
                                                          Text(
                                                            "العنوان",
                                                            style: TextStyle(
                                                                color: Colors.grey),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        "${controller.marsousInfoModel?.marsAddress}",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w600),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                          : Container(
                                              child: Column(
                                                children: [
                                                  TextFormField(
                                                    onSaved: (newValue) {
                                                      submitMessageModel.userFullName = newValue;
                                                    },
                                                    decoration: InputDecoration(
                                                      label: Text("اسم المستخدم"),
                                                      prefixIcon: Padding(
                                                        padding: EdgeInsets.only(
                                                            right: 10.w,
                                                            left: 10.w),
                                                        child: Image.asset(
                                                            IconsAssets.user,
                                                            color: ColorManager
                                                                .primary,
                                                            height: 5.h,
                                                            width: 5.w),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 7.h),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(10.w),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10.r),
                                                          border: Border.all(
                                                              color: ColorManager
                                                                  .secondaryDark),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Text("+965"),
                                                            SizedBox(
                                                              width: 5.w,
                                                            ),
                                                            Image.asset(
                                                              ImageAssets.kwFlag,
                                                              height: 30.h,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(width: 5.w),
                                                      Expanded(
                                                        child: TextFormField(
                                                          onSaved: (newValue) {
                                                            submitMessageModel.userMobilePhone = newValue;
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                            label:
                                                                Text("رقم الجوال"),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 7.h),
                                                  TextFormField(
                                                    onSaved: (newValue) {
                                                      submitMessageModel.userEmail = newValue;
                                                    },
                                                    decoration: InputDecoration(
                                                      label:
                                                          Text("البريد الإلكتروني"),
                                                      prefixIcon: Padding(
                                                        padding: EdgeInsets.only(
                                                            right: 10.w,
                                                            left: 10.w),
                                                        child: Image.asset(
                                                            IconsAssets
                                                                .loginEmailIcon,
                                                            color: ColorManager
                                                                .primary,
                                                            height: 5.h,
                                                            width: 5.w),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 7.h),
                                                  TextFormField(
                                                    onSaved: (newValue) {
                                                      submitMessageModel.questuinSubject = newValue;
                                                    },
                                                    decoration: InputDecoration(
                                                      label: Text("موضوع الرسالة"),
                                                      prefixIcon: Padding(
                                                        padding: EdgeInsets.only(
                                                            right: 10.w,
                                                            left: 10.w),
                                                        child: Image.asset(
                                                            IconsAssets.message,
                                                            color: ColorManager
                                                                .primary,
                                                            height: 5.h,
                                                            width: 5.w),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 7.h),
                                                  TextFormField(
                                                    onSaved: (newValue) {
                                                      submitMessageModel.questuinBody = newValue;
                                                    },
                                                    maxLines: 5,
                                                    decoration:
                                                        const InputDecoration(
                                                      label: Text("محتوى الرسالة"),
                                                    ),
                                                  ),
                                                  SizedBox(height: 7.h),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Container(
                                                      width: MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.7,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  15.r),
                                                          gradient: LinearGradient(
                                                            begin: Alignment(
                                                                0.00, -1.00),
                                                            end: Alignment(0, 1),
                                                            colors: [
                                                              ColorManager
                                                                  .secondary,
                                                              ColorManager
                                                                  .secondaryDark
                                                            ],
                                                          )),
                                                      child: ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Colors.transparent,
                                                            shadowColor:
                                                                Colors.transparent,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            25.r)),
                                                          ),
                                                          onPressed: () {
                                                            controller.formKey.currentState!.save();
                                                            controller.showSheetContactUs(context,submitMessageModel);
                                                          },
                                                          child:
                                                              const Text("ارسال",style: TextStyle(color: Colors.white))),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                      SizedBox(height: 20.h),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  // width: MediaQuery.of(context).size.width * 0.5,
                                  padding: EdgeInsets.only(right: 20.w, left: 20.w),
                                  child: Image.asset(
                                    ImageAssets.notificationImage,
                                    height: 100.h,
                                  ),
                                ),
                              ),
                              Text(
                                "منصه مرصوص",
                                style: TextStyle(
                                    color: ColorManager.secondaryDark,
                                    fontWeight: FontWeight.w700,
                                    fontSize: FontSize.s15),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container contactUsItem({
    required String image,
    required String text,
    required String infoText,
  }) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            image,
            height: 20.h,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.grey),
          ),
          const Spacer(),
          Text(
            infoText,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
