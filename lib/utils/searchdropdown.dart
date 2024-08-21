import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:phanconghieu020100/fonts/font_controller.dart';
import 'package:phanconghieu020100/utils/colors.dart';

class SearchDropdown<T> extends StatefulWidget {
  final String hintText;
  final Widget Function(BuildContext, T) itemBuilder;
  final FutureOr<Iterable<T>> Function(String)? suggestions;
  final void Function(T) onTapSuggestion;
  final void Function()? onClearCreated;
  final FocusNode focusNode;
  final TextEditingController controller;
  final TextStyle? styleHint;
  final TextStyle? styleT;
  final double? sizz;
  final FontController fontController = Get.find<FontController>();

  SearchDropdown(
      {Key? key,
      required this.itemBuilder,
      required this.suggestions,
      required this.onTapSuggestion,
      required this.hintText,
      this.onClearCreated,
      required this.focusNode,
      required this.controller,
      this.styleHint,
      this.sizz,
      this.styleT})
      : super(key: key);

  @override
  State<SearchDropdown<T>> createState() => _SearchDropdownState<T>();
}

class _SearchDropdownState<T> extends State<SearchDropdown<T>> {
  bool _isShowIconClose = false;
  @override
  void initState() {
    _isShowIconClose = widget.controller.text.isNotEmpty;
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        widget.controller.text = '';
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<T>(
      textFieldConfiguration: TextFieldConfiguration(
          autofocus: false,
          focusNode: widget.focusNode,
          controller: widget.controller,
          style: widget.styleT ?? widget.fontController.currentFontStyle,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: widget.sizz ?? 16),
              hintText: widget.hintText,
              fillColor: Colors.white,
              filled: true,
              suffixIcon: _isShowIconClose
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          widget.controller.clear();
                        });
                        if (widget.onClearCreated != null) {
                          widget.onClearCreated!();
                        }
                      },
                      child: Icon(
                        Icons.close,
                        color: AppColors.active,
                      ),
                    )
                  : Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.active,
                    ),
              hintStyle: widget.styleHint ??
                  widget.fontController.currentFontStyle
                      .copyWith(color: AppColors.hint),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: Theme.of(context).dividerColor)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.red, width: 2)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.red)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: Theme.of(context).primaryColor)))),
      suggestionsCallback: widget.suggestions ??
          (pattern) {
            return [];
          },
      itemBuilder: widget.itemBuilder,
      onSuggestionSelected: widget.onTapSuggestion,
      noItemsFoundBuilder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            "Không tìm thấy",
            style: widget.fontController.currentFontStyle
                .copyWith(color: AppColors.hint),
          ),
        );
      },
      transitionBuilder: (context, child, controller) {
        return child;
      },
    );
  }
}

class SearchDropdown2<T> extends StatefulWidget {
  final String hintText;
  final Widget Function(BuildContext, T) itemBuilder;
  final FutureOr<Iterable<T>> Function(String)? suggestions;
  final void Function(T) onTapSuggestion;
  final void Function()? onClearCreated;
  final FocusNode focusNode;
  final TextEditingController controller;
  final FontController fontController = Get.find<FontController>();
  final bool isShowIconClose;

  SearchDropdown2(
      {Key? key,
      required this.itemBuilder,
      required this.suggestions,
      required this.onTapSuggestion,
      required this.hintText,
      this.onClearCreated,
      required this.focusNode,
      required this.controller, required this.isShowIconClose})
      : super(key: key);

  @override
  State<SearchDropdown2<T>> createState() => _SearchDropdown2State<T>();
}

class _SearchDropdown2State<T> extends State<SearchDropdown2<T>> {
  @override
  void initState() {
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        widget.controller.text = '';
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TypeAheadField<T>(
          textFieldConfiguration: TextFieldConfiguration(
              autofocus: false,
              focusNode: widget.focusNode,
              controller: widget.controller,
              style: widget.fontController.currentFontStyle,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  hintText: widget.hintText,
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: widget.isShowIconClose
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              widget.controller.clear();
                            });
                            if (widget.onClearCreated != null) {
                              widget.onClearCreated!();
                            }
                          },
                          child: Container(
                            // padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.close,
                              color: AppColors.active,
                            ),
                          ),
                        )
                      : Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.active,
                        ),
                  hintStyle: widget.fontController.currentFontStyle
                      .copyWith(color: AppColors.hint),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Theme.of(context).dividerColor,width: 0.15)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 0.5)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.red,width: 0.5)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.active)))),
          suggestionsCallback: widget.suggestions ??
              (pattern) {
                return [];
              },
            
          itemBuilder: widget.itemBuilder,
          onSuggestionSelected: widget.onTapSuggestion,
          noItemsFoundBuilder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Không tìm thấy",
                style: widget.fontController.currentFontStyle
                    .copyWith(color: AppColors.hint),
              ),
            );
          },
          transitionBuilder: (context, child, controller) {
            return Material(
              borderRadius: BorderRadius.circular(8),
              elevation: 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: child,
              ),
            );
          },
        ),
      ],
    );
  }
}
