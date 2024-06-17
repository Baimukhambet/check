import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabletap/features/cart/widgets/cart_item.dart';
import 'package:tabletap/repositories/cart_repository.dart';
import 'package:tabletap/repositories/models/meal.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ваш Заказ")),
      body: Consumer<CartRepository>(
        builder: (context, cart, child) {
          return _buildCartList(context, cart.items.keys.toList());
        },
      ),
    );
  }

  Widget _buildCartList(BuildContext context, List<Meal> cartList) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => CartItem(meal: cartList[index]),
              itemCount: cartList.length,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [Text("Всего:")],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("Оформляем"),
                    ))),
          )
        ],
      ),
    );
  }
}
