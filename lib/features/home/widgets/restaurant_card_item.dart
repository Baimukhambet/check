import 'package:flutter/material.dart';
import 'package:tabletap/repositories/models/restaurant.dart';

class RestaurantCardItem extends StatelessWidget {
  const RestaurantCardItem(
      {super.key,
      // required this.name,
      // required this.imageUrl,
      required this.restaurant});

  // final String name;
  // final String imageUrl;

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 24),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      width: size.width,
      height: 180,
      child: Stack(
        fit: StackFit.expand,
        // alignment: Alignment.bottomLeft,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(restaurant.imageUrl, fit: BoxFit.fitWidth)),
          Positioned.fill(
            child: Opacity(
                opacity: 0.5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                )),
          ),
          Positioned(
              left: 16,
              bottom: 16,
              child: Text(restaurant.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24)))
        ],
      ),
    );
  }
}
