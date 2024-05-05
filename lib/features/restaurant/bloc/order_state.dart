part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

final class OrderLoaded extends OrderState {
  final List<Meal> menu;
  final String category;
  const OrderLoaded({required this.menu, required this.category});

  @override
  // TODO: implement props
  List<Object> get props => [menu];
}

final class OrderFail extends OrderState {
  String? errorMessage;

  OrderFail([this.errorMessage]);
}
