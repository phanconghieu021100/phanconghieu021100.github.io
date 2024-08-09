import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phanconghieu020100/loading/loading_controller.dart';
import 'package:phanconghieu020100/loading/loading_overlay.dart';
import 'package:phanconghieu020100/reposive/devicetype.dart';
import 'package:phanconghieu020100/screens/home_screen.dart';

class ResponsiveWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    if (DeviceType.isPhone(context)) {
      return _buildPhoneLayout(context);
    } else if (DeviceType.isTablet(context)) {
      return _buildTabletLayout(context);
    } else {
      return _buildDesktopLayout(context);
    }
  }

  Widget _buildPhoneLayout(BuildContext context) {
    return LoadingOverlay(
      child: Scaffold(
         appBar: AppBar(title: Text("Phone Layout")),
        body: HomeScreen(),
      ),
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
