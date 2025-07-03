// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puzzel/box_content.dart';
import 'package:puzzel/convert.dart';

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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bgim.png'),
              fit: BoxFit.fitHeight),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    removeColumn(3);
                  },
                  onLongPress: () {
                    revealColumn(3);
                  },
                  child: Text(
                    'GIẢI MÃ Ô CHỮ - “Mở Khóa Hệ Thống”',
                    style: GoogleFonts.balooBhaina2(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // 10 dòng
                itemBuilder: (context, row) {
                  return Container(
                    // margin: EdgeInsets.only(top: 5.h),
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ✅ Hiển thị số thứ tự dòng ở đây
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              for (int col = 0; col < 10; col++) {
                                final key = '${row}_$col';
                                revealedCells
                                    .remove(key); // 👈 ẩn toàn bộ ô dòng này
                              }
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              for (int col = 0; col < 10; col++) {
                                if (!shouldHideCell(row, col)) {
                                  final key = '${row}_$col';
                                  revealedCells.add(key); // reveal ô này
                                }
                              }
                            });
                          },
                          child: Container(
                            width: 40.w,
                            height: 40.h,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                left: 350.w, right: 100.w, top: 30.h),
                            decoration: BoxDecoration(
                              color: (row % 2 == 0) ? Colors.red : Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '${row + 1}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 24.sp),
                            ),
                          ),
                        ),

                        // ✅ Hiển thị 10 ô trong dòng đó
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 10.h),
                            child: Wrap(
                              spacing: 8.w,
                              runSpacing: 6.h,
                              children: List.generate(10, (col) {
                                if (shouldHideCell(row, col)) {
                                  return SizedBox(width: 80.w, height: 80.h);
                                }

                                final key = '${row}_$col';
                                final isRevealed = revealedCells.contains(key);
                                final content =
                                    isRevealed ? getContent(row, col) : '';

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
                                  child: BoxContent(
                                    content: content,
                                    colorContainer: getCellColor(row, col),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            final rowKey = row.toString();
                            final questionEntry = questions[rowKey];

                            if (questionEntry != null) {
                              final questionText = questionEntry.keys.first;
                              final answerLength = questionEntry.values.first;
                              final TextEditingController _controller =
                                  TextEditingController();

                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Dòng ${row + 1}'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '$questionText ($answerLength ký tự)',
                                          style: TextStyle(fontSize: 20.sp),
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
                            width: 40.w,
                            height: 40.h,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 20.h, right: 350.w),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              '? ${row + 1}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void revealColumn(int col) {
    setState(() {
      for (int row = 0; row < 10; row++) {
        if (!shouldHideCell(row, col)) {
          revealedCells.add('$row\_$col');
        }
      }
    });
  }

  void removeColumn(int col) {
    setState(() {
      for (int row = 0; row < 10; row++) {
        if (!shouldHideCell(row, col)) {
          revealedCells.remove('$row\_$col');
        }
      }
    });
  }
}
