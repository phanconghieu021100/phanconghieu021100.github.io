import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phanconghieu020100/app_config/app_config.dart';
import 'package:phanconghieu020100/color_text/color_controller.dart';
import 'package:phanconghieu020100/fonts/font_controller.dart';
import 'package:phanconghieu020100/loading/loading_controller.dart';
import 'package:phanconghieu020100/local/localization_service.dart';
import 'package:phanconghieu020100/main.dart';
import 'package:phanconghieu020100/theme/theme_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.fromFlavor(flavor: Flavor.STAGING);
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
