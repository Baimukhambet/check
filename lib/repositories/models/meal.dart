import 'package:equatable/equatable.dart';

class Meal extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final double price;
  final String category;

  const Meal(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.price,
      required this.category});

  @override
  List<Object?> get props => [id, name];
}
