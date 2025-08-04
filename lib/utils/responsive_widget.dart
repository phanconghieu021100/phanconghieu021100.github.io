import 'package:flutter/material.dart';

abstract class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({Key? key}) : super(key: key);

  Widget buildMobile(BuildContext context);
  Widget buildTablet(BuildContext context);
  Widget buildDesktop(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= 1024) {
      return buildDesktop(context);
    } else if (width >= 600) {
      return buildTablet(context);
    } else {
      return buildMobile(context);
    }
  }
}
