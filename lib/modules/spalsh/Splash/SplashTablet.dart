import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../splash_logic.dart';

class SplashTablet extends GetView<SplashLogic> {
  final SizingInformation? sizingInformation;
  const SplashTablet({Key? key,this.sizingInformation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("Tablet"),
          ],
        ),
      ),
    );
  }
}
