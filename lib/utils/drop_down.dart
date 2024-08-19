import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:phanconghieu020100/fonts/font_controller.dart';
import 'package:phanconghieu020100/utils/colors.dart';

class BuildDropDownV2<T> extends StatefulWidget {
  final FontController fontController = Get.find<FontController>();

  final bool isExpanded;
  final bool isDense;
  final String hintText;
  final T? currentValue;
  final void Function(T?)? onChange;
  final double? maxHeight;
  final double? itemHeight;
  final List<DropdownMenuItem<T>> childs;
  final bool showClearIcon;
  final List? listQueues;
  // final List<QueueItem>? listQueues;

   BuildDropDownV2(
      {Key? key,
      this.isExpanded = true,
      this.hintText = '',
      required this.childs,
      this.isDense = false,
      this.maxHeight,
      this.currentValue,
      this.itemHeight,
      this.onChange,
      this.showClearIcon = false,
      this.listQueues})
      : super(key: key);

  @override
  State<BuildDropDownV2<T>> createState() => _BuildDropDownV2State<T>();
}

class _BuildDropDownV2State<T> extends State<BuildDropDownV2<T>> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              child: DropdownButton<T>(
                isExpanded: widget.isExpanded,
                menuMaxHeight: widget.maxHeight,
                itemHeight: widget.itemHeight,
                isDense: widget.isDense,
                hint: Text(
                  widget.hintText,
                  style: widget.fontController.currentFontStyle
                      .copyWith(color: AppColors.textSmall),
                ),
                underline: Container(),
                icon: Row(
                  children: [
                    if (widget.showClearIcon &&
                        widget.currentValue != null) ...[
                      GestureDetector(
                        onTap: () {
                          widget.onChange?.call(null);
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.close,
                          color: AppColors.red,
                          size: 18,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      )
                    ],
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.active,
                    ),
                  ],
                ),
                style: const TextStyle(fontSize: 12),
                dropdownColor: Colors.white,
                value: widget.currentValue != null &&
                        widget.childs
                            .any((item) => item.value == widget.currentValue)
                    ? widget.currentValue
                    : null,
                onChanged: widget.onChange,
                items: widget.childs,
              ),
            ),
          ],
        )
      ],
    );
  }
}



//--------------------


class BuildDropDownV3<T> extends StatelessWidget {
  final FontController fontController = Get.find<FontController>();

  final bool isExpanded;
  final bool isDense;
  final String hintText;
  final T? currentValue;
  final void Function(T?)? onChange;
  final double? maxHeight;
  final double? itemHeight;
  final List<DropdownMenuItem<T>> childs;
  final bool showClearIcon;
  final List listQueues;
  // final List<QueueItem> listQueues;

   BuildDropDownV3(
      {Key? key,
      this.isExpanded = true,
      this.hintText = '',
      required this.childs,
      this.isDense = false,
      this.maxHeight,
      this.currentValue,
      this.itemHeight,
      this.onChange,
      this.showClearIcon = false,
      required this.listQueues})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              child: DropdownButton<T>(
                isExpanded: isExpanded,
                menuMaxHeight: maxHeight,
                itemHeight: itemHeight,
                selectedItemBuilder: (context) {
                  return listQueues
                      .map((e) => Text(
                            e.text,
                            style:fontController.currentFontStyle
                                .copyWith(color: AppColors.pinkText),
                          ))
                      .toList();
                },
                isDense: isDense,
                hint: Text(
                  hintText,
                  style: fontController.currentFontStyle
                      .copyWith(color: AppColors.textSmall),
                ),
                underline: Container(),
                icon: Row(
                  children: [
                    if (showClearIcon && currentValue != null) ...[
                      GestureDetector(
                        onTap: () {
                          onChange?.call(null);
                        },
                        child: const Icon(
                          Icons.close,
                          color: AppColors.red,
                          size: 18,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      )
                    ],
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.active,
                    ),
                  ],
                ),
                style: const TextStyle(fontSize: 12),
                dropdownColor: Colors.white,
                value: currentValue != null &&
                        childs.any((item) => item.value == currentValue)
                    ? currentValue
                    : null,
                onChanged: onChange,
                items: childs,
              ),
            ),
          ],
        )
      ],
    );
  }
}