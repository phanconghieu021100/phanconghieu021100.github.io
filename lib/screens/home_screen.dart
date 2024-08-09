import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phanconghieu020100/color_text/color_controller.dart';
import 'package:phanconghieu020100/fonts/font_controller.dart';
import 'package:phanconghieu020100/fonts/fonts.dart';


class HomeScreen extends StatelessWidget {
  final FontController fontController = Get.find();
  final ColorController colorController = Get.find();

  
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
        appBar: AppBar(title: Text('title'.tr,style:fontController.currentFontStyle.copyWith(color:  colorController.textColor.value))),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Get.offNamed('/setting_screen');
                  Get.toNamed('/setting_screen');
      
                },
                child: Text('setting'.tr,style:fontController.currentFontStyle.copyWith(color:  colorController.textColor.value)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}