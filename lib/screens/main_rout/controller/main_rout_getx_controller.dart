import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marsous/screens/home/home_view.dart';
import 'package:marsous/screens/notifications/notifications_view.dart';
import 'package:marsous/screens/tests/tests_view.dart';

import '../../homework/homework_view.dart';



class MainRoutGetxController extends GetxController {

  int? index;

  late int currentIndex = index ?? 0;

  List<Widget> screens = [
    HomeView(),
    NotificationsView(),
    HomeWorkView(),
    TestsView(),
  ];


  void changeBottom(int index, BuildContext context) {
    currentIndex = index;
    update();
  }

}