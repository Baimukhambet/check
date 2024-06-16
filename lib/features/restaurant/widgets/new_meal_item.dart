import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabletap/repositories/models/meal.dart';

class NewMealItem extends StatelessWidget {
  const NewMealItem({Key? key, required this.meal}) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        height: 100,
        // padding: EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(meal.imageUrl,
                        width: 100, fit: BoxFit.fill)),
                SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(meal.name, style: theme.textTheme.titleMedium),
                    Text('\$' + meal.price.toStringAsFixed(2),
                        style: theme.textTheme.titleSmall)
                  ],
                ),
              ],
            ),
            Icon(Icons.add_circle, size: 38, color: Colors.grey[500])
          ],
        ));
  }
}
