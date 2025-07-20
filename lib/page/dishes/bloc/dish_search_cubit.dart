import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_with_frog_api/server/dish_service.dart';
import 'dish_search_state.dart';

class DishSearchCubit extends Cubit<DishSearchState> {
  DishSearchCubit() : super(const DishSearchState());

  Timer? _debounce;

  Future<void> fetchData({int page = 1}) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final paginated =
          await DishService.fetchAllDishes(page: page, sort: state.selectedSort);
      emit(state.copyWith(
        results: paginated.results,
        currentPage: paginated.currentPage,
        totalPages: paginated.totalPages,
        isLoading: false,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, errorMessage: 'Lỗi khi lấy danh sách món: $e'));
    }
  }

  void searchDishes(String name) {
    _debounce?.cancel();

    emit(state.copyWith(searchKeyword: name));

    if (name.trim().isEmpty) {
      // nếu rỗng, load lại tất cả món
      fetchData(page: 1);
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      try {
        final dishes = await DishService.searchDishes(name, sort: state.selectedSort);
        emit(state.copyWith(
          results: dishes,
          isLoading: false,
          errorMessage: null,
          currentPage: 1,
          totalPages: 1,
        ));
      } catch (e) {
        emit(state.copyWith(
            isLoading: false, errorMessage: 'Lỗi khi tìm món ăn: $e'));
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

  void nextPage() {
    if (state.currentPage < state.totalPages) {
      fetchData(page: state.currentPage + 1);
    }
  }

  void prevPage() {
    if (state.currentPage > 1) {
      fetchData(page: state.currentPage - 1);
    }
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
