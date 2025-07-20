// table_editor_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_with_frog_api/model/tableitem.dart';
import 'package:restaurant_with_frog_api/page/table/bloc/table_cubit.dart';
import 'package:restaurant_with_frog_api/page/table/widget/canvas_area.dart';
import 'package:uuid/uuid.dart';

class TableEditorPage extends StatelessWidget {
  const TableEditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TableCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Thiết kế sơ đồ bàn'),
          actions: [
            Builder(builder: (ctx) {
              return IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => ctx.read<TableCubit>().clearAll(),
              );
            })
          ],
        ),
        body: Stack(
          children: [
            Positioned.fill(child: CanvasArea()),
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: [
                  Builder(
                    builder: (ctx) => ElevatedButton(
                      onPressed: () => _addTable(ctx, 'round'),
                      child: Text('Bàn tròn'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Builder(
                    builder: (ctx) => ElevatedButton(
                      onPressed: () => _addTable(ctx, 'square'),
                      child: Text('Bàn vuông'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addTable(BuildContext context, String type) {
    final table = TableItem(
      id: const Uuid().v4(),
      position: Offset(100, 100),
      size: Size(80, 80),
      type: type,
    );
    context.read<TableCubit>().addTable(table);
  }
}
