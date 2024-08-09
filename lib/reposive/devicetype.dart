import 'package:flutter/widgets.dart';

class DeviceType {
  static bool isPhone(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width < 600;
  }

  static bool isTablet(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width >= 600 && size.width < 1200;
  }

  static bool isDesktop(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return size.width >= 1200;
  }
}
