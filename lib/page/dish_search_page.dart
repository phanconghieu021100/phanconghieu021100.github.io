import 'package:flutter/material.dart';
import 'package:restaurant_with_frog_api/model/dish.dart';
import 'package:restaurant_with_frog_api/server/dish_service.dart';

class DishSearchPage extends StatefulWidget {
  @override
  _DishSearchPageState createState() => _DishSearchPageState();
}

class _DishSearchPageState extends State<DishSearchPage> {
  List<Dish> results = [];
  final TextEditingController _controller = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData(); // 👈 Load tất cả khi mở trang
  }

  Future<void> fetchData() async {
    setState(() => isLoading = true);
    final dishes = await DishService.fetchAllDishes();
    setState(() {
      results = dishes;
      isLoading = false;
    });
  }

  Future<void> searchDishes(String name) async {
    if (name.trim().isEmpty) {
      fetchData(); // 👈 nếu rỗng thì load tất cả
      return;
    }
    setState(() => isLoading = true);
    final dishes = await DishService.searchDishes(name);
    setState(() {
      results = dishes;
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Danh sách món ăn')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _controller,
              onChanged: searchDishes,
              decoration: InputDecoration(
                labelText: 'Tìm kiếm món ăn',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : results.isEmpty
                    ? Center(child: Text('Không có món nào.'))
                    : ListView.builder(
                        itemCount: results.length,
                        itemBuilder: (_, i) {
                          final dish = results[i];
                          return ListTile(
                            title: Text(dish.name),
                            subtitle: Text('${dish.price}đ - ${dish.category}'),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
