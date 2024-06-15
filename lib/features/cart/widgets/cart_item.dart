import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tabletap/repositories/models/meal.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.meal}) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                offset: const Offset(1, 4),
                color: Colors.black.withAlpha(80))
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(meal.imageUrl,
                    fit: BoxFit.cover, width: 90, height: 80),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(meal.name),
                    Text('\$' + meal.price.toStringAsFixed(2)),
                  ],
                ),
              ],
            ),
            const Row(
              children: [
                Icon(Icons.remove_circle_outline),
                SizedBox(width: 8),
                Text("1"),
                SizedBox(width: 8),
                Icon(Icons.add_circle_outline)
              ],
            )
          ],
        ));
  }
}
