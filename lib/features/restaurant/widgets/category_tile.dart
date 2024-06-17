import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile(
      {super.key,
      required this.title,
      required this.onTap,
      required this.isSelected});

  final String title;
  VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              color:
                  isSelected ? const Color.fromARGB(255, 229, 82, 52) : Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(1, 2),
                    blurRadius: 2,
                    color: Colors.black.withAlpha(80))
              ]),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
          child: Center(child: Text(title))),
    );
  }
}
