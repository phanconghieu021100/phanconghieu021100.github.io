// table_state.dart
import 'package:restaurant_with_frog_api/model/tableitem.dart';

class TableState {
  final List<TableItem> tables;
  final List<String> selectedTableIds;

  TableState({required this.tables, this.selectedTableIds = const []});

  factory TableState.initial() => TableState(tables: []);

  TableState copyWith({
    List<TableItem>? tables,
    List<String>? selectedTableIds,
  }) {
    return TableState(
      tables: tables ?? this.tables,
      selectedTableIds: selectedTableIds ?? this.selectedTableIds,
    );
  }
}
