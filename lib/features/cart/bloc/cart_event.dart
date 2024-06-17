part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

final class CartAddedProduct extends CartEvent {
  final Meal meal;
  const CartAddedProduct({required this.meal});
}

final class CartRemovedProduct extends CartEvent {
  final Meal meal;
  const CartRemovedProduct({required this.meal});
}
