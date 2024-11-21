import 'dart:convert';
import 'package:http/http.dart' as http;

import '../components/models/meal.dart';


class ApiService {
  static const String baseUrl = 'https://alexandergeorge102934.github.io/nutrigoapi';

  // Fetch menu data grouped by restaurant
  static Future<List<Meal>> fetchMenus() async {
    final response = await http.get(Uri.parse('$baseUrl/menus.json'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return data.entries.expand((entry) {
        final restaurantName = entry.key;
        final meals = entry.value as List;
        return meals.map((meal) => Meal.fromJson(meal, restaurantName));
      }).toList();
    } else {
      throw Exception('Failed to load menus');
    }
  }

}
