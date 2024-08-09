import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorController extends GetxController {
  // Màu chữ mặc định
  Rx<Color> textColor = Colors.black.obs;

  @override
  void onInit() {
    super.onInit();
    _loadColor();
  }

  // Hàm để thay đổi màu chữ
  void changeColor(Color color) {
    textColor.value = color;
    _saveColor(color);
  }

  // Lưu màu vào SharedPreferences
  Future<void> _saveColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('textColor', color.value);
  }

  // Tải màu từ SharedPreferences
  Future<void> _loadColor() async {
    final prefs = await SharedPreferences.getInstance();
    final colorValue = prefs.getInt('textColor') ?? Colors.black.value;
    textColor.value = Color(colorValue);
  }
}
