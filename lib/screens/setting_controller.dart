import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
  RxInt selectedButtonIndex = RxInt(-1);

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() async {
    final prefs = await SharedPreferences.getInstance();
    int? savedIndexlanguage = prefs.getInt('selectedButtonIndexLanguage');
    selectedButtonIndex.value = savedIndexlanguage ?? -1;
  }

  void selectButton(int index) async {
    selectedButtonIndex.value = index;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selectedButtonIndexLanguage', index);
  }
}
