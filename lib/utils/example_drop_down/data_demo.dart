import 'package:equatable/equatable.dart';

class QueueItem {
  String value;
  String text;
  String description;

  QueueItem(
      {required this.value, required this.text, required this.description});
}

List<QueueItem> lstQueues = ([
  QueueItem(value: "CN", text: "CN - Edit", description: ""),
  QueueItem(
      value: "SC",
      text: "SC - Chuyến bay SC",
      description: 'Phải có TK'),
  QueueItem(
      value: "SCD",
      text: "SCD - Chuyến bay xa ngày",
      description: 'Phải có chuyến TK'),
]);


//------------------

final passengerTitles = {'MR', 'MS', 'MRS', 'MSTR', 'MISS'};


//-------------------


class CodeName extends Equatable {
  String code;
  String name;

  CodeName(this.code, this.name);

  @override
  List<Object?> get props => [code, name];
}


final List<CodeName> statusAgenciesVN = [
  CodeName("NEW", 'Mới'),
  CodeName("IN_CONTRACT", 'Hợp đồng'),
  CodeName("SIGNED", 'Ký hợp đồng'),
  CodeName("DELIVERED", 'Bàn giao'),
  CodeName("DONE", 'Hoàn thành'),
];

CodeName statusAgency(String status) => statusAgenciesVN
    .firstWhere((element) => element.code == status.toUpperCase());