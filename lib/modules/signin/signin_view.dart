import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:riseup_assignment/modules/signin/signin/SigninMobile.dart';
import 'package:riseup_assignment/modules/signin/signin/SigninTablet.dart';

import 'signin_logic.dart';

class SigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => ScreenTypeLayout(
        //breakpoints: ScreenBreakpoints(desktop: 900, tablet: 650, watch: 250),
        mobile: OrientationLayoutBuilder(
          portrait: (context) => SignInMobilePortrait(sizingInformation: sizingInformation),
          landscape: (context) => SignInMobileLandscape(sizingInformation: sizingInformation),
        ),
        tablet: SignInTabletPortrait(sizingInformation: sizingInformation),
      ),
    );
  }
}
