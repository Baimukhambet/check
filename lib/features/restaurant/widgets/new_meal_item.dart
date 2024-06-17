import 'package:flutter/material.dart';
import 'package:tabletap/repositories/models/meal.dart';

class NewMealItem extends StatelessWidget {
  const NewMealItem(
      {super.key,
      required this.meal,
      this.qty = 0,
      required this.onAdd,
      required this.onRemove});

  final Meal meal;
  final int qty;

  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        height: 100,
        // padding: EdgeInsets.only(bottom: 12),
        margin: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(meal.imageUrl,
                        width: 100, fit: BoxFit.fill)),
                const SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(meal.name, style: theme.textTheme.titleMedium),
                    Text('\$${meal.price.toStringAsFixed(2)}',
                        style: theme.textTheme.titleSmall)
                  ],
                ),
              ],
            ),
            if (qty == 0)
              GestureDetector(
                  onTap: onAdd,
                  child:
                      Icon(Icons.add_circle, size: 38, color: Colors.grey[500]))
            else
              Row(
                children: [
                  GestureDetector(
                      onTap: onRemove,
                      child: Icon(Icons.remove_circle,
                          size: 38, color: Colors.grey[500])),
                  // 6.width,
                  SizedBox(
                      width: 30,
                      child: Center(
                          child:
                              Text("$qty", style: theme.textTheme.titleSmall))),
                  // 6.width,
                  GestureDetector(
                      onTap: onAdd,
                      child: Icon(Icons.add_circle,
                          size: 38, color: Colors.grey[500])),
                ],
              )
          ],
        ));
  }
}
