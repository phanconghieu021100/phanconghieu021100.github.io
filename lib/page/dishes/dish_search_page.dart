import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:restaurant_with_frog_api/features/auth/bloc/auth_cubit.dart';
import 'package:restaurant_with_frog_api/page/dishes/bloc/dish_search_cubit.dart';
import 'package:restaurant_with_frog_api/page/dishes/bloc/dish_search_state.dart';
import 'package:restaurant_with_frog_api/page/dishes/widget/filter_dishes.dart';
import 'package:restaurant_with_frog_api/page/dishes/widget/search_dishes.dart';
import 'package:restaurant_with_frog_api/page/table/table_editor_page.dart';

class DishSearchPage extends StatelessWidget {
  DishSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DishSearchCubit()..fetchData(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white, // màu nền cố định
          surfaceTintColor: Colors.transparent,
          title: const Text('Danh sách'),
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TableEditorPage(),
                      ));
                },
                child: Icon(Icons.motion_photos_paused_rounded)),
            GestureDetector(
                onTap: () {
                  context.read<AuthCubit>().logout();
                },
                child: Icon(Icons.logout_rounded))
          ],
        ),
        body: BlocBuilder<DishSearchCubit, DishSearchState>(
          builder: (context, state) {
            final cubit = context.read<DishSearchCubit>();

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SearchDishes(cubit: cubit),
                  const SizedBox(height: 8),
                  FilterDishes(cubit: cubit),
                  const SizedBox(height: 8),
                  if (state.errorMessage != null)
                    Text(state.errorMessage!,
                        style: const TextStyle(color: Colors.red)),
                  Expanded(
                    child: SmartRefresher(
                      controller: cubit.refreshController,
                      enablePullDown: true,
                      enablePullUp: state.hasMore, // ✅ thay dòng này
                      onRefresh: cubit.refresh,
                      onLoading: cubit.loadMore,
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
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
