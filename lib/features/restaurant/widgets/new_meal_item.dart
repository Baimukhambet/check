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
    debugPrint("Building meal item...");
    return Container(
        height: 100,
        // padding: EdgeInsets.only(bottom: 12),
        margin: const EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                          meal.imageUrls.isNotEmpty
                              ? meal.imageUrls.first
                              : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSN5kyGXRsJTnCvfM371Ycg8u7k9viw1gW-g&s',
                          width: 100,
                          fit: BoxFit.fill)),
                  const SizedBox(width: 24),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meal.name,
                          style: theme.textTheme.titleMedium,
                          // maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text('\$${meal.price.toStringAsFixed(2)}',
                            style: theme.textTheme.titleSmall)
                      ],
                    ),
                  ),
                ],
              ),
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
