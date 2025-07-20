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

  factory TableItem.fromJson(Map<String, dynamic> json) {
    return TableItem(
      id: json['id'],
      type: json['type'],
      position: Offset(json['position']['dx'], json['position']['dy']),
      size: Size(json['size']['width'], json['size']['height']),
      groupId: json['groupId'],
      groupColor: json['groupColor'] != null ? Color(json['groupColor']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'position': {'dx': position.dx, 'dy': position.dy},
      'size': {'width': size.width, 'height': size.height},
      'groupId': groupId,
      'groupColor': groupColor?.value,
    };
  }

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
