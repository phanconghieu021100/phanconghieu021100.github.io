import 'package:flutter/material.dart';
import 'package:restaurant_with_frog_api/page/dishes/bloc/dish_search_cubit.dart';

class FilterDishes extends StatelessWidget {
  const FilterDishes({
    super.key,
    required this.cubit,
  });

  final DishSearchCubit cubit;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: cubit.state.selectedSort,
      hint: const Text('Sắp xếp theo'),
      isExpanded: true,
      items: const [
        DropdownMenuItem(value: 'price_asc', child: Text('Giá tăng dần')),
        DropdownMenuItem(value: 'price_desc', child: Text('Giá giảm dần')),
      ],
      onChanged: cubit.changeSort,
    );
  }
}
