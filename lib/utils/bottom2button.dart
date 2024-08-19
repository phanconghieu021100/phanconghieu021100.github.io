import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:phanconghieu020100/utils/bottomButton.dart';
import 'package:phanconghieu020100/utils/colors.dart';

class Bottom2button extends StatelessWidget {
  final String? title1;
  final String? title2;
  final void Function()? onTap1;
  final void Function() onTap2;
  final Widget? icon2Button;
  final Color? color2Button;
  final double? space;
  final Color? color1Button;
  final bool disableBtn2;
  const Bottom2button(
      {Key? key,
      this.title1,
      this.title2,
      this.onTap1,
      required this.onTap2,
      this.color1Button,
      this.color2Button,
      this.space,
      this.disableBtn2 = false,
      this.icon2Button})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: BottomButton(
                buttonColor: color1Button ?? AppColors.hint,
                onTap: () {
                  if (onTap1 != null) {
                    onTap1!.call();
                  } else {
                    Get.back();
                  }
                },
                title: title1 ?? "Cancle")),
        SizedBox(
          width: space ?? 24.w,
        ),
        Expanded(
          child: icon2Button != null
              ? CommonIconButton(
                  onTap: onTap2,
                  title: title2 ?? "Cancle",
                  buttonColor: color2Button,
                  icon: icon2Button!)
              : _buildButton2(),
        ),
      ],
    );
  }

  Widget _buildButton2() {
    return BottomButton(
        onTap: () {
          onTap2();
        },
        buttonColor: color2Button ?? AppColors.active,
        disable: disableBtn2,
        title: title2 ?? "Save");
  }
}
