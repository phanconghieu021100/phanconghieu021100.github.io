import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puzzel/puzzle_game/convert_puzzle.dart';

class StarPosition extends StatefulWidget {
  const StarPosition({super.key, required this.revealedCells});

  final Set<String> revealedCells;

  @override
  State<StarPosition> createState() => _StarPositionState();
}

class _StarPositionState extends State<StarPosition> {
  void revealColumn(int col) {
    setState(() {
      for (int row = 0; row < 10; row++) {
        if (!shouldHideCell(row, col)) {
          widget.revealedCells.add('$row\_$col');
        }
      }
    });
  }

  void removeColumn(int col) {
    setState(() {
      for (int row = 0; row < 10; row++) {
        if (!shouldHideCell(row, col)) {
          widget.revealedCells.remove('$row\_$col');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50.h,
      left: 720.w,
      child: GestureDetector(
        onTap: () {
          // removeColumn(3);
        },
        onLongPress: () {
          // revealColumn(3);
        },
        child: Image.asset(
          'assets/images/star.png',
          height: 80.h,
          width: 80.w,
        ),
      ),
    );
  }
}
