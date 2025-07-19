import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_with_frog_api/model/dish.dart';
class DishService {
  static const baseUrl = 'https://restaurant-yz31.onrender.com';

  static Future<List<Dish>> fetchAllDishes() async {
    final response = await http.get(Uri.parse('$baseUrl/dishes'));
    final body = jsonDecode(response.body);
    final List list = body['dishes'];
    return list.map((e) => Dish.fromJson(e)).toList();
  }

  static Future<List<Dish>> searchDishes(String name) async {
    final response = await http.get(Uri.parse('$baseUrl/dishes_search?name=$name'));
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
}
