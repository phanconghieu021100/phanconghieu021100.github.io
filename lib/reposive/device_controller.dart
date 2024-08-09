import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeviceController extends GetxController {
  bool get isPhone => MediaQuery.of(Get.context!).size.width < 600;
  bool get isTablet => MediaQuery.of(Get.context!).size.width >= 600 && MediaQuery.of(Get.context!).size.width < 1200;
  bool get isDesktop => MediaQuery.of(Get.context!).size.width >= 1200;
}

class ResponsiveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DeviceController deviceController = Get.put(DeviceController());

    return Obx(() {
      if (deviceController.isPhone) {
        return _buildPhoneLayout(context);
      } else if (deviceController.isTablet) {
        return _buildTabletLayout(context);
      } else {
        return _buildDesktopLayout(context);
      }
    });
  }

  Widget _buildPhoneLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Phone Layout")),
      body: Center(child: Text("This is a phone layout")),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tablet Layout")),
      body: Center(child: Text("This is a tablet layout")),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Desktop Layout")),
      body: Center(child: Text("This is a desktop layout")),
    );
  }
}
