import 'package:flutter/widgets.dart';
import 'package:tabletap/data_providers/data_service.dart';
import 'package:tabletap/repositories/models/models.dart';

class MenuRepository extends ChangeNotifier {
  final MenuProvider menuProvider = MenuProvider();

  Future<List<Meal>> getMenu() async {
    final menuData = (await menuProvider.fetchMenu());
    List<Meal> result = [];
    menuData.forEach((key, value) {
      final meal = Meal(
          id: int.parse(key),
          name: value['name'],
          imageUrl: value['image'],
          price: (value['price'] as int).toDouble(),
          category: value['category']);
      result.add(meal);
    });
    return result;
  }

  Future<List<Meal>> getMenuByCategory(String category) async {
    final menu = await getMenu();
    if (category != "All") {
      return menu.where((element) => element.category == category).toList();
    }
    return menu;
  }
}
