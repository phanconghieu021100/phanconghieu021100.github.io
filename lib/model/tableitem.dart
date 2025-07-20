import 'dart:ui';

class TableItem {
  final String id;
  final Offset position;
  final Size size;
  final String type;
  final String? groupId;
  final bool isSelected;
  final Color? groupColor;

  TableItem(
      {required this.id,
      required this.position,
      required this.size,
      required this.type,
      this.groupId,
      this.isSelected = false,
      this.groupColor});

  TableItem copyWith(
      {Offset? position,
      Size? size,
      String? groupId,
      bool? isSelected,
      Color? groupColor}) {
    return TableItem(
        id: id,
        position: position ?? this.position,
        size: size ?? this.size,
        type: type,
        groupId: groupId ?? this.groupId,
        isSelected: isSelected ?? this.isSelected,
        groupColor: groupColor ?? this.groupColor);
  }
}
