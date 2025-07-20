import 'package:equatable/equatable.dart';
import 'package:restaurant_with_frog_api/model/dish.dart';

class DishSearchState extends Equatable {
  final List<Dish> results;
  final bool isLoading;
  final int currentPage;
  final int totalPages;
  final String? selectedSort;
  final String? errorMessage;
  final String searchKeyword;
  final bool hasMore;

  const DishSearchState({
    this.results = const [],
    this.isLoading = false,
    this.currentPage = 1,
    this.totalPages = 1,
    this.selectedSort,
    this.errorMessage,
    this.searchKeyword = '',
    this.hasMore = true,
  });

  DishSearchState copyWith({
    List<Dish>? results,
    bool? isLoading,
    int? currentPage,
    int? totalPages,
    String? selectedSort,
    String? errorMessage,
    String? searchKeyword,
    bool? hasMore,
  }) {
    return DishSearchState(
      results: results ?? this.results,
      isLoading: isLoading ?? this.isLoading,
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      selectedSort: selectedSort ?? this.selectedSort,
      errorMessage: errorMessage,
      searchKeyword: searchKeyword ?? this.searchKeyword,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  List<Object?> get props => [
        results,
        isLoading,
        currentPage,
        totalPages,
        selectedSort,
        errorMessage,
        searchKeyword,
        hasMore
      ];
}
