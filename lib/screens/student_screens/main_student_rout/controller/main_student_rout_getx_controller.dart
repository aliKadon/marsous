import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsous/screens/notifications/notifications_view.dart';
import 'package:marsous/screens/student_screens/student_home/student_home_view.dart';
import 'package:marsous/screens/student_screens/student_homework/student_homework_view.dart';
import 'package:marsous/screens/student_screens/student_test/student_test_view.dart';

class MainStudentRoutGetxController extends GetxController {

  int? index;

  late int currentIndex = index ?? 0;

  List<Widget> screens = [
    StudentHomeView(),
    NotificationsView(),
    StudentHomeworkView(),
    StudentTestView(),
  ];


  void changeBottom(int index, BuildContext context) {
    currentIndex = index;
    update();
  }

}