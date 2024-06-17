part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

final class OrderChangedCategory extends OrderEvent {
  final String category;

  const OrderChangedCategory({required this.category});

  @override
  // TODO: implement props
  List<Object> get props => [category];
}
