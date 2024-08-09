import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phanconghieu020100/color_text/color_controller.dart';
import 'package:phanconghieu020100/fonts/font_controller.dart';
import 'package:phanconghieu020100/loading/loading_controller.dart';

class HomeScreen extends StatelessWidget {
  final FontController fontController = Get.find();
  final ColorController colorController = Get.find();

   HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoadingController loadingController = Get.put(LoadingController());
    return Obx(
      () =>Scaffold(
          appBar: AppBar(
              title: Text('title'.tr,
                  style: fontController.currentFontStyle
                      .copyWith(color: colorController.textColor.value))),
          body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Get.offNamed('/setting_screen');
                        Get.toNamed('/setting_screen');
                      },
                      child: Text('setting'.tr,
                          style: fontController.currentFontStyle
                              .copyWith(color: colorController.textColor.value)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        loadingController.showLoading();
                        await Future.delayed(
                            Duration(seconds: 2)); 
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
