import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:phanconghieu020100/app_config/app_config.dart';
import 'package:phanconghieu020100/color_text/color_controller.dart';
import 'package:phanconghieu020100/fonts/font_controller.dart';
import 'package:phanconghieu020100/loading/loading_controller.dart';
import 'package:phanconghieu020100/reposive/responsive_widget.dart';
import 'package:phanconghieu020100/screens/setting/setting_screen.dart';
import 'package:phanconghieu020100/theme/theme_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_translations/app_translations.dart'; 
import 'local/localization_service.dart';

int totalCurrentBtnShow = 0;
 SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.fromFlavor(flavor: Flavor.PRODUCTION);

  prefs = await SharedPreferences.getInstance(); 

  Get.put(ThemeController());
  Get.put(FontController());
  Get.put(ColorController());
  Get.put(LoadingController());

  Locale locale;
  try {
    locale = await LocalizationService().loadLocale();
  } catch (e) {
    locale = Locale('en');
  }


  runApp(MyApp(locale, Get.find<ThemeController>()));
}

class MyApp extends StatelessWidget {
  final Locale initialLocale;
  final ThemeController themeController;

  MyApp(this.initialLocale, this.themeController);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return Obx(() {
          ThemeData themeData;
          switch (themeController.themeMode) {
            case AppTheme.dark:
              themeData = darkTheme;
              break;
            case AppTheme.custom:
              themeData = customTheme;
              break;
            case AppTheme.light:
            default:
              themeData = lightTheme;
              break;
          }
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            locale: initialLocale,
            translations: AppTranslations(), 
            fallbackLocale: Locale('en'),
            theme: themeData,
            initialRoute: '/',
            getPages: [
              GetPage(name: '/', page: () => ResponsiveWidget(), transition: Transition.fadeIn),
              GetPage(name: '/setting_screen', page: () => const SettingScreen(), transition: Transition.fadeIn),
            ],
          );
        });
      },
    );
  }
}