import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
            color: Colors.blueGrey[600],
            borderRadius: BorderRadius.circular(16)),
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 0),
        child: Center(child: Text(title)));
  }
}
