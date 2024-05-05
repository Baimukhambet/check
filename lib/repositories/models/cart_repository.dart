import 'package:flutter/material.dart';
import 'package:tabletap/repositories/models/meal.dart';

class CartRepository extends ChangeNotifier {
  final Map<Meal, int> items = {};

  void addToCart(Meal meal) {
    if (items.containsKey(meal)) {
      items.addEntries({meal: 1}.entries);
    } else {
      items[meal] = items[meal]! + 1;
    }
    notifyListeners();
  }
}
