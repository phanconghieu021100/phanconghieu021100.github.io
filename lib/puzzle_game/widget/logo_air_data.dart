import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoAirData extends StatelessWidget {
  const LogoAirData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 360.h,
      left: 120.w,
      child: Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.cover,
        height: 150.h,
      ),
    );
  }
}