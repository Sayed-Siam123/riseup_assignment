import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'Dashboard/DashboardMobile.dart';
import 'Dashboard/DashboardTablet.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => ScreenTypeLayout(
        //breakpoints: ScreenBreakpoints(desktop: 900, tablet: 650, watch: 250),
        mobile: OrientationLayoutBuilder(
          portrait: (context) => DashboardMobilePortrait(sizingInformation: sizingInformation),
          landscape: (context) => DashboardMobilePortrait(sizingInformation: sizingInformation),
        ),
        tablet: DashboardTablet(sizingInformation: sizingInformation),
      ),
    );
  }
}
