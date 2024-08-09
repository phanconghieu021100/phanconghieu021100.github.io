import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phanconghieu020100/fonts/fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontController extends GetxController {
  // Default font key
  var selectedFontKey = 'roboto'.obs;

  @override
  void onInit() {
    super.onInit();
    loadFontFromPrefs();
  }

  void changeFont(String fontKey) {
    selectedFontKey.value = fontKey;
    saveFontToPrefs(fontKey);
  }

  TextStyle get currentFontStyle {
    switch (selectedFontKey.value) {
      case 'lato':
        return AppFonts.lato();
      case 'quicksan':
        return AppFonts.quicksan();
        case 'pacifico':
        return AppFonts.pacifico();
      default:
        return AppFonts.roboto();
    }
  }

  void saveFontToPrefs(String fontKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedFont', fontKey);
  }

  void loadFontFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedFontKey.value = prefs.getString('selectedFont') ?? 'roboto';
  }
}
