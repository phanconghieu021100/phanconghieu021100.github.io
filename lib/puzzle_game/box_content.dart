// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BoxContent extends StatelessWidget {
  const BoxContent(
      {super.key, this.content, this.colorContainer, this.colorText});

  final String? content;
  final Color? colorContainer;
  final Color? colorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 60.w,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8.r),
          color: colorContainer),
      child: Center(
          child: Text(content ?? '',
              style: GoogleFonts.baloo2(
                  fontWeight: FontWeight.w600,
                  fontSize: 28.sp,
                  color: colorText))),
    );
  }
}
