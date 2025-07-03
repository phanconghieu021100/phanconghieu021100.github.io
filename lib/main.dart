// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:puzzel/crossword_puzzle.dart';

void main() {
  runApp(VietnameseCrosswordApp());
}

class VietnameseCrosswordApp extends StatelessWidget {
  const VietnameseCrosswordApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GIẢI MÃ Ô CHỮ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: VietnameseCrosswordPuzzle(),
    );
  }
}
