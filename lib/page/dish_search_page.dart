import 'package:flutter/material.dart';
import 'package:restaurant_with_frog_api/model/dish.dart';
import 'dart:async';
import 'package:restaurant_with_frog_api/server/dish_service.dart';

class DishSearchPage extends StatefulWidget {
  @override
  _DishSearchPageState createState() => _DishSearchPageState();
}

class _DishSearchPageState extends State<DishSearchPage> {
  List<Dish> results = [];
  final TextEditingController _controller = TextEditingController();
  bool isLoading = false;
  Timer? _debounce;
  String? _selectedSort;

  int currentPage = 1;
  int totalPages = 1;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData({int page = 1}) async {
    setState(() => isLoading = true);
    try {
      final paginated =
          await DishService.fetchAllDishes(page: page, sort: _selectedSort);
      setState(() {
        results = paginated.results;
        currentPage = paginated.currentPage;
        totalPages = paginated.totalPages;
      });
    } finally {
      setState(() => isLoading = false);
    }
  }

  Future<void> searchDishes(String name) async {
    if (name.trim().isEmpty) {
      fetchData(); // 👈 Nếu rỗng thì load tất cả lại
      return;
    }

    _debounce?.cancel();
    _debounce = Timer(Duration(milliseconds: 500), () async {
      setState(() => isLoading = true);
      final dishes = await DishService.searchDishes(name, sort: _selectedSort);
      setState(() {
        results = dishes;
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void nextPage() {
    if (currentPage < totalPages) {
      fetchData(page: currentPage + 1);
    }
  }

  void prevPage() {
    if (currentPage > 1) {
      fetchData(page: currentPage - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Danh sách món ăn')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Tìm món ăn',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                    fetchData();
                  },
                ),
              ),
              onChanged: searchDishes,
            ),
          ),
          DropdownButton<String>(
            value: _selectedSort,
            hint: Text('Sắp xếp theo'),
            items: [
              DropdownMenuItem(value: 'price_asc', child: Text('Giá tăng dần')),
              DropdownMenuItem(
                  value: 'price_desc', child: Text('Giá giảm dần')),
            ],
            onChanged: (value) {
              setState(() => _selectedSort = value);
              searchDishes(_controller.text); // hoặc truyền _selectedSort
            },
          ),
          if (isLoading)
            Expanded(child: Center(child: CircularProgressIndicator()))
          else
            Expanded(
              child: ListView.builder(
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
          if (!isLoading)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: currentPage > 1 ? prevPage : null,
                  child: Text('← Trang trước'),
                ),
                Text('Trang $currentPage / $totalPages'),
                TextButton(
                  onPressed: currentPage < totalPages ? nextPage : null,
                  child: Text('Trang sau →'),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
