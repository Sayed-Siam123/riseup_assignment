import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../helper/snackbarHelper.dart';
import '../../provider/api_provider.dart';
import '../../routes/app_pages.dart';
import '../../shared/constants/storage.dart';
import '../../shared/services/storage_prefs.dart';

class SigninLogic extends GetxController {

  var isLoadingLoggingIn = false.obs;
  var obscureText = true.obs;

  ApiProvider? apiProvider = ApiProvider();

  @override
  void onInit(){
    // TODO: implement onInit
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
  }


  signIn({email,pass}) async{
    isLoadingLoggingIn.value = true;
    dio.Response signup = await apiProvider!.login(email: email,pass: pass);

    if(signup.statusCode == 200){
      SnackBarHelper.openSnackBar(isError: false,message: "Login successful");
      isLoadingLoggingIn.value = false;
      await StoragePrefs().lsWrite(key: StorageConstants.token, value: signup.data["token"]);
      await Future.delayed(const Duration(milliseconds: 500));
      Get.offNamed(Routes.DASHBOARD);
    }

    else{
      isLoadingLoggingIn.value = false;
      SnackBarHelper.openSnackBar(isError: true,message: "Error!");
    }

  }

}
