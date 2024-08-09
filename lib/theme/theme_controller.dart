import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppTheme { light, dark, custom }

class ThemeController extends GetxController {
  Rx<AppTheme> _themeMode = AppTheme.light.obs;
  final String themeModeKey = 'theme_mode';

  AppTheme get themeMode => _themeMode.value;

  @override
  void onInit() {
    super.onInit();
    _loadThemeMode();
  }

  void changeTheme(AppTheme themeMode) async {
    _themeMode.value = themeMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(themeModeKey, themeMode.toString());
  }

  void _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString(themeModeKey);
    if (savedTheme != null) {
      _themeMode.value = AppTheme.values.firstWhere(
        (e) => e.toString() == savedTheme,
        orElse: () => AppTheme.light,
      );
    } else {
      _themeMode.value = AppTheme.light;
    }
  }
}
