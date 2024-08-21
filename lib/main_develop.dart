import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phanconghieu020100/app_config/app_config.dart';
import 'package:phanconghieu020100/local/localization_service.dart';
import 'package:phanconghieu020100/main.dart';
import 'package:phanconghieu020100/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.fromFlavor(flavor: Flavor.DEV);

  Get.put(ThemeController());

  Locale locale;
  try {
    locale = await LocalizationService().loadLocale();
  } catch (e) {
    locale = Locale('en');
  }

  runApp(MyApp(locale, Get.find<ThemeController>()));
}
