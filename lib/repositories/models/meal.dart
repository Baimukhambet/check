import 'package:equatable/equatable.dart';

class Meal extends Equatable {
  final String id;
  final String name;
  final double price;
  // final String category;
  final List<String> imageUrls;

  const Meal(
      {required this.id,
      required this.name,
      required this.price,
      required this.imageUrls});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      name: json['name'],
      price: double.parse(json['price']),
      // description: json['description'],
      imageUrls: List<String>.from(json['imageUrls']),
    );
  }

  @override
  List<Object?> get props => [id, name];

  @override
  String toString() {
    // TODO: implement toString
    return '$name - $price';
  }
}
