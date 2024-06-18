import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabletap/repositories/menu_repository.dart';
import 'package:tabletap/repositories/models/meal.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final MenuRepository menuRepository = MenuRepository();

  OrderBloc() : super(OrderInitial()) {
    // on<OrderChangedCategory>(_orderChangedCategory);
  }
  // void _orderChangedCategory(OrderChangedCategory event, Emitter emit) async {
  //   emit(OrderLoading());
  //   try {
  //     final menu = await menuRepository.getMenuByCategory(event.category);
  //     emit(OrderLoaded(menu: menu, category: event.category));
  //   } catch (e) {
  //     emit(OrderFail(e.toString()));
  //   }
  // }

  @override
  void onTransition(Transition<OrderEvent, OrderState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
    debugPrint(transition.currentState.toString());
    debugPrint(transition.nextState.toString());
  }
}
