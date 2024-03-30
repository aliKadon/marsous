import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marsous/app/utils/app_shared_data.dart';
import 'package:marsous/models/course_model.dart';
import 'package:marsous/screens/contact_us/contact_us_view.dart';
import 'package:marsous/screens/marsous_getx_controller/marsous_getx_controller.dart';
import 'package:marsous/screens/student_screens/student_home/controller/student_home_getx_controller.dart';
import 'package:marsous/widgets/shimmer_loading/shimmer_loding_course_item.dart';
import 'package:marsous/widgets/slider/slider_banner.dart';
import 'package:marsous/widgets/student_widget/lesson_home_student_item.dart';
import 'package:shimmer/shimmer.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../widgets/drawer/main_drawer.dart';

class StudentHomeView extends StatefulWidget {
  @override
  State<StudentHomeView> createState() => _StudentHomeViewState();
}

class _StudentHomeViewState extends State<StudentHomeView> {
  //controller
  final StudentHomeGetXController _studentHomeGetXController =
      Get.put(StudentHomeGetXController());
  final MarsousGetXController _marsousGetXController =
      Get.put(MarsousGetXController());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();


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
      _studentHomeGetXController.getMyCourses(
          context: context, pageIndex: page, pageSize: 20);
    }
  }

  @override
  void initState() {
    _studentHomeGetXController.getMyCourses(
        context: context, pageIndex: 1, pageSize: 50);
    _studentHomeGetXController.getMySession(pageIndex: 1, pageSize: 50);
    _marsousGetXController.getBanners(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: MainDrawer(isStudent: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 360.h,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              // color: Colors.red,
              gradient: LinearGradient(
                begin: const Alignment(0.50, -1.00),
                end: const Alignment(0, 1),
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
                        padding:
                            EdgeInsets.only(top: 50.h, right: 20.w, left: 20.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(35.r),
                          child: AppSharedData.userInfoModel == null
                              ? Image.asset(
                                  ImageAssets.accountProfileImage,
                                  height: 60.h,
                                  width: 60.h,
                                )
                              : Image.network(
                                  AppSharedData.userInfoModel!.image!,
                                  height: 60.h,
                                  width: 60.h,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
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
                        height: 190.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          // image: const DecorationImage(
                          //     image: AssetImage(
                          //       ImageAssets.homeImage,
                          //     ),
                          //     fit: BoxFit.fill),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            // color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: GetBuilder<MarsousGetXController>(
                              id: "banners",
                              builder: (controller) {
                                return controller.banners.isEmpty
                                    ? Image.asset(
                                        ImageAssets.homeImage,
                                        fit: BoxFit.fill,
                                      )
                                    : SliderBanner(
                                        bannerList: controller.banners);
                              }),
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
                              child: const Text("تواصل معنا"))
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Text(
              "حلقاتي",
              style: TextStyle(
                  fontSize: FontSize.s20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
          ),
          GetBuilder<StudentHomeGetXController>(
            id: "myCourses",
            builder: (controller) => controller.myCourses.isEmpty
                ? Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) => getShimmerLoading(),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.myCourses.length,
                      itemBuilder: (context, index) {
                        Get.put<CourseModel>(controller.myCourses[index],
                            tag: "${controller.myCourses[index].id}");
                        return LessonHomeStudentHome(
                          courseModel: controller.myCourses[index],
                          tag: "${controller.myCourses[index].id}",
                        );
                      },
                    ),
                  ),
          )
        ],
      ),
    );
  }

  Shimmer getShimmerLoading() {
    return Shimmer.fromColors(
        child: ShemmerLoadingCourseItem(),
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!);
  }
}
