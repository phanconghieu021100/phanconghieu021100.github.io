import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phanconghieu020100/main.dart';
import 'package:phanconghieu020100/utils/bottom2button.dart';

Future showCommonBottomSheet2(Widget child,
    {bool isScrollControlled = false,
    void Function()? onClose,
    BoxConstraints? constraints,
    Color? backgroundColor,
    AnimationController? animationController,
    RouteSettings? settings,
    bool isDismissible = true}) async {
  totalCurrentBtnShow++;
  var res = await Get.bottomSheet(
      BottomSheet(
        backgroundColor: backgroundColor,
        onClosing: () {},
        constraints: constraints ??
            BoxConstraints(
                maxHeight: Get.height - Get.mediaQuery.viewPadding.top),
        animationController: animationController,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        builder: (context) {
          return child;
        },
      ),
      isScrollControlled: isScrollControlled,
      settings: settings,
      isDismissible: isDismissible);
  totalCurrentBtnShow--;
  onClose?.call();
  return res;
}

void showCommonConfirm({
  required String title,
  required String subTitle,
  required void Function() onTap,
  Widget? child,
}) {
  showCommonBottomSheet(Container(
    padding: EdgeInsets.only(bottom: Get.mediaQuery.viewPadding.bottom + 10),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              title,
              // style: AppStyles.bigStyle,
            ),
          ),
          Text(subTitle),
          if (child != null) child,
          SizedBox(
            height: 16,
          ),
          Bottom2button(onTap2: onTap)
        ],
      ),
    ),
  ));
}

Future showCommonBottomSheet(Widget child,
    {bool isScrollControlled = false,
    void Function()? onClose,
    BoxConstraints? constraints,
    Color? backgroundColor,
    AnimationController? animationController,
    RouteSettings? settings,
    bool isDismissible = true}) async {
  totalCurrentBtnShow++;
  var res = await Get.bottomSheet(
    Container(
      constraints: constraints ??
          BoxConstraints(
            maxHeight: Get.height - Get.mediaQuery.viewPadding.top,
          ),
      child: child,
    ),
    isScrollControlled: isScrollControlled,
    backgroundColor: backgroundColor ?? Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    enableDrag: true,
    isDismissible: isDismissible,
  );
  totalCurrentBtnShow--;
  onClose?.call();
  return res;
}
