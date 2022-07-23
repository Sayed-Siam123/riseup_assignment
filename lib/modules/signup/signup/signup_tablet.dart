import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../helper/internet_checker_helper/internet_checker_helper_logic.dart';
import '../signup_logic.dart';

class SignUpTabletPortrait extends GetView<SignupLogic> {

  final SizingInformation? sizingInformation;

  const SignUpTabletPortrait({Key? key, this.sizingInformation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SignupLogic>();
    Get.find<InternetCheckerHelperLogic>();
    return SafeArea(bottom: false, child: Scaffold());
  }
}
