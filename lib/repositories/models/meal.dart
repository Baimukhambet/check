import 'package:equatable/equatable.dart';

class Meal extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final double price;

  Meal(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.price});

  @override
  List<Object?> get props => [id, name, price];
}
