import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

import '../../../helper/internet_checker_helper/internet_checker_helper_logic.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constant/ConstantBoxStyle.dart';
import '../../../shared/constants/ConstantSize.dart';
import '../../../shared/constants/colors.dart';
import '../../../shared/constants/storage.dart';
import '../../../shared/services/storage_prefs.dart';
import '../../../shared/utils/SizeConfig.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/shimmer.dart';
import '../../../widgets/textwidgets.dart';
import '../../../widgets/widgets.dart';
import '../dashboard_logic.dart';

class DashboardMobilePortrait extends GetView<DashboardLogic> {
  final SizingInformation? sizingInformation;
  const DashboardMobilePortrait({Key? key,this.sizingInformation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<DashboardLogic>();
    Get.find<InternetCheckerHelperLogic>();
    return SafeArea(
        bottom: false,
        child: Scaffold(
          appBar: AppbarConstant.customAppBar(
            title: "Inbox",
            centerTitle: true,
            menuEnable: false,
            actionEnable: true,
            menuTap: () async{
              print(StoragePrefs().lsRead(key: StorageConstants.token));
            },
            actionTap: () async{
              StoragePrefs().lsDelete(key: StorageConstants.token);
              Get.offAllNamed(Routes.LOGIN);
            },
          ),
          floatingActionButton: WidgetConstant.floatingActionButton(
            tooltip: "Write email",
            icon: Feather.message_square,
            onPressed: () async{
              // await controller.loadInbox();
            }
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(() {

                if(controller.isLoadingEmailList.isTrue){
                  return Expanded(child: ShimmerConstant.employeelistshimmer(itemcount: 10),);
                }

                else{
                  return controller.noMessageFlag.isTrue ? Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async{
                        await controller.loadInbox();
                      },
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          SizedBox(height: sizingInformation!.localWidgetSize.height*0.4),
                          Align(child: TextBoxConstant.textWidget(text: "No Messages",color: Colors.grey,size: SizeConstant.MEDIUMTEXT),alignment: Alignment.bottomCenter,)
                        ],
                      ),
                    ),
                  ) : Expanded(
                    child: Column(
                      children: [
                        Obx(() {
                          return RefreshIndicator(
                            triggerMode: RefreshIndicatorTriggerMode.anywhere,
                            onRefresh: () async{
                              await controller.loadInbox();
                            },
                            child: ListView.builder(
                              itemCount: controller.emailList.length,
                              shrinkWrap: true,
                              padding: const EdgeInsets.symmetric(vertical: SizeConstant.CONTENTSPACING),
                              itemBuilder: (context, index) {
                                print(controller.emailList[index]["subject"]);
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(5,0,5,0),
                                  child: WidgetConstant.messageTile(
                                    isRead: controller.emailList[index]["seen"],
                                    title: controller.emailList[index]["subject"],
                                    subtitle: controller.emailList[index]["intro"],
                                  ),
                                );
                              },
                            ),
                          );
                        }),
                      ],
                    ),
                  );
                }
              }),
            ],
          ),
        )
    );
  }
}


class DashboardMobileLandscape extends GetView<DashboardLogic> {
  final SizingInformation? sizingInformation;
  const DashboardMobileLandscape({Key? key,this.sizingInformation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<DashboardLogic>();
    Get.find<InternetCheckerHelperLogic>();
    return SafeArea(child: Scaffold());
  }
}