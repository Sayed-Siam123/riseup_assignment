import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../routes/app_pages.dart';
import '../../shared/constant/DBKey.dart';
import '../../shared/constants/storage.dart';
import '../../shared/services/storage_prefs.dart';

class SplashLogic extends GetxController {

  final employee_box = Hive.box(DBKeyData.email);

  @override
  void onInit() async{
    // TODO: implement onReady
    super.onInit();
    print("on Init");
    //employee_box.isEmpty ? await loadEmployee() : print("not empty");
    await Future.delayed(Duration(seconds: 4));
    StoragePrefs().lsHasData(key: StorageConstants.token) ? Get.offNamed(Routes.DASHBOARD) : Get.offNamed(Routes.LOGIN);
  }
  
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("on ready");
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }


  // loadEmployee() async{
  //   for(int i = 1; i<=user_data.length;i++){
  //     await employee_box.put(i, user_data[i-1]);
  //   }
  // }

}