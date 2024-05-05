import 'package:flutter/material.dart';
import 'package:scrollview_observer/scrollview_observer.dart';
import 'package:tabletap/features/restaurant/widgets/meal_dialogue.dart';
// import 'package:tabletap/features/restaurant/widgets/meal_item.dart';
import 'package:tabletap/features/restaurant/widgets/widgets.dart';
import 'package:tabletap/repositories/models/models.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class RestaurantScreen extends StatelessWidget {
  RestaurantScreen({super.key});

  final ScrollController scrollController = ScrollController();

  void showMealInfoDialog(BuildContext context, {required Meal meal}) {
    showDialog(
      context: context,
      builder: (context) {
        return MealDialogue(meal: meal);
      },
    );
  }

  final List<Meal> meals = [
    Meal(
        id: 1,
        name: "Chicken",
        imageUrl:
            'https://hips.hearstapps.com/hmg-prod/images/chicken-dinner-recipes-1650896150.jpeg',
        price: 99),
    Meal(
        id: 1,
        name: "Chicken",
        imageUrl:
            'https://hips.hearstapps.com/hmg-prod/images/chicken-dinner-recipes-1650896150.jpeg',
        price: 99),
    Meal(
        id: 1,
        name: "Chicken",
        imageUrl:
            'https://images.immediate.co.uk/production/volatile/sites/30/2022/03/Sweet-and-Sour-Tofu-7b9db79.jpg?quality=90&resize=556,505',
        price: 99),
    Meal(
        id: 1,
        name: "Chicken",
        imageUrl:
            'https://hips.hearstapps.com/hmg-prod/images/chicken-dinner-recipes-1650896150.jpeg',
        price: 99),
    Meal(
        id: 1,
        name: "Chicken",
        imageUrl:
            'https://hips.hearstapps.com/hmg-prod/images/chicken-dinner-recipes-1650896150.jpeg',
        price: 99),
    Meal(
        id: 1,
        name: "Chicken",
        imageUrl:
            'https://hips.hearstapps.com/hmg-prod/images/chicken-dinner-recipes-1650896150.jpeg',
        price: 99),
    Meal(
        id: 1,
        name: "Chicken",
        imageUrl:
            'https://hips.hearstapps.com/hmg-prod/images/chicken-dinner-recipes-1650896150.jpeg',
        price: 99),
  ];

  @override
  Widget build(BuildContext context) {
    final GridObserverController _gridScrollController =
        GridObserverController(controller: scrollController);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Steak House",
            style: const TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () => {
              _gridScrollController.animateTo(
                  index: 4, duration: Duration(seconds: 1), curve: Curves.ease)
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            _buildCategoryList(context),
            Expanded(
                child: GridViewObserver(
              child: _buildMealList(context),
              controller: _gridScrollController,
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          CategoryTile(title: "All"),
          CategoryTile(title: "Drinks"),
          CategoryTile(title: "Hot Meals"),
          CategoryTile(title: "Hot Meals"),
          CategoryTile(title: "Hot Meals"),
          CategoryTile(title: "Hot Meals"),
          CategoryTile(title: "Hot Meals"),
          CategoryTile(title: "Snacks")
        ],
      ),
    );
  }

  Widget _buildMealList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GridView(
        controller: scrollController,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          ...meals
              .map((e) => MealItem(
                  meal: e, onTap: () => showMealInfoDialog(context, meal: e)))
              .toList()
        ],
      ),
    );
  }
}
