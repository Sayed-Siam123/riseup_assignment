import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../modules/dashboard/dashboard_logic.dart';
import '../shared/constants/ConstantSize.dart';
import '../shared/constants/colors.dart';
import '../shared/utils/SizeConfig.dart';
import '../widgets/buttons.dart';
import '../widgets/textfields.dart';
import '../widgets/textwidgets.dart';

abstract class DialogHelper{

  static final _editEmployeeFormKey = GlobalKey<FormBuilderState>();

  static openDialogBox({title,message,barrierDismissal,color = ColorConstants.BLACK,image = null}){
    return  showDialog(
      useSafeArea: true,
      useRootNavigator: false,
      barrierDismissible: barrierDismissal,
      context: Get.context!,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
              insetPadding: const EdgeInsets.all(60),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: SizedBox(
                height: Get.height*0.2,
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: image != null ? Image(
                          height: 20,
                          width: 20,
                          image: Svg(image),
                        ) : Text(message,style: Theme.of(Get.context!).textTheme.bodyText2!.copyWith(
                          fontSize: AdaptiveTextSize().getadaptiveTextSize(Get.context!, 13, Get.height),
                          color: color,
                        ),),
                    ),
                  ],
                ),
              ));
        });
      },
    );
  }

  static openNormalDialogBox(){
    return showDialog(
      useSafeArea: true,
      useRootNavigator: false,
      barrierDismissible: true,
      context: Get.context!,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Text('Message',style: Theme.of(Get.context!).textTheme.bodyText2!.copyWith(
              fontSize: const AdaptiveTextSize().getadaptiveTextSize(Get.context!, 13, Get.height),
            ),),
            content: Text('Coming soon...',style: Theme.of(Get.context!).textTheme.bodyText2!.copyWith(
              fontSize: const AdaptiveTextSize().getadaptiveTextSize(Get.context!, 13, Get.height),
            ),),
            actions: [
              TextButton(
                style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => ColorConstants.WHITE),textStyle: MaterialStateTextStyle.resolveWith((states) => Theme.of(Get.context!).textTheme.bodyText2!.copyWith(
                  color: ColorConstants.BLACK,
                  fontWeight: FontWeight.w600,
                  fontSize: const AdaptiveTextSize().getadaptiveTextSize(Get.context!, 11, Get.height),
                ))),
                child: Text('CLOSE',style: Theme.of(Get.context!).textTheme.bodyText2!.copyWith(
                  color: ColorConstants.GREEN,
                  fontWeight: FontWeight.w600,
                  fontSize: const AdaptiveTextSize().getadaptiveTextSize(Get.context!, 11, Get.height),
                )),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          );
        });
      },
    );
  }


  static openEditDialogBox({id, name, designation}){
    final controller = Get.find<DashboardLogic>();
    return showDialog(
      useSafeArea: true,
      useRootNavigator: false,
      barrierDismissible: true,
      context: Get.context!,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SizeConstant.DIALOGBOXRADIUS),
            ),
            child: Padding(
              padding: const EdgeInsets.all(SizeConstant.ROOTCONTAINERSPACING),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextBoxConstant.textWidget(text: "EDIT EMPLOYEE"),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: SizeConstant.CONTENTSPACING),
                      child: FormBuilder(
                        key: _editEmployeeFormKey,
                        child: Column(
                          children: [
                            SizedBox(height: SizeConstant.ROOTCONTAINERSPACING,),

                            FormBuilderField(
                              name: "name",
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(Get.context!,errorText: "Field is required"),
                              ]),
                              builder: (FormFieldState<dynamic> field) {
                                return TextFieldConstant.textField(field: field,hintText: "Enter name",isPassword: false,obscureTextShow: false, obscureTextShowFunc: null);
                              },
                            ),

                            SizedBox(height: SizeConstant.ROOTCONTAINERSPACING,),

                            FormBuilderField(
                              name: "designation",
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(Get.context!, errorText: "Field is required"),
                              ]),
                              builder: (FormFieldState<dynamic> field) {
                                return TextFieldConstant.textField(
                                    field: field,
                                    hintText: "Enter designation",
                                    isPassword: false,
                                    obscureTextShow: false,
                                    obscureTextShowFunc: null
                                );
                              },
                            ),

                            SizedBox(height: SizeConstant.ROOTCONTAINERSPACING,),

                            Padding(
                                padding: const EdgeInsets.symmetric(horizontal: SizeConstant.CONTENTSPACING),
                                child: ButtonConstant.buttonWidgetSingle(
                                  onTap: () async{
                                    if(_editEmployeeFormKey.currentState!.validate()){
                                      _editEmployeeFormKey.currentState!.save();
                                      var data = {
                                        "id" : id,
                                        "name" : _editEmployeeFormKey.currentState!.value["name"],
                                        "designation" : _editEmployeeFormKey.currentState!.value["designation"],
                                      };
                                      //controller.editEmployee(data: data);
                                    }
                                  },
                                  title: "EDIT EMPLOYEE",
                                  isLoadingLoggingIn: false,
                                )),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}