part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

final class CartAddedProduct extends CartEvent {
  Meal meal;
  CartAddedProduct({required this.meal});
}

final class CartRemovedProduct extends CartEvent {
  Meal meal;
  CartRemovedProduct({required this.meal});
}
