import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shared/constant/ConstantBoxStyle.dart';
import '../shared/utils/SizeConfig.dart';

abstract class AppbarConstant{
  static customAppBar({title,centerTitle,menuTap,backButtonEnable = false,menuEnable,actionEnable,actionTap,backTap = null}){
    return AppBar(
      backgroundColor: Colors.blue,
      leadingWidth: 60,
      automaticallyImplyLeading: true,
      leading: menuEnable ? Padding(
        padding: EdgeInsets.only(left: 15,top: 5,bottom: 5),
        child: InkWell(
          radius: 40,
          borderRadius: BorderRadius.circular(50),
          onTap: () => menuTap(),
          child: Container(
            decoration: BoxStyleConstant.circleBoxDecorationStyle(),
            child: Icon(Icons.menu,color: Colors.white,size: AdaptiveIconSize().getIconSize(Get.context!, 18, Get.height),),
          ),
        ),
      ) : !menuEnable && backButtonEnable ? Padding(
        padding: EdgeInsets.only(left: 15,top: 5,bottom: 5),
        child: InkWell(
          radius: 40,
          borderRadius: BorderRadius.circular(50),
          onTap: () => backTap(),
          child: Container(
            decoration: BoxStyleConstant.circleBoxDecorationStyle(),
            child: Icon(Icons.arrow_back,color: Colors.white,size: AdaptiveIconSize().getIconSize(Get.context!, 18, Get.height),),
          ),
        ),
      ) : const SizedBox(),
      actions: [
        actionEnable ? Padding(
          padding: EdgeInsets.only(right: 10,top: 5,bottom: 5),
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () => actionTap(),
            child: Container(
              decoration: BoxStyleConstant.circleBoxDecorationStyle(),
              child: Padding(
                padding: EdgeInsets.only(right: 15,left: 15),
                child: Icon(Icons.logout,color: Colors.white,size: AdaptiveIconSize().getIconSize(Get.context!, 18, Get.height),),
              ),
            ),
          ),
        ) : const SizedBox(),
      ],
      title: Text(title,style: Theme.of(Get.context!).textTheme.bodyText2!.copyWith(
        color: Colors.white
      )),
      centerTitle: centerTitle,
      elevation: 1,
    );
  }
}