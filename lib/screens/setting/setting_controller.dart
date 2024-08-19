import 'package:get/get.dart';
import 'package:phanconghieu020100/color_text/color_controller.dart';
import 'package:phanconghieu020100/fonts/font_controller.dart';
import 'package:phanconghieu020100/main.dart';
import 'package:phanconghieu020100/theme/theme_controller.dart';
import 'package:phanconghieu020100/utils/example_drop_down/data_demo.dart';

class SettingController extends GetxController {
  RxInt selectedButtonIndex = RxInt(-1);
  final ColorController colorController = Get.find();
  final FontController fontController = Get.find<FontController>();
  final ThemeController themeController = Get.find<ThemeController>();

  RxString islanguage = ' '.obs;
  RxString isThemeMode = ' '.obs;
  final selectedQueue = Rx<QueueItem?>(null);
  final passengersTitleValue = Rx<String?>(null);
  Rx<String?> agencyStatus = Rx<String?>("SIGNED");

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() async {
    setLanguage();
    setThemeMode();
  }

  void setLanguage() {
    islanguage.value = prefs.getString('language_code') ?? '';
  }

  void updateLanguage(String languageCode) async {
    await prefs.setString('language_code', languageCode);
    islanguage.value = languageCode;
  }

  void setThemeMode() {
    isThemeMode.value = prefs.getString('theme_mode') ?? '';
  }

  void updateThemeMode(String themeMode) async {
    await prefs.setString('theme_mode', themeMode);
    isThemeMode.value = themeMode;
  }
}

  // void selectButton(int index) async {
  //   selectedButtonIndex.value = index;
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt('selectedButtonIndexLanguage', index);

  // }

  // islanguage =  prefs.getString('language_code') ?? 'en';

  // int? savedIndexlanguage = prefs.getInt('selectedButtonIndexLanguage');
  // selectedButtonIndex.value = savedIndexlanguage ?? -1;
