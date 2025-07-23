// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzel/puzzle_game/box_content.dart';
import 'package:puzzel/puzzle_game/content_game.dart';
import 'package:puzzel/puzzle_game/convert_puzzle.dart';
import 'package:puzzel/puzzle_game/widget/logo_air_data.dart';
import 'package:puzzel/puzzle_game/widget/star_position.dart';

class VietnameseCrosswordPuzzle extends StatefulWidget {
  const VietnameseCrosswordPuzzle({super.key});

  @override
  _VietnameseCrosswordPuzzleState createState() =>
      _VietnameseCrosswordPuzzleState();
}

class _VietnameseCrosswordPuzzleState extends State<VietnameseCrosswordPuzzle> {
  @override
  void initState() {
    super.initState();
  }

  final Set<String> revealedCells = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffaf5d3),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(),
            child: Stack(
              children: [
                // Image.asset('assets/images/bgim.png'),
                // Image.network(
                //   bgImage,
                // ),
                Column(
                  children: [
                    SizedBox(height: 80.h), // Header space
                    Expanded(
                      child: ListView.builder(
                        itemCount: answers.length,
                        itemBuilder: (context, row) {
                          return Container(
                            // padding: EdgeInsets.symmetric(
                            //     vertical: 2.h), // Giảm spacing dòng
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200,
                                ),

                                // 🔢 Số thứ tự dòng
                                _widgetNumberStt(row),
                                SizedBox(
                                  width: 200,
                                ),

                                // 🔳 Các ô trong dòng đó
                                Expanded(
                                  child: Wrap(
                                    spacing: 8.w,
                                    runSpacing: 0, // Sát dòng
                                    children:
                                        List.generate(answers.length, (col) {
                                      if (shouldHideCell(row, col)) {
                                        return SizedBox(
                                            width: 60.w, height: 60.h);
                                      }

                                      final key = '${row}_$col';
                                      final isRevealed =
                                          revealedCells.contains(key);
                                      final content = isRevealed
                                          ? getContent(row, col)
                                          : '';

                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (isRevealed) {
                                              revealedCells.remove(key);
                                            } else {
                                              revealedCells.add(key);
                                            }
                                          });
                                        },
                                        child: Padding(
                                          padding:  EdgeInsets.only(top:8.h),
                                          child: BoxContent(
                                            content: content,
                                            colorContainer:
                                                getCellColor(row, col),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),

                                // ❓ Widget câu hỏi
                                _widgetQues(row, context),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          LogoAirData(),
          StarPosition(
            revealedCells: revealedCells,
          )
        ],
      ),
    );
  }

  GestureDetector _widgetNumberStt(int row) {
    return GestureDetector(
      onTap: () {
        setState(() {
          for (int col = 0; col < answers.length; col++) {
            revealedCells.remove('${row}_$col');
          }
        });
      },
      onLongPress: () {
        setState(() {
          for (int col = 0; col < answers.length; col++) {
            if (!shouldHideCell(row, col)) {
              revealedCells.add('${row}_$col');
            }
          }
        });
      },
      child: Container(
        width: 40.w,
        height: 40.h,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: (row % 2 == 0) ? Colors.red : Colors.green,
          shape: BoxShape.circle,
        ),
        child: Text(
          '${row + 1}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20.sp,
          ),
        ),
      ),
    );
  }

  GestureDetector _widgetQues(int row, BuildContext context) {
    return GestureDetector(
      onTap: () {
        final rowKey = row.toString();
        final questionEntry = questionsAndLengthAnswer[rowKey];

        if (questionEntry != null) {
          final questionText = questionEntry.keys.first;
          final answerLength = questionEntry.values.first;
          final TextEditingController _controller = TextEditingController();

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hàng ngang số ${row + 1}'.toUpperCase(),
                      style: GoogleFonts.baloo2(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          questionText,
                          style: GoogleFonts.baloo2(
                            fontSize: 40.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ' ($answerLength ký tự)',
                          style: GoogleFonts.baloo2(
                            fontSize: 40.sp,
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    // TextField(
                    //   maxLength: answerLength,
                    //   inputFormatters: [
                    //     UpperCaseTextFormatter(),
                    //     LengthLimitingTextInputFormatter(
                    //         answerLength),
                    //   ],
                    //   controller: _controller,
                    //   decoration: const InputDecoration(
                    //     hintText: 'Nhập đáp án...',
                    //     border: OutlineInputBorder(),
                    //   ),
                    // ),
                  ],
                ),
                actions: [
                  // TextButton(
                  //   onPressed: () {
                  //     final userAnswer = _controller.text
                  //         .trim()
                  //         .toUpperCase();
                  //     final correctAnswer = answers[row];

                  //     if (userAnswer == correctAnswer) {
                  //       setState(() {
                  //         for (int col = 0;
                  //             col < 10;
                  //             col++) {
                  //           if (!shouldHideCell(row, col)) {
                  //             final key = '${row}_$col';
                  //             revealedCells.add(key);
                  //           }
                  //         }
                  //       });
                  //       showFlushBar(
                  //         context,
                  //         content: 'Chính xác',
                  //       );
                  //       Navigator.pop(context);
                  //     } else {
                  //       // Hiển thị sai

                  //       showFlushBar(context,
                  //           content: 'Sai đáp án!',
                  //           backgroundColor: Colors.red);
                  //     }
                  //   },
                  //   child: const Text('Kiểm tra'),
                  // ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Đóng'),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Container(
        width: 30.w,
        height: 30.h,
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          right: 350.w,
        ),
        decoration: BoxDecoration(
          color: (row % 2 == 0) ? Colors.red.shade500 : Colors.green.shade500,
          shape: BoxShape.circle,
        ),
        child: Text(
          '? ${row + 1}',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20.sp),
        ),
      ),
    );
  }
}
