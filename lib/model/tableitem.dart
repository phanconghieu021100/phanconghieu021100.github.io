import 'dart:ui';

class TableItem {
  final String id;
  final Offset position;
  final Size size;
  final String type;
  final String? groupId;
  final bool isSelected;

  TableItem({
    required this.id,
    required this.position,
    required this.size,
    required this.type,
    this.groupId,
    this.isSelected = false,
  });

  TableItem copyWith({
    Offset? position,
    Size? size,
    String? groupId,
    bool? isSelected,
  }) {
    return TableItem(
      id: id,
      position: position ?? this.position,
      size: size ?? this.size,
      type: type,
      groupId: groupId ?? this.groupId,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
