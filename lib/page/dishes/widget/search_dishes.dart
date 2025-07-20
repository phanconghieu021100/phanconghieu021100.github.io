import 'package:flutter/material.dart';
import 'package:restaurant_with_frog_api/page/dishes/bloc/dish_search_cubit.dart';

class SearchDishes extends StatelessWidget {
  const SearchDishes({
    super.key,
    required this.cubit,
  });

  final DishSearchCubit cubit;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Tìm',
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            FocusScope.of(context).unfocus();
            cubit.searchDishes('');
          },
        ),
      ),
      onChanged: cubit.searchDishes,
    );
  }
}
