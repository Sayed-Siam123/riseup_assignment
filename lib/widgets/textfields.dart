import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../shared/constants/ConstantSize.dart';
import '../shared/constants/colors.dart';
import '../shared/utils/SizeConfig.dart';

abstract class TextFieldConstant{
  static textField({FormFieldState<dynamic>? field,hintText,isPassword,obscureTextShow=true,obscureTextShowFunc = null}){
    return TextField(
      cursorColor: Colors.black,
      style: Theme.of(Get.context!).textTheme.bodyText2!.copyWith(
        fontWeight: FontWeight.normal,
        fontSize: const AdaptiveTextSize().getadaptiveTextSize(Get.context!, SizeConstant.SMALLTEXT, Get.height),
      ),
      onChanged: (String? value){
        if(value != ""){
          field!.didChange(value);
        }
        else{
          field!.reset();
        }
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstants.BLACK.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(SizeConstant.TEXTBOXRADIUS),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstants.BLACK.withOpacity(1)),
          borderRadius: BorderRadius.circular(SizeConstant.TEXTBOXRADIUS),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstants.RED),
          borderRadius: BorderRadius.circular(SizeConstant.TEXTBOXRADIUS),
        ),
        errorText: field!.errorText,
        suffixIcon: isPassword ? IconButton(
            splashRadius: 1,
            onPressed: () => obscureTextShowFunc(),
            icon: Icon(obscureTextShow ? Feather.eye : Feather.eye_off,color: ColorConstants.BLACK.withOpacity(0.5),)) : const SizedBox(),
      ),
      obscureText: obscureTextShow,
    );
  }
}