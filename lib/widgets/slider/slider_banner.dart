import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marsous/models/banner_model.dart';

import '../../resources/assets_manager.dart';
import '../../resources/values_manager.dart';

class SliderBanner extends StatefulWidget {
  List<BannerModel> bannerList;

  SliderBanner({
    required this.bannerList,
  });

  @override
  State<SliderBanner> createState() => _SliderBannerState();
}

class _SliderBannerState extends State<SliderBanner> {
  var isLoop = false;

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
        // height: MediaQuery.of(context).size.height * 0.24,
        // width: double.infinity,
        // indicatorRadius: 4,
        isLoop: widget.bannerList.length > 1 ? true : false,
        indicatorBottomPadding: 0,
        autoPlayInterval: 4000,
        // indicatorBackgroundColor: ColorManager.primary,
        children: List<Widget>.generate(
          // widget.bannerList.length,
          widget.bannerList.length,
          (index) => Container(
            padding: EdgeInsets.only(bottom: 10.h),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(AppSize.s15)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.network(
                  widget.bannerList[index].image!,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      ImageAssets.homeImage,
                      fit: BoxFit.fill,
                    );
                  },
                )),
          ),
        ));
  }
}
