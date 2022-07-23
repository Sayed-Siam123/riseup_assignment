import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../helper/internet_checker_helper/internet_checker_helper_logic.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/utils/SizeConfig.dart';
import '../splash_logic.dart';

class SplashMobilePortrait extends GetView<SplashLogic> {
  final SizingInformation? sizingInformation;
  const SplashMobilePortrait({Key? key,this.sizingInformation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SplashLogic>();
    Get.find<InternetCheckerHelperLogic>();
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: sizingInformation!.localWidgetSize.height*0.3,),
              CircleAvatar(
                radius: const AdaptiveIconSize().getIconSize(Get.context, 30, sizingInformation!.localWidgetSize.height),
                backgroundColor: Colors.blue,
                child: Icon(Icons.email_rounded,color: ColorConstants.WHITE,size: const AdaptiveIconSize().getIconSize(Get.context, 25, sizingInformation!.localWidgetSize.height)),
              ),
              SizedBox(height: sizingInformation!.localWidgetSize.height*0.3,),
              const CupertinoActivityIndicator(),

            ],
          ),
        ),
      ),
    );
  }
}

class SplashMobileLandscape extends GetView<SplashLogic> {
  final SizingInformation? sizingInformation;
  const SplashMobileLandscape({Key? key,this.sizingInformation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SplashLogic>();
    Get.find<InternetCheckerHelperLogic>();
    return SafeArea(
      child: Scaffold(
        body: Column(
            children: [
            Text("Mobile Landscape"),
          ],
        ),
      ),
    );
  }
}


