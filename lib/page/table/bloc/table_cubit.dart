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
    final updated = state.tables.map((t) {
      if (t.isSelected)
        return t.copyWith(groupId: newGroupId, isSelected: false);
      return t;
    }).toList();
    emit(state.copyWith(tables: updated));
  }

  void toggleTableSelection(String id) {
    final updated = state.tables.map((t) {
      if (t.id == id) return t.copyWith(isSelected: !t.isSelected);
      return t;
    }).toList();
    emit(state.copyWith(tables: updated));
  }
}
