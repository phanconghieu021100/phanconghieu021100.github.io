import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phanconghieu020100/fonts/font_controller.dart';
import 'package:phanconghieu020100/utils/colors.dart';

class BottomButton extends StatelessWidget {
  final FontController fontController = Get.find<FontController>();

  final void Function() onTap;
  final String title;
  final Color buttonColor;
  final Color textColor;
  final Color disableColor;
  final double radius;
  final double? width;
  final double? height;
  final String? icon;
  final bool disable;
  final bool isShowGradient;
   BottomButton(
      {Key? key,
      required this.onTap,
      required this.title,
      this.radius = 8,
      this.buttonColor = AppColors.active,
      this.disableColor = AppColors.unActive,
      this.textColor = Colors.white,
      this.disable = false,
      this.isShowGradient = true,
      this.width,
      this.height,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: disable ? disableColor : buttonColor,
        // gradient: disable
        //     ? null
        //     : isShowGradient
        //         ? gradientApp
        //         : null,
      ),
      child: InkWell(
        onTap: disable ? null : onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style:fontController.currentFontStyle,
            ),
            // if (icon != null)
            //   Padding(
            //     padding: const EdgeInsets.only(left: 10),
            //     child: Icon(IconData.icon, color: Colors.white),
            //   )
          ],
        ),
      ),
    );
  }
}

class CommonIconButton extends StatelessWidget {
  final FontController fontController = Get.find<FontController>();

  final void Function() onTap;
  final String title;
  final Widget icon;
  final Color? buttonColor;
  final double height;
   CommonIconButton(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.icon,
      this.height = 44,
      this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor ?? AppColors.active,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 5),
              child: icon,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(
                  title,
                  style: fontController.currentFontStyle.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  final FontController fontController = Get.find<FontController>();

  final void Function() onDelete;
  final String title;
   DeleteButton({Key? key, required this.onDelete, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onDelete,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.red)),
        child: Row(
          children: [
            // AppAssets.svgIcon(IconPath.ic_delete, color: AppColors.red),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: fontController.currentFontStyle.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.red),
            )
          ],
        ),
      ),
    );
  }
}
