import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:tabletap/data_providers/data_service.dart';
import 'package:tabletap/repositories/models/models.dart';
import 'package:tabletap/repositories/services/rkeeper_service.dart';

class MenuRepository extends ChangeNotifier {
  final MenuProvider menuProvider = MenuProvider();
  final RkeeperService rkeeperService = RkeeperService.shared;

  Future<List<Meal>> getMenu() async {
    final menuData = (await menuProvider.fetchMenu());
    List<Meal> result = [];
    menuData.forEach((key, value) {
      final meal = Meal(
        id: key,
        name: value['name'],
        // imageUrl: value['image'],
        price: (value['price'] as int).toDouble(), imageUrls: [value['image']],
      );
      result.add(meal);
    });
    return result;
  }

  Future<List<Meal>> getMenuRkeeper() async {
    final response = await rkeeperService.getMenu();
    // final Map<String, dynamic> decodedJson = jsonDecode(response.body);
    final Map<String, dynamic> decodedJson =
        json.decode(utf8.decode(response.bodyBytes));
    final List<dynamic> productsJson =
        decodedJson['taskResponse']['menu']['products'];
    return productsJson.map((json) => Meal.fromJson(json)).toList();
  }
}
