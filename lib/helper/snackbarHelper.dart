import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shared/constants/colors.dart';
import '../shared/utils/SizeConfig.dart';

abstract class SnackBarHelper{
  static openSnackBar({title,message,isError = false}){
    return Get.rawSnackbar(
      titleText: title != null ? Text(title,style: Theme.of(Get.context!).textTheme.bodyText2!.copyWith(
        fontSize: AdaptiveTextSize().getadaptiveTextSize(Get.context!, 12, Get.height),
        color: ColorConstants.WHITE,
      ),) : SizedBox(),
      messageText: message != null ? Text(message,style: Theme.of(Get.context!).textTheme.bodyText2!.copyWith(
        fontSize: AdaptiveTextSize().getadaptiveTextSize(Get.context!, 12, Get.height),
        color: ColorConstants.WHITE,
      ),) : SizedBox(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: isError ? ColorConstants.RED : ColorConstants.GREEN,
    );
  }
}