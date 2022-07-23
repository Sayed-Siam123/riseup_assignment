import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shared/constants/ConstantSize.dart';
import '../shared/constants/colors.dart';
import '../shared/utils/SizeConfig.dart';

abstract class TextBoxConstant{
  static textWidget({text,size = SizeConstant.MEDIUMTEXT,color = ColorConstants.TEXTBLACK,weight = FontWeight.w500,maxLine = 1,overflow = null}){
    return Text(
      text.toString(),
      style: Theme.of(Get.context!).textTheme.bodyText2!.copyWith(
        color: color,
        fontSize: AdaptiveTextSize().getadaptiveTextSize(Get.context!, size, Get.height),
        fontWeight: weight,
      ),
      maxLines: maxLine,
      overflow: overflow,
    );
  }
}