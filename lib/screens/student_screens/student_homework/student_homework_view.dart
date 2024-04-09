import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marsous/screens/student_screens/student_home/controller/student_home_getx_controller.dart';
import 'package:marsous/widgets/student_widget/student_homework_item.dart';
import 'package:shimmer/shimmer.dart';

import '../../../app/utils/app_shared_data.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../widgets/drawer/main_drawer.dart';
import '../../../widgets/shimmer_loading/shimmer_loading_task_test_item.dart';
import '../../contact_us/contact_us_view.dart';

class StudentHomeworkView extends StatefulWidget {
  @override
  State<StudentHomeworkView> createState() => _StudentHomeworkViewState();
}

class _StudentHomeworkViewState extends State<StudentHomeworkView> {
  //controller
  final StudentHomeGetXController _studentHomeGetXController =
      Get.find<StudentHomeGetXController>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  List<bool> listBool = [false, true, true];

  ScrollController _scrollController = ScrollController();
  var page = 1;
  var rows = 5;

  //check if it is the bottom of grid
  void scrollListener() {
    print('you in listner');
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      print("reached the bottom");
      print('page1 : ${page + 1}');
      page = page + 1;
      rows = rows + 5;
      // do something when you reach the bottom of the grid
      _studentHomeGetXController.getMySession(pageIndex: page, pageSize: 20);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: MainDrawer(isStudent: true),
      body: GetBuilder<StudentHomeGetXController>(
        builder: (controller) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 15.h),
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                // color: Colors.red,
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
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
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          // width: MediaQuery.of(context).size.width * 0.5,
                          padding: EdgeInsets.only(
                              top: 50.h, right: 20.w, left: 20.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(35.r),
                            child: AppSharedData.userInfoModel == null
                                ? Image.asset(
                                    ImageAssets.accountProfileImage,
                                    height: 60.h,
                                    width: 60.h,
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(35.r),
                                    child: Image.network(
                                      AppSharedData.userInfoModel!.image!,
                                      height: 60.h,
                                      width: 60.h,
                                      fit: BoxFit.fill,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          ImageAssets.accountProfileImage,
                                          height: 60.h,
                                          width: 60.h,
                                        );
                                      },
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 50.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "مرحبا بك",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: FontSize.s14),
                            ),
                            Text(
                              "${AppSharedData.userInfoModel?.fullName}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: FontSize.s16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState!.openEndDrawer();
                        },
                        icon: const Icon(Icons.view_headline_sharp),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15.w),
                        child: Container(
                          height: 180.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            image: const DecorationImage(
                                image: AssetImage(
                                  ImageAssets.homeImage,
                                ),
                                fit: BoxFit.fill),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                        ),
                      ),
                      PositionedDirectional(
                        top: 50.h,
                        start: 30.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 170.w,
                              child: Text(
                                "خيركم من تعلم القرآن وعلمه",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: FontSize.s18,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ContactUsView(),
                                    ),
                                  );
                                },
                                child: Text("تواصل معنا",style: TextStyle(color: Colors.white)))
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 12.w, left: 12.w),
              child: Row(
                children: [
                  Text(
                    "الواجبات",
                    style: TextStyle(
                        fontSize: FontSize.s20,
                        fontWeight: FontWeight.w800,
                        color: Colors.black),
                  ),
                  const Spacer(),
                  Image.asset(
                    IconsAssets.homeworkIcon,
                    height: 23.h,
                  )
                ],
              ),
            ),
            // controller.homeWorkSessions.isEmpty
            //     ? Expanded(
            //         child: ListView.builder(
            //         shrinkWrap: true,
            //         itemCount: 4,
            //         itemBuilder: (context, index) => getShimmerLoading(),
            //       ))
            //     :
            Expanded(
              child: controller.testSessions.isEmpty
                  ? Center(
                      child: Text(
                      "لا يوجد واجبات حاليا",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: FontSize.s16,
                          fontWeight: FontWeight.w700),
                    ))
                  : ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.homeWorkSessions.length,
                      itemBuilder: (context, index) {
                        return StudentHomeworkItem(
                          sessionModel: controller.homeWorkSessions[index],
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }

  Shimmer getShimmerLoading() {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ShimmerLoadingTaskTestItem());
  }
}
