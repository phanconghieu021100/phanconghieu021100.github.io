// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
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
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bgim.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      removeColumn(3);
                    },
                    onLongPress: () {
                      revealColumn(3);
                    },
                    child: Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 50,
                    ),
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    'GIẢI MÃ Ô CHỮ - “Mở Khóa Hệ Thống”',
                    style: GoogleFonts.balooBhaina2(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10, // 10 dòng
                  itemBuilder: (context, row) {
                    return Padding(
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
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(left: 150, right: 200),
                              decoration: BoxDecoration(
                                color: (row % 2 == 0) ? Colors.red : Colors.green,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '${row + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
          
                          // ✅ Hiển thị 10 ô trong dòng đó
                          Expanded(
                            child: Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: List.generate(10, (col) {
                                if (shouldHideCell(row, col)) {
                                  return const SizedBox(width: 80, height: 80);
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
                                              '$questionText ($answerLength ký tự)'),
                                          const SizedBox(height: 12),
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
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(left: 10, right: 250),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                '? ${row + 1}',
                                style: TextStyle(fontWeight: FontWeight.bold),
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
        ],
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
