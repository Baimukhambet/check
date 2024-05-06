import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tabletap/repositories/models/models.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onTap});

  final Meal meal;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(right: 12, top: 24, left: 12),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(boxShadow: <BoxShadow>[
            BoxShadow(
                offset: const Offset(1, 2),
                blurRadius: 2,
                color: Colors.black.withAlpha(80))
          ], color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(meal.imageUrl,
                        fit: BoxFit.cover, width: double.infinity),
                  )),
              const SizedBox(height: 14),
              Column(
                children: [
                  Text(meal.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  Text('\$' + meal.price.toStringAsFixed(2)),
                ],
              ),
              const SizedBox(height: 8)
            ],
          )),
    );
  }
}
