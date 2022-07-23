import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:riseup_assignment/modules/signin/signin/SigninMobile.dart';
import 'package:riseup_assignment/modules/signin/signin/SigninTablet.dart';
import 'package:riseup_assignment/modules/signup/signup/signup_mobile.dart';
import 'package:riseup_assignment/modules/signup/signup/signup_tablet.dart';

import 'signup_logic.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => ScreenTypeLayout(
        //breakpoints: ScreenBreakpoints(desktop: 900, tablet: 650, watch: 250),
        mobile: OrientationLayoutBuilder(
          portrait: (context) => SignUpMobilePortrait(sizingInformation: sizingInformation),
          landscape: (context) => SignUpMobileLandscape(sizingInformation: sizingInformation),
        ),
        tablet: SignUpTabletPortrait(sizingInformation: sizingInformation),
      ),
    );
  }
}
