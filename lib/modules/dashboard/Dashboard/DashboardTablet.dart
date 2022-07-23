import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../helper/internet_checker_helper/internet_checker_helper_logic.dart';
import '../dashboard_logic.dart';

class DashboardTablet extends GetView<DashboardLogic> {
  final SizingInformation? sizingInformation;
  const DashboardTablet({Key? key,this.sizingInformation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<DashboardLogic>();
    Get.find<InternetCheckerHelperLogic>();
    return SafeArea(child: Scaffold());
  }
}
