import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_with_frog_api/model/tableitem.dart';
import 'package:restaurant_with_frog_api/page/table/bloc/table_cubit.dart';

class DraggableTableItem extends StatefulWidget {
  final TableItem table;
  final bool isSelected;

  const DraggableTableItem({
    super.key,
    required this.table,
    required this.isSelected,
  });

  @override
  State<DraggableTableItem> createState() => _DraggableTableItemState();
}

class _DraggableTableItemState extends State<DraggableTableItem> {
  late Offset _position;

  @override
  void initState() {
    super.initState();
    _position = widget.table.position;
  }

  Color _resolveGroupColor() {
    // Nếu có màu do người dùng chọn, dùng nó
    if (widget.table.groupColor != null) {
      return widget.table.groupColor!;
    }

    // Không có màu người dùng chọn thì sinh màu từ groupId
    final groupId = widget.table.groupId;
    if (groupId == null) return Colors.brown[300]!;

    final hash = groupId.hashCode;
    final r = (hash & 0xFF0000) >> 16;
    final g = (hash & 0x00FF00) >> 8;
    final b = (hash & 0x0000FF);
    return Color.fromARGB(255, r, g, b).withOpacity(0.7);
  }

  @override
  Widget build(BuildContext context) {
    final baseColor = _resolveGroupColor();

    return GestureDetector(
      onTap: () {
        context.read<TableCubit>().toggleTableSelection(widget.table.id);
      },
      onPanUpdate: (details) {
        setState(() => _position += details.delta);
        final updated = widget.table.copyWith(position: _position);
        context.read<TableCubit>().updateTable(updated);
      },
      onLongPress: () {
        print(widget.table.groupColor);
        context.read<TableCubit>().saveTableToServer(widget.table);
      },
      onDoubleTap: () async {
        final groupId = widget.table.groupId;
        if (groupId == null) return;

        final pickedColor = await showDialog<Color?>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Chọn màu mới cho nhóm"),
            content: Wrap(
              children: [
                Colors.red,
                Colors.green,
                Colors.blue,
                Colors.orange,
                Colors.purple,
                Colors.teal
              ].map((color) {
                return GestureDetector(
                  onTap: () => Navigator.pop(ctx, color),
                  child: Container(
                    margin: EdgeInsets.all(8),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );

        if (pickedColor != null) {
          context.read<TableCubit>().updateGroupColor(groupId, pickedColor);
        }
      },
      child: Container(
        width: widget.table.size.width,
        height: widget.table.size.height,
        decoration: BoxDecoration(
          color: widget.isSelected
              ? baseColor.withOpacity(1.0)
              : baseColor.withOpacity(0.7),
          shape: widget.table.type == 'round'
              ? BoxShape.circle
              : BoxShape.rectangle,
          border: Border.all(
            color: widget.isSelected ? Colors.blueAccent : Colors.black,
            width: widget.isSelected ? 3 : 2,
          ),
        ),
        alignment: Alignment.center,
        child: Text(widget.table.type),
      ),
    );
  }
}
