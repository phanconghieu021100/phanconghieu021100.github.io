// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phanconghieu020100/color_text/color_controller.dart';
import 'package:phanconghieu020100/fonts/font_controller.dart';
import 'package:phanconghieu020100/reposive/responsive_widget.dart';
import 'package:phanconghieu020100/screens/setting_screen.dart';
import 'package:phanconghieu020100/theme/theme_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_translations/app_translations.dart'; 
import 'screens/home_screen.dart'; 
import 'local/localization_service.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ThemeController());

  final themeController = Get.find<ThemeController>();
   final FontController fontController = Get.put(FontController());
   Get.put(ColorController());


  Locale locale;
  try {
    locale = await LocalizationService().loadLocale();
  } catch (e, stacktrace) {
    print('Error loading locale: $e');
    print(stacktrace);

    locale = Locale('en');
  }

  runApp(MyApp(locale, themeController));
}

class MyApp extends StatelessWidget {
  final Locale initialLocale;
  final ThemeController themeController;

  MyApp(this.initialLocale, this.themeController);

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()
        {
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
        return  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: initialLocale,
        translations: AppTranslations(), 
        fallbackLocale: Locale('en'),
        
           theme: themeData,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => ResponsiveWidget(),transition: Transition.fadeIn,),
          GetPage(name: '/setting_screen', page: () => const SettingScreen(),transition: Transition.fadeIn,),
        ],
       
      );},
    );
  }
}

class LocalizationService {
  static const String languageCodeKey = 'language_code';

  static final List<Locale> supportedLocales = [
    Locale('en'),
    Locale('vi'),
    Locale('zh'),
  ];

  Future<Locale> loadLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? languageCode = prefs.getString(languageCodeKey);

    if (languageCode == null) {
      final Locale systemLocale = Get.deviceLocale!;
      await saveLocale(systemLocale);
      return systemLocale;
    }

    return Locale(languageCode);
  }

  Future<void> saveLocale(Locale locale) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(languageCodeKey, locale.languageCode);
  }

  void changeLocale(String languageCode) {
    final Locale newLocale = Locale(languageCode);
    Get.updateLocale(newLocale);
    saveLocale(newLocale);
  }
}
