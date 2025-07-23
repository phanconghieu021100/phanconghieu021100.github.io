import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:puzzel/puzzle_game/content_game.dart';
import 'package:puzzel/puzzle_game/convert_puzzle.dart';

class StarPosition extends StatefulWidget {
  const StarPosition(
      {super.key, required this.revealedCells, required this.onRevealChange});

  final Set<String> revealedCells;
  final VoidCallback onRevealChange;

  @override
  State<StarPosition> createState() => _StarPositionState();
}

class _StarPositionState extends State<StarPosition> {
  void revealColumn(int col) {
    for (int row = 0; row < answers.length; row++) {
      if (!shouldHideCell(row, col)) {
        widget.revealedCells.add('$row\_$col');
      }
    }
    widget.onRevealChange(); // 🔁 Force rebuild parent
  }

  void removeColumn(int col) {
    for (int row = 0; row < answers.length; row++) {
      if (!shouldHideCell(row, col)) {
        widget.revealedCells.remove('$row\_$col');
      }
    }
    widget.onRevealChange(); // 🔁 Force rebuild parent
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 25.h,
      left: 830.w,
      child: GestureDetector(
        onTap: () {
          setState(() {
            removeColumn(colHighlight);
          });
          // print('123');
        },
        onLongPress: () {
          setState(() {
            revealColumn(colHighlight);
          });
        },
        child: Image.asset(
          'assets/images/star.png',
          height: 60.h,
          width: 60.w,
        ),
      ),
    );
  }
}
