import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tabletap/extensions/extensions.dart';
import 'package:tabletap/features/cart/bloc/cart_bloc.dart';
import 'package:tabletap/features/restaurant/bloc/order_bloc.dart';
import 'package:tabletap/features/restaurant/widgets/meal_dialogue.dart';
import 'package:tabletap/features/restaurant/widgets/new_meal_item.dart';
import 'package:tabletap/repositories/menu_repository.dart';
import 'package:tabletap/repositories/models/models.dart';
import 'package:tabletap/repositories/models/restaurant.dart';
import 'package:tabletap/repositories/services/rkeeper_service.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  final ScrollController scrollController = ScrollController();

  void showMealInfoDialog(BuildContext context, {required Meal meal}) {
    showDialog(
      context: context,
      builder: (context) {
        return MealDialogue(meal: meal);
      },
    );
  }

  final cartBloc = CartBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMenu();
  }

  void loadMenu() async {
    menu = await MenuRepository().getMenuRkeeper();
    // debugPrint(testMenu.toString());
    // menu = await MenuRepository().getMenu();
    setState(() {
      // cartBloc.add(CartAddedProduct(
      //     meal: Meal(
      //         category: "s",
      //         name: "test",
      //         id: 1,
      //         imageUrl: "url",
      //         price: 10.0)));
    });
  }

  List<Meal> menu = [];

  final OrderBloc orderBloc = OrderBloc();

  void categoryTapped(String category) {
    orderBloc.add(OrderChangedCategory(category: category));
  }

  final rkeeper_service = RkeeperService.shared;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildRestaurantCard(context, size),
          12.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildMenu(context, size, theme),
          )
        ],
      ),
      floatingActionButton: BlocBuilder<CartBloc, CartState>(
        bloc: cartBloc,
        builder: (context, state) {
          switch (state) {
            case CartLoaded():
              return InkWell(
                onTap: () async {
                  // final response = await rkeeper_service.getMenu();
                  // final paymentResponse =
                  //     await PaymentService.shared.makePayment();
                  // debugPrint(response.body);
                  // debugPrint(paymentResponse.body);

                  context.push('/${widget.restaurant.name}/payment');
                },
                child: Container(
                    width: double.infinity,
                    height: 60,
                    color: Colors.black,
                    child: Center(
                        child: Text("Перейти к оплате \$${state.totalAmount}",
                            style: theme.textTheme.headlineLarge))),
              );
            default:
              return Container();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildRestaurantCard(BuildContext context, Size size) {
    final theme = Theme.of(context);
    return SizedBox(
        height: size.height * 0.3,
        child: Stack(
          // fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Image.network(
                widget.restaurant.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                color: Colors.black
                    .withOpacity(0.3), // Semi-transparent black overlay
              ),
            ),
            Positioned(
                left: 4,
                top: 44,
                child: IconButton(
                  icon: const Icon(Icons.arrow_circle_left,
                      color: Colors.white, size: 44),
                  onPressed: () {
                    context.go('/');
                    // context.pop();
                  },
                )),
            Positioned(
              left: 16,
              bottom: 28,
              child: Text(
                widget.restaurant.name,
                style: theme.textTheme.titleLarge,
              ),
            )
          ],
        ));
  }

  Widget _buildMenu(BuildContext context, Size size, ThemeData theme) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Menu",
          style: theme.textTheme.displayLarge,
        ),
        const SizedBox(height: 12),
        BlocBuilder(
          bloc: cartBloc,
          builder: (context, state) {
            if (state is CartLoaded) {
              return Column(
                children: [
                  ...menu.map((e) {
                    final qty =
                        state.meals.containsKey(e) ? state.meals[e]! : 0;
                    return NewMealItem(
                        meal: e,
                        onAdd: () => cartBloc.add(CartAddedProduct(meal: e)),
                        onRemove: () =>
                            cartBloc.add(CartRemovedProduct(meal: e)),
                        qty: qty);
                  })
                ],
              );
            } else {
              debugPrint("building meal item...");
              return Column(
                children: [
                  ...menu.map((e) {
                    return NewMealItem(
                        meal: e,
                        onAdd: () => cartBloc.add(CartAddedProduct(meal: e)),
                        onRemove: () =>
                            cartBloc.add(CartRemovedProduct(meal: e)),
                        qty: 0);
                  })
                ],
              );
            }
          },
        ),
        // ...menu.map((e) => NewMealItem(meal: e, onAdd: () {}, onRemove: () {}))
        // Expanded(
        //   child: BlocBuilder<CartBloc, CartState>(
        //     bloc: cartBloc,
        //     builder: (context, state) {
        //       if (state is CartLoaded) {
        //         return ListView.separated(
        //             padding: EdgeInsets.zero,
        //             separatorBuilder: (context, index) => Divider(),
        //             itemCount: menu.length,
        //             itemBuilder: (context, index) {
        //               final qty = state.meals.containsKey(menu[index])
        //                   ? state.meals[menu[index]]!
        //                   : 0;
        //               return NewMealItem(
        //                   meal: menu[index],
        //                   onAdd: () =>
        //                       cartBloc.add(CartAddedProduct(meal: menu[index])),
        //                   onRemove: () => cartBloc
        //                       .add(CartRemovedProduct(meal: menu[index])),
        //                   qty: qty);
        //             });
        //       } else {
        //         debugPrint("building meal item...");
        //         return ListView.separated(
        //             padding: EdgeInsets.zero,
        //             separatorBuilder: (context, index) => Divider(),
        //             itemCount: menu.length,
        //             itemBuilder: (context, index) {
        //               return NewMealItem(
        //                 meal: menu[index],
        //                 onAdd: () =>
        //                     cartBloc.add(CartAddedProduct(meal: menu[index])),
        //                 onRemove: () =>
        //                     cartBloc.add(CartRemovedProduct(meal: menu[index])),
        //               );
        //             });
        //       }
        //     },
        //   ),
        // )
      ],
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     final GridObserverController _gridScrollController =
//         GridObserverController(controller: scrollController);

//     return Scaffold(
//         backgroundColor: Colors.grey[200],
//         appBar: AppBar(
//           backgroundColor: Colors.grey[200],
//           scrolledUnderElevation: 0,
//           title: const Text("Steak House",
//               style: const TextStyle(fontWeight: FontWeight.bold)),
//           actions: [
//             Consumer<CartRepository>(
//               builder: (context, provider, child) => Badge(
//                 alignment: Alignment.topLeft,
//                 backgroundColor: Color.fromARGB(255, 229, 30, 30),
//                 // padding: EdgeInsets.all(6),
//                 // largeSize: 40,
//                 label: Text("${context.read<CartRepository>().items.length}"),
//                 child: IconButton(
//                   onPressed: () => {context.pushNamed('/cart')},
//                   icon: const Icon(Icons.shopping_cart_outlined),
//                 ),
//               ),
//             )
//           ],
//         ),
//         body: BlocConsumer(
//           bloc: orderBloc,
//           listener: (context, state) {
//             if (state is OrderInitial) {
//               orderBloc.add(OrderChangedCategory(category: "All"));
//               debugPrint("Yes");
//             }
//           },
//           builder: (context, state) {
//             if (state is OrderFail) {
//               return Center(
//                 child: Text(state.errorMessage!),
//               );
//             } else if (state is OrderLoaded) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Column(
//                   children: [
//                     _buildCategoryList(context, state.category),
//                     Expanded(
//                         child: GridViewObserver(
//                       controller: _gridScrollController,
//                       child: _buildMealList(context, state.menu),
//                     )),
//                   ],
//                 ),
//               );
//             } else if (state is OrderInitial) {
//               orderBloc.add(OrderChangedCategory(category: 'All'));
//               return const Center(child: const CircularProgressIndicator());
//             } else {
//               return const Center(child: const CircularProgressIndicator());
//             }
//           },
//         ));
//   }

//   Widget _buildCategoryList(BuildContext context, String category) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       height: 52,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: [
//           CategoryTile(
//             title: "All",
//             onTap: () => categoryTapped("All"),
//             isSelected: ("All" == category),
//           ),
//           CategoryTile(
//             title: "Drinks",
//             onTap: () => categoryTapped("Drinks"),
//             isSelected: ("Drinks" == category),
//           ),
//           CategoryTile(
//             title: "Hot",
//             onTap: () => categoryTapped("Hot"),
//             isSelected: ("Hot" == category),
//           ),
//           CategoryTile(
//             title: "Snacks",
//             onTap: () => categoryTapped("Snacks"),
//             isSelected: "Snacks" == category,
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildMealList(BuildContext context, List<Meal> menu) {
//     return Padding(
//         padding: const EdgeInsets.only(bottom: 16),
//         child: GridView.builder(
//           controller: scrollController,
//           itemCount: menu.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, childAspectRatio: 0.8),
//           itemBuilder: (context, index) {
//             return MealItem(
//                 meal: menu[index],
//                 onTap: () => showMealInfoDialog(context, meal: menu[index]));
//           },
//         ));
//   }
// }
