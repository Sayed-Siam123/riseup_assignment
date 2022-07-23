import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:device_preview/device_preview.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:riseup_assignment/routes/app_pages.dart';
import 'package:riseup_assignment/shared/constant/ConstantFunctions.dart';
import 'package:riseup_assignment/shared/constant/DBKey.dart';
import 'package:riseup_assignment/theme/theme_data.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk('shopping_box');
  await appDBCollectionInit();

  FunctionsConstant.setStatusBarColorWhite();
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(desktop: 800, tablet: 550, watch: 200),
  );

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

appDBCollectionInit() async{
  // await Hive.deleteBoxFromDisk('shopping_box');
  await Hive.openBox(DBKeyData.email).then((value) => print(value.values));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //builder: EasyLoading.init(),
      theme: ThemeConfig.lightTheme,
      enableLog: true,
      initialRoute: AppPages.INITIAL,
      defaultTransition: Transition.fade,
      getPages: AppPages.routes,
      smartManagement: SmartManagement.keepFactory,
      title: 'Rise Up Assignment',
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
    );
  }
}
