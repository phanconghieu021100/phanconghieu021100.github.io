import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_with_frog_api/base/base_response.dart';
import 'package:restaurant_with_frog_api/model/dish.dart';
import 'package:restaurant_with_frog_api/model/tableitem.dart';
import 'package:restaurant_with_frog_api/page/dishes/paginated_dishes.dart';

class RestaurantService {
  static const baseUrl = 'https://restaurant-yz31.onrender.com';
  // static const baseUrl = 'http://localhost:8080';

  static Future<PaginatedDishes> fetchAllDishes({
    int page = 1,
    String? sort,
  }) async {
    // Tạo Map để chứa các query parameters
    final queryParameters = {
      'page': page.toString(),
      if (sort != null) 'sort': sort, // chỉ thêm sort nếu có
    };

    // Tạo Uri với query parameters
    final uri =
        Uri.parse('$baseUrl/dishes').replace(queryParameters: queryParameters);

    final response = await http.get(uri);
    final Map<String, dynamic> body = jsonDecode(response.body);

    final base = BaseResponse.fromJson(
      {'data': body}, // 👈 bọc theo đúng format của BaseResponse
      (data) => PaginatedDishes.fromJson(data),
    );

    return base.data;
  }

  static Future<List<Dish>> searchDishes(
    String keyword, {
    String? sort,
    bool matchAll = true, // 👈 thêm flag matchAll
  }) async {
    final queryParams = {
      'keyword': keyword,
      if (sort != null) 'sort': sort,
      if (matchAll) 'match': 'all', // 👈 thêm nếu matchAll bật
    };

    final uri = Uri.parse('$baseUrl/dishes_search')
        .replace(queryParameters: queryParams);

    final response = await http.get(uri);
    final body = jsonDecode(response.body);

    final List list = body['results'];
    return list.map((e) => Dish.fromJson(e)).toList();
  }

  static Future<Dish> getDishById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/dishes/$id'));
    final body = jsonDecode(response.body);
    return Dish.fromJson(body);
  }

  static Future<Dish> createDish(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/dishes'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return Dish.fromJson(jsonDecode(response.body));
  }

  static Future<Dish> updateDish(String id, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$baseUrl/dishes/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return Dish.fromJson(jsonDecode(response.body));
  }

  static Future<void> deleteDish(String id) async {
    await http.delete(Uri.parse('$baseUrl/dishes/$id'));
  }

  /// GET /tables - Lấy danh sách tất cả bàn
  static Future<List<TableItem>> fetchAllTables() async {
    final response = await http.get(Uri.parse('$baseUrl/tables'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['results'] as List;
      return data.map((e) => TableItem.fromJson(e)).toList();
    } else {
      throw Exception('Lỗi khi load danh sách bàn');
    }
  }

  /// POST /tables - Lưu hoặc cập nhật 1 bàn
  static Future<void> saveSingleTable(TableItem table) async {
    final response = await http.post(
      Uri.parse('$baseUrl/tables'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(table.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Lỗi khi lưu bàn');
    }
  }

  /// POST /tables/save-all - Lưu toàn bộ danh sách bàn
  static Future<void> saveAllTables(List<TableItem> tables) async {
    final response = await http.post(
      Uri.parse('$baseUrl/tables/save_all'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(tables.map((e) => e.toJson()).toList()),
    );

    if (response.statusCode != 200) {
      throw Exception('Lỗi khi lưu danh sách bàn');
    }
  }
}
