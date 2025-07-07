import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

bool shouldHideCell(int row, int col) {
  final Map<int, Set<int>> hiddenCells = {
    0: {0, 1, 2, 9},
    1: {0, 5, 6, 7, 8, 9},
    2: {0, 1, 2, 9},
    3: {4, 5, 6, 7, 8, 9},
    4: {0, 1},
    5: {0, 1, 2, 7, 8, 9},
    6: {0, 4, 5, 6, 7, 8, 9},
    7: {0, 1, 8, 9},
    8: {7, 8, 9},
    9: {0, 1, 5,6,7,8, 9},
  };

  return hiddenCells[row]?.contains(col) ?? false;
}

final Map<int, String> answers = {
  0: 'AGENCY',
  1: 'VOID',
  2: 'REMARK',
  3: 'HOLD',
  4: 'DANHSACH',
  5: 'TACH',
  6: 'VNA',
  7: 'HANHLY',
  8: 'VIETJET',
  9: 'OSI',
};

String getContent(int row, int col) {
  if (shouldHideCell(row, col)) return '';

//dòng 0
  if (row == 0) {
    const agencyLetters = ['A', 'G', 'E', 'N', 'C', 'Y'];

    // Danh sách các cột KHÔNG ẩn trong dòng 0
    final visibleCols = List.generate(10, (i) => i)
        .where((c) => !shouldHideCell(0, c))
        .toList();

    // Tìm index tương ứng trong agencyLetters
    final letterIndex = visibleCols.indexOf(col);
    if (letterIndex >= 0 && letterIndex < agencyLetters.length) {
      return agencyLetters[letterIndex];
    }
    return '';
  }
  //dòng 1
  if (row == 1) {
    const agencyLetters = [
      'V',
      'O',
      'I',
      'D',
    ];

    // Danh sách các cột KHÔNG ẩn trong dòng 0
    final visibleCols = List.generate(10, (i) => i)
        .where((c) => !shouldHideCell(1, c))
        .toList();

    // Tìm index tương ứng trong agencyLetters
    final letterIndex = visibleCols.indexOf(col);
    if (letterIndex >= 0 && letterIndex < agencyLetters.length) {
      return agencyLetters[letterIndex];
    }
    return '';
  }
  //dòng 2
  if (row == 2) {
    const agencyLetters = [
      'R',
      'E',
      'M',
      'A',
      'R',
      'K',
    ];

    // Danh sách các cột KHÔNG ẩn trong dòng 0
    final visibleCols = List.generate(10, (i) => i)
        .where((c) => !shouldHideCell(2, c))
        .toList();

    // Tìm index tương ứng trong agencyLetters
    final letterIndex = visibleCols.indexOf(col);
    if (letterIndex >= 0 && letterIndex < agencyLetters.length) {
      return agencyLetters[letterIndex];
    }
    return '';
  }
  //dòng 3
  if (row == 3) {
    const agencyLetters = [
      'H',
      'O',
      'L',
      'D',
    ];

    // Danh sách các cột KHÔNG ẩn trong dòng 0
    final visibleCols = List.generate(10, (i) => i)
        .where((c) => !shouldHideCell(3, c))
        .toList();

    // Tìm index tương ứng trong agencyLetters
    final letterIndex = visibleCols.indexOf(col);
    if (letterIndex >= 0 && letterIndex < agencyLetters.length) {
      return agencyLetters[letterIndex];
    }
    return '';
  }
  //dòng 4
  if (row == 4) {
    const agencyLetters = [
      'D',
      'A',
      'N',
      'H',
      'S',
      'A',
      'C',
      'H',
    ];

    // Danh sách các cột KHÔNG ẩn trong dòng 0
    final visibleCols = List.generate(10, (i) => i)
        .where((c) => !shouldHideCell(4, c))
        .toList();

    // Tìm index tương ứng trong agencyLetters
    final letterIndex = visibleCols.indexOf(col);
    if (letterIndex >= 0 && letterIndex < agencyLetters.length) {
      return agencyLetters[letterIndex];
    }
    return '';
  }
  //dòng 5
  if (row == 5) {
    const agencyLetters = [
      'T',
      'A',
      'C',
      'H',
    ];

    // Danh sách các cột KHÔNG ẩn trong dòng 0
    final visibleCols = List.generate(10, (i) => i)
        .where((c) => !shouldHideCell(5, c))
        .toList();

    // Tìm index tương ứng trong agencyLetters
    final letterIndex = visibleCols.indexOf(col);
    if (letterIndex >= 0 && letterIndex < agencyLetters.length) {
      return agencyLetters[letterIndex];
    }
    return '';
  }
  //dòng 6
  if (row == 6) {
    const agencyLetters = [
      'V',
      'N',
      'A',
    ];

    // Danh sách các cột KHÔNG ẩn trong dòng 0
    final visibleCols = List.generate(10, (i) => i)
        .where((c) => !shouldHideCell(6, c))
        .toList();

    // Tìm index tương ứng trong agencyLetters
    final letterIndex = visibleCols.indexOf(col);
    if (letterIndex >= 0 && letterIndex < agencyLetters.length) {
      return agencyLetters[letterIndex];
    }
    return '';
  }
  //dòng 7
  if (row == 7) {
    const agencyLetters = [
      'H',
      'A',
      'N',
      'H',
      'L',
      'Y',
    ];

    // Danh sách các cột KHÔNG ẩn trong dòng 0
    final visibleCols = List.generate(10, (i) => i)
        .where((c) => !shouldHideCell(7, c))
        .toList();

    // Tìm index tương ứng trong agencyLetters
    final letterIndex = visibleCols.indexOf(col);
    if (letterIndex >= 0 && letterIndex < agencyLetters.length) {
      return agencyLetters[letterIndex];
    }
    return '';
  }
  //dòng 8
  if (row == 8) {
    const agencyLetters = [
      'V',
      'I',
      'E',
      'T',
      'J',
      'E',
      'T',
    ];

    // Danh sách các cột KHÔNG ẩn trong dòng 0
    final visibleCols = List.generate(10, (i) => i)
        .where((c) => !shouldHideCell(8, c))
        .toList();

    // Tìm index tương ứng trong agencyLetters
    final letterIndex = visibleCols.indexOf(col);
    if (letterIndex >= 0 && letterIndex < agencyLetters.length) {
      return agencyLetters[letterIndex];
    }
    return '';
  }
  //dòng 9
  if (row == 9) {
    const agencyLetters = [
      'O',
      'S',
      'I',
    ];

    // Danh sách các cột KHÔNG ẩn trong dòng 0
    final visibleCols = List.generate(10, (i) => i)
        .where((c) => !shouldHideCell(9, c))
        .toList();

    // Tìm index tương ứng trong agencyLetters
    final letterIndex = visibleCols.indexOf(col);
    if (letterIndex >= 0 && letterIndex < agencyLetters.length) {
      return agencyLetters[letterIndex];
    }
    return '';
  }

  return '-'; // mặc định cho dòng khác
}

Color getCellColor(int row, int col) {
  // Tô màu xanh lá cho ô đầu tiên có chữ "A" trong dòng 0 (col = 3)
  if (row == 0 && col == 3) {
    return colorGreen;
  }
  if (row == 1 && col == 3) {
    return colorGreen;
  }
  if (row == 2 && col == 3) {
    return colorGreen;
  }
  if (row == 3 && col == 3) {
    return colorGreen;
  }
  if (row == 4 && col == 3) {
    return colorGreen;
  }
  if (row == 5 && col == 3) {
    return colorGreen;
  }
  if (row == 6 && col == 3) {
    return colorGreen;
  }
  if (row == 7 && col == 3) {
    return colorGreen;
  }
  if (row == 8 && col == 3) {
    return colorGreen;
  }
  if (row == 9 && col == 3) {
    return colorGreen;
  }

  return Colors.white; // Mặc định
}

Color colorGreen = Colors.green.shade300;
Color colorBrow300 = Colors.brown.shade300;

final Map<String, Map<String, int>> questions = {
  '0': {'Từ được dùng để chỉ nhóm đối tượng bán vé máy bay trong hệ thống.': 6},
  '1': {'Thao tác hoàn vé miễn phí trong ngày.': 4},
  '2': {'Tính năng thêm ghi chú cho code vé hãng VNA': 6},
  '3': {'Trạng thái giữ chỗ nhưng chưa thanh toán.': 4},
  '4': {'Giao diện xem toàn bộ các booking đã đặt.': 8},
  '5': {'Chức năng chia hành khách ra khỏi mã.': 4},
  '6': {'Hãng hàng không quốc gia Việt Nam.': 3},
  '7': {'Vật dụng ký gửi theo cân nặng khi đi máy bay.': 6},
  '8': {'Hãng bay màu đỏ được mệnh danh là delay Airline.': 7},
  '9': {'Gửi thông tin khách đặc biệt cho hãng.': 3},
};

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
