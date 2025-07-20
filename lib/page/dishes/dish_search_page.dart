import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_with_frog_api/page/dishes/bloc/dish_search_cubit.dart';
import 'package:restaurant_with_frog_api/page/dishes/bloc/dish_search_state.dart';
import 'package:restaurant_with_frog_api/page/dishes/widget/filter_dishes.dart';
import 'package:restaurant_with_frog_api/page/dishes/widget/search_dishes.dart';

class DishSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DishSearchCubit()..fetchData(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Danh sách')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<DishSearchCubit, DishSearchState>(
            builder: (context, state) {
              final cubit = context.read<DishSearchCubit>();
              return Column(
                children: [
                  SearchDishes(cubit: cubit),
                  const SizedBox(height: 8),
                  FilterDishes(cubit: cubit),
                  const SizedBox(height: 8),
                  if (state.errorMessage != null)
                    Text(
                      state.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  if (state.isLoading)
                    const Expanded(
                        child: Center(child: CircularProgressIndicator()))
                  else
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.results.length,
                        itemBuilder: (context, i) {
                          final dish = state.results[i];
                          return ListTile(
                            title: Text(dish.name),
                            subtitle: Text('${dish.price}đ - ${dish.category}'),
                          );
                        },
                      ),
                    ),
                  if (!state.isLoading)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed:
                              state.currentPage > 1 ? cubit.prevPage : null,
                          child: const Text('← Trang trước'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                              'Trang ${state.currentPage} / ${state.totalPages}'),
                        ),
                        TextButton(
                          onPressed: state.currentPage < state.totalPages
                              ? cubit.nextPage
                              : null,
                          child: const Text('Trang sau →'),
                        ),
                      ],
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
