import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_with_frog_api/model/tableitem.dart';
import 'package:restaurant_with_frog_api/page/table/bloc/table_cubit.dart';

class DraggableTableItem extends StatefulWidget {
  final TableItem table;

  const DraggableTableItem({super.key, required this.table});

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<TableCubit>().toggleTableSelection(widget.table.id);
      },
      onPanUpdate: (details) {
        setState(() => _position += details.delta);
        final updated = widget.table.copyWith(position: _position);
        context.read<TableCubit>().updateTable(updated);
      },
      onLongPress: () => print({
        'id': widget.table.id,
        'type': widget.table.type,
        'position': {
          'dx': widget.table.position.dx,
          'dy': widget.table.position.dy
        },
        'size': {
          'width': widget.table.size.width,
          'height': widget.table.size.height
        },
        'groupId': widget.table.groupId
      }),
      child: Container(
        width: widget.table.size.width,
        height: widget.table.size.height,
        decoration: BoxDecoration(
          color:
              widget.table.isSelected ? Colors.blueAccent : Colors.brown[300],
          shape: widget.table.type == 'round'
              ? BoxShape.circle
              : BoxShape.rectangle,
          border: Border.all(color: Colors.black),
        ),
        alignment: Alignment.center,
        child: Text(widget.table.type),
      ),
    );
  }
}
