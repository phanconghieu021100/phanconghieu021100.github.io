// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BoxContent extends StatelessWidget {
  const BoxContent({super.key, this.content, this.colorContainer});

  final String? content;
  final Color? colorContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
          color: colorContainer),
      child: Center(
          child: Text(
        content ?? '',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
      )),
    );
  }
}
