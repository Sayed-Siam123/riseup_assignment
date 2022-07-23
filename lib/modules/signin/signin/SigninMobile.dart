import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/src/sizing_information.dart';
import 'package:riseup_assignment/routes/app_pages.dart';
import 'package:riseup_assignment/widgets/textwidgets.dart';

import '../../../helper/internet_checker_helper/internet_checker_helper_logic.dart';
import '../../../shared/constants/ConstantSize.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/utils/SizeConfig.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/textfields.dart';
import '../signin_logic.dart';

class SignInMobilePortrait extends GetView<SigninLogic> {
  final SizingInformation? sizingInformation;

  SignInMobilePortrait({Key? key, this.sizingInformation}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  static final _loginFormKey = GlobalKey<FormBuilderState>();


  @override
  Widget build(BuildContext context) {
    Get.find<SigninLogic>();
    Get.find<InternetCheckerHelperLogic>();
    return SafeArea(
      bottom: false,
      child: Scaffold(
        key: _scaffoldkey,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 100,),
              CircleAvatar(
                radius: const AdaptiveIconSize().getIconSize(
                    Get.context, 30, sizingInformation!.localWidgetSize.height),
                backgroundColor: Colors.blue,
                child: Icon(
                    Icons.email_rounded, color: ColorConstants.WHITE,
                    size: const AdaptiveIconSize().getIconSize(Get.context, 25, sizingInformation!.localWidgetSize.height)),
              ),

              SizedBox(height: SizeConstant.ROOTCONTAINERSPACING * 4,),

              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: SizeConstant.CONTENTSPACING),
                  child: FormBuilder(
                    key: _loginFormKey,
                    child: Column(
                      children: [

                        FormBuilderField(
                          name: "email",
                          // validator: validCheck ? FormBuilderValidators.compose(validationList)
                          //     : FormBuilderValidators.compose([
                          //       (text){
                          //     return null;
                          //   }],),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(Get.context!,errorText: "Email is required"),
                            FormBuilderValidators.email(Get.context!,errorText: "Not a valid email format"),
                          ]),
                          builder: (FormFieldState<dynamic> field) {
                            return TextFieldConstant.textField(field: field,hintText: "Enter email",isPassword: false,obscureTextShow: false, obscureTextShowFunc: null);
                          },
                        ),

                        SizedBox(height: SizeConstant.ROOTCONTAINERSPACING,),

                        FormBuilderField(
                          name: "password",
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(Get.context!, errorText: "Password is required"),
                          ]),
                          builder: (FormFieldState<dynamic> field) {
                            return Obx(() {
                              return TextFieldConstant.textField(
                                  field: field,
                                  hintText: "Enter password",
                                  isPassword: true,
                                  obscureTextShow: controller.obscureText.value,
                                  obscureTextShowFunc: () {
                                    controller.obscureText.value
                                        ? controller.obscureText.value = false
                                        : controller.obscureText.value = true;
                                  });
                            });
                          },
                        )
                      ],
                    ),
                  ),
              ),


              SizedBox(height: SizeConstant.ROOTCONTAINERSPACING,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: SizeConstant.CONTENTSPACING),
                child: Obx(() {
                  return ButtonConstant.buttonWidgetSingle(
                    onTap: () async{
                      if(controller.isLoadingLoggingIn.value != true){
                        if(_loginFormKey.currentState!.validate()){
                          _loginFormKey.currentState!.save();
                          await controller.signIn(email: _loginFormKey.currentState!.value["email"],pass: _loginFormKey.currentState!.value["password"]);
                        }
                      }
                    },
                    title: "L O G I N",
                    isLoadingLoggingIn: controller.isLoadingLoggingIn.value,
                  );
                }),
              ),

              SizedBox(height: SizeConstant.CONTENTSPACING+10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextBoxConstant.textWidget(
                    text: "Do not have any account?",
                    size: SizeConstant.SMALLTEXT,
                  ),

                  SizedBox(width: 5,),

                  GestureDetector(
                    onTap: (){
                      print("sasas");
                      Get.offNamed(Routes.SIGNUP);
                    },
                    child: TextBoxConstant.textWidget(
                        text: "Signup",
                        size: SizeConstant.SMALLTEXT,
                        color: Colors.blue
                    ),
                  )

                ],
              )

            ],
          ),
        ),),
    );
  }
}

class SignInMobileLandscape extends GetView<SigninLogic> {

  final SizingInformation? sizingInformation;

  const SignInMobileLandscape({Key? key, this.sizingInformation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SigninLogic>();
    Get.find<InternetCheckerHelperLogic>();
    return SafeArea(bottom: false, child: Scaffold());
  }
}
