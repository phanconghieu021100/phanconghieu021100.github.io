import 'package:restaurant_with_frog_api/model/dish.dart';

class PaginatedDishes {
  final List<Dish> results;
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final int pageSize;

  PaginatedDishes({
    required this.results,
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.pageSize,
  });

  factory PaginatedDishes.fromJson(Map<String, dynamic> json) {
    final List list = json['results'] ?? [];
    return PaginatedDishes(
      results: list.map((e) => Dish.fromJson(e)).toList(),
      currentPage: json['currentPage'] ?? 1,
      totalPages: json['totalPages'] ?? 1,
      totalItems: json['totalItems'] ?? 0,
      pageSize: json['pageSize'] ?? 20,
    );
  }
}
