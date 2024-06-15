import 'package:flutter/cupertino.dart';

class FoodTypeTile extends StatelessWidget {
  const FoodTypeTile({Key? key, required this.imageUrl, required this.title})
      : super(key: key);

  final String imageUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(imageUrl,
                width: 60, height: 60, fit: BoxFit.fill)),
        Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14))
      ],
    ));
  }
}
