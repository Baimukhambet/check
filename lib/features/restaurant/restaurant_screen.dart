import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:scrollview_observer/scrollview_observer.dart';
import 'package:tabletap/features/restaurant/bloc/order_bloc.dart';
import 'package:tabletap/features/restaurant/widgets/meal_dialogue.dart';
import 'package:tabletap/features/restaurant/widgets/widgets.dart';
import 'package:tabletap/repositories/cart_repository.dart';
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

  final OrderBloc orderBloc = OrderBloc();

  void categoryTapped(String category) {
    orderBloc.add(OrderChangedCategory(category: category));
  }

  @override
  Widget build(BuildContext context) {
    final GridObserverController _gridScrollController =
        GridObserverController(controller: scrollController);

    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          scrolledUnderElevation: 0,
          title: const Text("Steak House",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          actions: [
            Consumer<CartRepository>(
              builder: (context, provider, child) => Badge(
                alignment: Alignment.topLeft,
                backgroundColor: Color.fromARGB(255, 229, 30, 30),
                // padding: EdgeInsets.all(6),
                // largeSize: 40,
                label: Text("${context.read<CartRepository>().items.length}"),
                child: IconButton(
                  onPressed: () => {context.pushNamed('/cart')},
                  icon: const Icon(Icons.shopping_cart_outlined),
                ),
              ),
            )
          ],
        ),
        body: BlocConsumer(
          bloc: orderBloc,
          listener: (context, state) {
            if (state is OrderInitial) {
              orderBloc.add(OrderChangedCategory(category: "All"));
              debugPrint("Yes");
            }
          },
          builder: (context, state) {
            if (state is OrderFail) {
              return Center(
                child: Text(state.errorMessage!),
              );
            } else if (state is OrderLoaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    _buildCategoryList(context, state.category),
                    Expanded(
                        child: GridViewObserver(
                      controller: _gridScrollController,
                      child: _buildMealList(context, state.menu),
                    )),
                  ],
                ),
              );
            } else if (state is OrderInitial) {
              orderBloc.add(OrderChangedCategory(category: 'All'));
              return const Center(child: const CircularProgressIndicator());
            } else {
              return const Center(child: const CircularProgressIndicator());
            }
          },
        ));
  }

  Widget _buildCategoryList(BuildContext context, String category) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryTile(
            title: "All",
            onTap: () => categoryTapped("All"),
            isSelected: ("All" == category),
          ),
          CategoryTile(
            title: "Drinks",
            onTap: () => categoryTapped("Drinks"),
            isSelected: ("Drinks" == category),
          ),
          CategoryTile(
            title: "Hot",
            onTap: () => categoryTapped("Hot"),
            isSelected: ("Hot" == category),
          ),
          CategoryTile(
            title: "Snacks",
            onTap: () => categoryTapped("Snacks"),
            isSelected: "Snacks" == category,
          )
        ],
      ),
    );
  }

  Widget _buildMealList(BuildContext context, List<Meal> menu) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: GridView.builder(
          controller: scrollController,
          itemCount: menu.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.8),
          itemBuilder: (context, index) {
            return MealItem(
                meal: menu[index],
                onTap: () => showMealInfoDialog(context, meal: menu[index]));
          },
        ));
  }
}
