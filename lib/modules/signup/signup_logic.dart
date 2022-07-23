import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../helper/snackbarHelper.dart';
import '../../provider/api_provider.dart';
import '../../routes/app_pages.dart';
import '../../shared/constants/storage.dart';
import '../../shared/services/storage_prefs.dart';

class SignupLogic extends GetxController {

  var isLoading = false.obs;
  var isLoadingLoggingIn = false.obs;
  var obscureText = true.obs;
  var domainsList = [].obs;
  ApiProvider? apiProvider = ApiProvider();

  @override
  onInit() async{
    // TODO: implement onInit
    super.onInit();
    await availableDomains();
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
    isLoadingLoggingIn.close();
    obscureText.close();
    domainsList.close();
  }

  availableDomains() async{
    domainsList.clear();
    isLoading.value = true;
    dio.Response domains = await apiProvider!.availableDomains();

    if(domains.statusCode == 200){
      domainsList.value.addAll(domains.data["hydra:member"]);
    }

    else{
      domainsList.clear();
    }

    isLoading.value = false;
  }

  signup({email,password}) async{
    isLoadingLoggingIn.value = true;
    dio.Response signup = await apiProvider!.signup(email: email,pass: password);

    if(signup.statusCode == 201){
      SnackBarHelper.openSnackBar(isError: false,message: "Account created successfully");
      isLoadingLoggingIn.value = false;
      await Future.delayed(const Duration(milliseconds: 500));
      Get.offNamed(Routes.LOGIN);
    }

    else{
      isLoadingLoggingIn.value = false;
      SnackBarHelper.openSnackBar(isError: true,message: "Error!");
    }

  }

}
