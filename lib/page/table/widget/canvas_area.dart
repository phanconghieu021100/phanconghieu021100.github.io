import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_with_frog_api/page/table/bloc/table_cubit.dart';
import 'package:restaurant_with_frog_api/page/table/bloc/table_state.dart';
import 'package:restaurant_with_frog_api/page/table/widget/draggable_table_item.dart';

class CanvasArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableCubit, TableState>(
      builder: (context, state) {
        return Stack(
          children: state.tables.map((table) {
            return Positioned(
              left: table.position.dx,
              top: table.position.dy,
              child: DraggableTableItem(
                table: table,
                isSelected: state.selectedTableIds.contains(table.id),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
