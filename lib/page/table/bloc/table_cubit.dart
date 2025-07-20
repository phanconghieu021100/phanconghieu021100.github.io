import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_with_frog_api/model/tableitem.dart';
import 'package:uuid/uuid.dart';
import 'table_state.dart';

class TableCubit extends Cubit<TableState> {
  TableCubit() : super(TableState.initial());

  void addTable(TableItem table) {
    emit(state.copyWith(tables: [...state.tables, table]));
  }

  void removeTable(String id) {
    emit(
        state.copyWith(tables: state.tables.where((t) => t.id != id).toList()));
  }

  void updateTable(TableItem updated) {
    final newTables =
        state.tables.map((t) => t.id == updated.id ? updated : t).toList();
    emit(state.copyWith(tables: newTables));
  }

  void clearAll() {
    emit(TableState.initial());
  }

  void groupSelectedTables() {
    final newGroupId = const Uuid().v4();
    final selectedIds = state.selectedTableIds;

    final updated = state.tables.map((t) {
      if (selectedIds.contains(t.id)) {
        return t.copyWith(groupId: newGroupId);
      }
      return t;
    }).toList();

    emit(state.copyWith(tables: updated, selectedTableIds: []));
  }

  void toggleTableSelection(String id) {
    final isSelected = state.selectedTableIds.contains(id);
    final updated = isSelected
        ? state.selectedTableIds.where((e) => e != id).toList()
        : [...state.selectedTableIds, id];

    emit(state.copyWith(selectedTableIds: updated));
  }

  void updateGroupColor(String groupId, Color newColor) {
    final updated = state.tables.map((t) {
      if (t.groupId == groupId) {
        return t.copyWith(groupColor: newColor);
      }
      return t;
    }).toList();

    emit(state.copyWith(tables: updated));
  }

  void logAllTablePositions() {
    for (final t in state.tables) {
      print('🪑 Table ${t.id}');
      print(' - Type: ${t.type}');
      print(' - Position: dx=${t.position.dx}, dy=${t.position.dy}');
      print(' - Size: width=${t.size.width}, height=${t.size.height}');
      print(' - Group: ${t.groupId}');
      print(' - Group Color: ${t.groupColor}');
      print(' - ----');
    }
  }
}
