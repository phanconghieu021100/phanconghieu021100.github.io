import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:puzzel/puzzle_game/content_game.dart';

int colHighlight = computeColHighlight(answers, keyAnswer);

int computeColHighlight(Map<int, String> answers, String keyAnswer) {
  int maxLeft = 0;
  int maxRight = 0;

  for (int row = 0; row < keyAnswer.length; row++) {
    if (!answers.containsKey(row)) continue;

    final word = answers[row]!;
    final target = keyAnswer[row];
    final index = word.indexOf(target);
    if (index == -1) continue;

    // max số chữ bên trái và phải của ký tự target trong word
    final left = index;
    final right = word.length - index - 1;

    if (left > maxLeft) maxLeft = left;
    if (right > maxRight) maxRight = right;
  }

  return maxLeft; // vị trí cột sẽ là `maxLeft`, vừa đủ chứa bên trái
}

bool shouldHideCell(int row, int col) {
  if (!answers.containsKey(row)) return false;
  if (row >= keyAnswer.length) return true;

  final answer = answers[row]!;
  final targetLetter = keyAnswer[row];

  final targetIndex = answer.indexOf(targetLetter);
  if (targetIndex == -1) return true;

  final startCol = colHighlight - targetIndex;
  final endCol = startCol + answer.length - 1;

  return col < startCol || col > endCol;
}

Color getCellColor(int row, int col) {
  if (!answers.containsKey(row)) return Colors.white;
  if (shouldHideCell(row, col)) return Colors.white;
  if (row >= keyAnswer.length) return Colors.white;

  final answer = answers[row]!;
  final targetLetter = keyAnswer[row];

  // Tìm vị trí của chữ cần tô màu trong từ
  final targetIndex = answer.indexOf(targetLetter);
  if (targetIndex == -1) return Colors.white;

  // Danh sách cột không ẩn (thứ tự ánh xạ vào answer)
  final visibleCols = List.generate(14, (i) => i)
      .where((c) => !shouldHideCell(row, c))
      .toList();

  // Nếu cột hiện tại là nơi chứa ký tự cần tô màu
  if (targetIndex < visibleCols.length && visibleCols[targetIndex] == col) {
    return colorGreen;
  }

  return Colors.white;
}

Color colorGreen = Colors.amber.shade200;
Color colorBrow300 = Colors.brown.shade300;

Future<void> showFlushBar(BuildContext context,
    {required String content,
    Duration? duration,
    Color backgroundColor = Colors.green,
    void Function()? onClose}) async {
  // Future.delayed(Duration(milliseconds: 100)).then((value) {

  // });
  await Future.delayed(Duration(milliseconds: 100));
  await Flushbar(
    message: content,
    flushbarStyle: FlushbarStyle.GROUNDED,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: backgroundColor,
    duration: duration ?? Duration(seconds: 3),
  ).show(context);
  onClose?.call();
}

String getContent(int row, int col) {
  if (shouldHideCell(row, col)) return '';

  // Kiểm tra nếu row nằm trong answers
  if (answers.containsKey(row)) {
    final word = answers[row]!; // Lấy chuỗi tương ứng
    final visibleCols = List.generate(answers.length, (i) => i)
        .where((c) => !shouldHideCell(row, c))
        .toList();

    final letterIndex = visibleCols.indexOf(col);
    if (letterIndex >= 0 && letterIndex < word.length) {
      return word[letterIndex];
    }
    return '';
  }

  return '-'; // Mặc định cho các dòng khác
}
