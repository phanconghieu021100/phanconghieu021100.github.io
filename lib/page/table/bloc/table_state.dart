// table_state.dart
import 'package:restaurant_with_frog_api/model/tableitem.dart';



class TableState {
  final List<TableItem> tables;

  TableState({required this.tables});

  factory TableState.initial() => TableState(tables: []);

  TableState copyWith({List<TableItem>? tables}) {
    return TableState(tables: tables ?? this.tables);
  }
}
