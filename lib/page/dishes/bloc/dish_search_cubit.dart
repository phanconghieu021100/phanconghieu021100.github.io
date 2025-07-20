import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:restaurant_with_frog_api/server/restaurant_service.dart';
import 'dish_search_state.dart';

class DishSearchCubit extends Cubit<DishSearchState> {
  DishSearchCubit() : super(const DishSearchState());

  Timer? _debounce;

  Future<void> fetchData({int page = 1, bool isLoadMore = false}) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final paginated = await RestaurantService.fetchAllDishes(
        page: page,
        sort: state.selectedSort,
      );

      emit(state.copyWith(
        results: isLoadMore
            ? [...state.results, ...paginated.results]
            : paginated.results,
        currentPage: paginated.currentPage,
        isLoading: false,
        errorMessage: null,
        hasMore: paginated.hasMore,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Lỗi khi lấy danh sách món: $e',
      ));
    }

    // ✅ Gọi refreshController ở đây luôn
    if (_isRefreshing) {
      refreshController.refreshCompleted();
      _isRefreshing = false;
    }

    if (_isLoadingMore) {
      refreshController.loadComplete();
      _isLoadingMore = false;
    }
  }

  /// Gõ tìm kiếm (có debounce)
  void searchDishes(String name) {
    _debounce?.cancel();
    emit(state.copyWith(searchKeyword: name));

    if (name.trim().isEmpty) {
      fetchData(page: 1);
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      try {
        final dishes = await RestaurantService.searchDishes(
          name,
          sort: state.selectedSort,
        );
        emit(state.copyWith(
          results: dishes,
          isLoading: false,
          errorMessage: null,
          currentPage: 1,
          totalPages: 1,
        ));
      } catch (e) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: 'Lỗi khi tìm món ăn: $e',
        ));
      }
    });
  }

  void changeSort(String? sort) {
    emit(state.copyWith(selectedSort: sort));
    if (state.searchKeyword.trim().isEmpty) {
      fetchData(page: 1);
    } else {
      searchDishes(state.searchKeyword);
    }
  }

  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  bool _isRefreshing = false;
  bool _isLoadingMore = false;
  void refresh() {
    _isRefreshing = true;
    fetchData(page: 1);
  }

  void loadMore() {
    if (state.hasMore && !state.isLoading) {
      _isLoadingMore = true;
      fetchData(page: state.currentPage + 1, isLoadMore: true);
    }
  }

  @override
  Future<void> close() {
    refreshController.dispose();
    _debounce?.cancel();
    return super.close();
  }
}
