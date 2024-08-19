import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:phanconghieu020100/fonts/font_controller.dart';
import 'package:phanconghieu020100/utils/colors.dart';

class TitleCloseWidget extends StatelessWidget {
   TitleCloseWidget({Key? key, required this.title, this.colorText})
      : super(key: key);
  final String title;
  final Color? colorText;
  final FontController fontController = Get.find<FontController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 4.w,
        ),
        Center(
          child: Container(
            height: 3.w,
            width: 93.w,
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(10.w),
            ),
          ),
        ),
        SizedBox(
          height: 12.w,
        ),
        _titleWidget(),
      ],
    );
  }

  Widget _titleWidget() {
    return Stack(
      children: [
        Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: fontController.currentFontStyle.copyWith(fontSize: 15.sp),
          ),
        ),
        Positioned(
          child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                  color: Colors.transparent,
                  child: const Icon(
                    Icons.clear,
                    color: AppColors.red,
                  ))),
          top: 0,
          right: 16.w,
        )
      ],
    );
  }
}
