import 'dart:ui';

class TableItem {
  final String id;
  final Offset position;
  final Size size;
  final String type;

  TableItem({
    required this.id,
    required this.position,
    required this.size,
    required this.type,
  });

  TableItem copyWith({Offset? position, Size? size}) {
    return TableItem(
      id: id,
      position: position ?? this.position,
      size: size ?? this.size,
      type: type,
    );
  }
}