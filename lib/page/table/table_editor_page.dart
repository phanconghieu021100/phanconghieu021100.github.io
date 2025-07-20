// table_editor_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_with_frog_api/model/tableitem.dart';
import 'package:restaurant_with_frog_api/page/table/bloc/table_cubit.dart';
import 'package:restaurant_with_frog_api/page/table/widget/canvas_area.dart';
import 'package:uuid/uuid.dart';

class TableEditorPage extends StatefulWidget {
  const TableEditorPage({super.key});

  @override
  State<TableEditorPage> createState() => _TableEditorPageState();
}

class _TableEditorPageState extends State<TableEditorPage> {
  late final TableCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = TableCubit();
    _cubit.loadTablesFromServer(); // 👈 Gọi API khi mở trang
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Thiết kế sơ đồ bàn'),
          actions: [
            Builder(builder: (ctx) {
              return IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => ctx.read<TableCubit>().clearAll(),
              );
            }),
            Builder(builder: (ctx) {
              return IconButton(
                  icon: const Icon(Icons.view_week),
                  onPressed: () =>
                      ctx.read<TableCubit>().saveAllTablesToServer());
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
                      child: const Text('Bàn tròn'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Builder(
                    builder: (ctx) => ElevatedButton(
                      onPressed: () => _addTable(ctx, 'square'),
                      child: const Text('Bàn vuông'),
                    ),
                  ),
                  Builder(builder: (ctx) {
                    return ElevatedButton(
                      onPressed: () =>
                          ctx.read<TableCubit>().groupSelectedTables(),
                      child: const Text("Gộp bàn"),
                    );
                  }),
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
      position: const Offset(100, 100),
      size: const Size(80, 80),
      type: type,
    );
    context.read<TableCubit>().addTable(table);
  }
}
