import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shared/constants/ConstantSize.dart';
import '../shared/constants/colors.dart';
import '../shared/utils/SizeConfig.dart';

abstract class ButtonConstant{
  static buttonWidgetSingle({onTap,title,isLoadingLoggingIn}) {
    return SizedBox(
      height: 45,
      width: Get.width,
      child: Material(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(SizeConstant.BUTTONRADIUS),
        child: InkWell(
          onTap: () => onTap(),
          child: Center(child: !isLoadingLoggingIn ? Text(title,style: Theme.of(Get.context!).textTheme.bodyText2!.copyWith(
              fontSize: AdaptiveTextSize().getadaptiveTextSize(Get.context!, 12, Get.height),
              color: ColorConstants.WHITE
          ),) : CupertinoActivityIndicator(color: Colors.white,animating: true,)),
        ),
      ),
    );
  }
}