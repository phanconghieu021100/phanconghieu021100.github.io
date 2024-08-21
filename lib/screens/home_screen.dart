import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phanconghieu020100/app_config/app_config.dart';
import 'package:phanconghieu020100/color_text/color_controller.dart';
import 'package:phanconghieu020100/fonts/font_controller.dart';
import 'package:phanconghieu020100/loading/loading_controller.dart';

class HomeScreen extends StatelessWidget {
  // Khởi tạo controller tại đây
  final FontController fontController = Get.put(FontController());
  final ColorController colorController = Get.put(ColorController());

  HomeScreen({Key? key}) : super(key: key);

    final LoadingController loadingController = Get.put(LoadingController());

    String nameFlavor = AppConfig.instance.name;

  @override
  Widget build(BuildContext context) {
    // Đăng ký LoadingController
    
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            'title'.tr,
            style: fontController.currentFontStyle.copyWith(color: colorController.textColor.value),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(nameFlavor),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/setting_screen');
                },
                child: Text(
                  'setting'.tr,
                  style: fontController.currentFontStyle.copyWith(color: colorController.textColor.value),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  loadingController.showLoading();
                  await Future.delayed(Duration(seconds: 2));
                  loadingController.hideLoading();
                },
                child: Text('Start Loading'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}