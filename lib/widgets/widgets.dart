import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:riseup_assignment/widgets/textwidgets.dart';

import '../shared/constants/ConstantSize.dart';
import '../shared/utils/SizeConfig.dart';

abstract class WidgetConstant{
  static floatingActionButton({tooltip,icon,onPressed}){
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: () => onPressed(),
      tooltip: tooltip,
      child: Icon(icon,color: Colors.white,),
    );
  }

  static messageTile({title,subtitle,isRead}){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Visibility(
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,
          visible: !isRead,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              height: 5,
              width: 5,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade300
            ),
            child: Icon(
              Icons.email_rounded,
              size: AdaptiveIconSize().getIconSize(Get.context, 20, Get.height),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextBoxConstant.textWidget(text: title,weight: !isRead ? FontWeight.w700 : FontWeight.w500,size: SizeConstant.EXTRAMEDIUMTEXT),
              SizedBox(height: 2,),
              Row(
                children: [
                  Expanded(child: TextBoxConstant.textWidget(text: subtitle,maxLine: 1,overflow: TextOverflow.ellipsis,weight: !isRead ? FontWeight.w700 : FontWeight.w500,size: SizeConstant.SMALLTEXT+1),)
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

}