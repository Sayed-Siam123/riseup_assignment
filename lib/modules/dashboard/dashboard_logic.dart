import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:dio/dio.dart' as dio;

import '../../helper/DialogHelper.dart';
import '../../helper/loader.dart';
import '../../provider/api_provider.dart';
import '../../routes/app_pages.dart';
import '../../shared/constant/ConstantFunctions.dart';
import '../../shared/constant/DBKey.dart';

class DashboardLogic extends GetxController {


  //final dashController = Get.find<DashboardLogic>();
  final emailBox = Hive.box(DBKeyData.email);
  var isLoadingEmailList = false.obs;
  var emailList = [].obs;
  var noMessageFlag = false.obs;

  ApiProvider? apiProvider = ApiProvider();


  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    FunctionsConstant.setStatusBarColorDashboard();
    loadInbox();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    emailList.close();
  }


  loadInbox() async{
    emailList.clear();
    isLoadingEmailList.value = true;
    noMessageFlag.value = false;
    dio.Response inbox = await apiProvider!.getInbox();

    if(inbox.statusCode == 200){

      if(inbox.data["hydra:totalItems"] == 0){
        noMessageFlag.value = true;
      }

      else{
        noMessageFlag.value = false;
        emailList.addAll(inbox.data["hydra:member"]);
      }

    }

    else{
      emailList.clear();
    }

    isLoadingEmailList.value = false;
  }


/*  loadEmployee() async{
    emailList.clear();
    isLoadingEmployeeList.value = true;
    await Future.delayed(Duration(seconds: 3));

    if(emailBox.isNotEmpty){
      for(int i = 0; i < emailBox.values.length; i++){
        emailList.add({
          "id" : emailBox.keys.elementAt(i),
          "name" : emailBox.values.elementAt(i)["name"],
          "designation" : emailBox.values.elementAt(i)["designation"],
        });
      }
    }

    else{
      emailList.clear();
    }

    isLoadingEmployeeList.value = false;
  }

  deleteAllEmployee() async{
    await emailBox.clear();
  }

  deleteEmployeeByID({id}) async{
    await emailBox.delete(id);
    await loadEmployee();
  }*/


  //TODO:: Dialog Open Function
  void openDialog({id,name, designation}) {
    DialogHelper.openEditDialogBox(id: id,name: name,designation: designation);
  }

  /*editEmployee({data}) async{
    LoaderConstant.loader();
    if(emailBox.keys.contains(data["id"])){
      await emailBox.delete(data["id"]);
      await emailBox.put(data["id"],data);
    }
    await loadEmployee();
    Get.back();
    Get.back();
  }*/

}
