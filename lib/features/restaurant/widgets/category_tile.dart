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
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
              color: isSelected ? Colors.blueGrey[600] : Colors.white,
              borderRadius: BorderRadius.circular(16)),
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 0),
          child: Center(child: Text(title))),
    );
  }
}
