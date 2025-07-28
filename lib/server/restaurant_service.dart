import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_with_frog_api/base/api_client.dart';
import 'package:restaurant_with_frog_api/base/base_response.dart';
import 'package:restaurant_with_frog_api/flavor/flavor_config.dart';
import 'package:restaurant_with_frog_api/model/dish.dart';
import 'package:restaurant_with_frog_api/model/tableitem.dart';
import 'package:restaurant_with_frog_api/page/dishes/paginated_dishes.dart';

class RestaurantService {
  // static const baseUrl = 'https://restaurant-yz31.onrender.com';

  // static const baseUrl = 'http://localhost:8080';

  static String get baseUrl => FlavorConfig.baseUrl;

  //----------------------------------Auth--------------------------------------------------------------------------
  static Future<Map<String, dynamic>> register({
    required String email,
    required String password,
    required String username,
    String role = 'user',
  }) async {
    return await request(
      path: '$baseUrl/auth/register',
      method: RequestMethod.post,
      sendToken: false,
      body: {
        'email': email,
        'password': password,
        'username': username,
        'role': role,
      },
    );
  }

  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    return await request(
      path: '$baseUrl/auth/login',
      method: RequestMethod.post,
      sendToken: false,
      body: {
        'email': email,
        'password': password,
      },
    );
  }

  static Future<Map<String, dynamic>> refreshToken(String refreshToken) async {
    return await request(
      path: '$baseUrl/auth/refresh_token',
      method: RequestMethod.post,
      sendToken: false,
      body: {
        'refreshToken': refreshToken,
      },
    );
  }

  //------------------------------------------------------------------------------------------------------------------------

  static Future<BaseResponse<PaginatedDishes>> fetchAllDishes({
    int page = 1,
    String? sort,
  }) async {
    final res = await request(
      path: '$baseUrl/dishes',
      method: RequestMethod.get,
      query: {
        'page': page,
        if (sort != null) 'sort': sort,
      },
    );

    return BaseResponse.fromJson(
      {'data': res},
      (data) => PaginatedDishes.fromJson(data),
    );
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

//------------------------------------Table---------------------------------------------------------------------------
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
