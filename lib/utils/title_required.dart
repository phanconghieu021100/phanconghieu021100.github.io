import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phanconghieu020100/fonts/font_controller.dart';
import 'package:phanconghieu020100/utils/colors.dart';

class TextRequired extends StatelessWidget {
  final FontController fontController = Get.find<FontController>();

  final String text;
  final bool isRequired;
   TextRequired({Key? key, required this.text, this.isRequired = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: text,
          style: fontController.currentFontStyle.copyWith(fontWeight: FontWeight.w500),
          children: [
            TextSpan(
                text: isRequired ? " *" : '',
                style: fontController.currentFontStyle.copyWith(color: AppColors.red))
          ]),
    );
  }
}

class TextNoneRequired extends StatelessWidget {
  final FontController fontController = Get.find<FontController>();

  final String text;
   TextNoneRequired({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  fontController.currentFontStyle.copyWith(fontWeight: FontWeight.w500),
    );
  }
}
