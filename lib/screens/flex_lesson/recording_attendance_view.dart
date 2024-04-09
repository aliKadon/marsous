import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marsous/resources/assets_manager.dart';
import 'package:marsous/widgets/recording_attendance_item.dart';

import '../../resources/color_manager.dart';

class RecordingAttendanceView extends StatefulWidget {
  @override
  State<RecordingAttendanceView> createState() =>
      _RecordingAttendanceViewState();
}

class _RecordingAttendanceViewState extends State<RecordingAttendanceView> {
  int? isSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تسجيل الحضور"),
      ),
      body: Container(
        color: Colors.grey.withOpacity(0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.r))),
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                        color: Color(0xFFF9F1E9),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                      child: Image.asset(IconsAssets.searchIcon, height: 23.h),
                    ),
                    SizedBox(
                      width: 300.w,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "بحث بإسم الطالب",
                          hintStyle: TextStyle(color: Colors.grey),
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected = index;
                      });
                    },
                    child: isSelected == null
                        ? RecordingAttendanceItem(
                            isSelected: false,
                            isFlex: true,
                          )
                        : isSelected == index
                            ? RecordingAttendanceItem(
                                isSelected: true,
                                isFlex: true,
                              )
                            : RecordingAttendanceItem(
                                isSelected: false,
                                isFlex: true,
                              ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 10.w),
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
                    onPressed: () {},
                    child: const Text("تأكيد",style: TextStyle(color: Colors.white))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
