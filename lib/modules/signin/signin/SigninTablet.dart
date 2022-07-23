import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../helper/internet_checker_helper/internet_checker_helper_logic.dart';
import '../signin_logic.dart';

class SignInTabletPortrait extends GetView<SigninLogic> {
  final SizingInformation? sizingInformation;

  const SignInTabletPortrait({Key? key,this.sizingInformation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SigninLogic>();
    Get.find<InternetCheckerHelperLogic>();
    return SafeArea(bottom: false,child: Scaffold());
  }
}