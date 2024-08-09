import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationService {
  static const String languageCodeKey = 'language_code';
  static const String themeModeKey = 'theme_mode';

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




final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  // Các cấu hình khác cho light theme
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,

);

final ThemeData customTheme = ThemeData(
  brightness: Brightness.light, // Hoặc Brightness.dark tùy thuộc vào yêu cầu của bạn

  // Sử dụng primarySwatch để chỉ định một màu chủ đạo
  primarySwatch: Colors.amber,

  // Sử dụng colorScheme để cấu hình màu sắc phụ
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.amber, // Màu chủ đạo
  ).copyWith(
    secondary: Colors.red, // Màu sắc phụ (trước đây là accentColor)
  ),

  // Các cấu hình khác cho custom theme
  // Ví dụ: textTheme, buttonTheme, etc.
);