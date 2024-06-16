part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoaded extends CartState {
  Map<Meal, int> meals;
  double totalAmount;

  CartLoaded(this.meals)
      : totalAmount =
            meals.keys.fold(0, (sum, meal) => sum + meal.price * meals[meal]!);

  @override
  // TODO: implement props
  List<Object> get props => [meals];
}
