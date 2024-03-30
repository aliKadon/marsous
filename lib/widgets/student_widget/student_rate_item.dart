import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/assets_manager.dart';
import '../../resources/font_manager.dart';

class StudentRateItem extends StatefulWidget {
  String title;
  StudentRateItem({required this.title});
  @override
  State<StudentRateItem> createState() => _StudentRateItemState();
}

class _StudentRateItemState extends State<StudentRateItem> {
  int mark = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ExpansionTile(
            title: Row(
              children: [
                Image.asset(ImageAssets.aboutUsStar, height: 20.h),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                 widget.title,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            children: [
              Padding(
                padding: EdgeInsets.all(8.w),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "اختر السورة",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "من",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    ":",
                    style: TextStyle(color: Colors.red, fontSize: FontSize.s18),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "إلى",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "ملاحظات",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Row(
                  children: [
                    Text(
                      "التقيم",
                      style: TextStyle(
                          color: Colors.black38,
                          fontSize: FontSize.s14,
                          fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          mark++;
                        });
                      },
                      child: Icon(Icons.add),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "$mark",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: FontSize.s16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 5.w),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color(0xFFF9F1E9),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          mark--;
                        });
                      },
                      child: Image.asset(ImageAssets.minus, height: 25.h),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
