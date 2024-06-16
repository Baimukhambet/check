import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tabletap/repositories/models/meal.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartAddedProduct>((event, emit) {
      _cartAddedProduct(event, emit);
    });
    on<CartRemovedProduct>((event, emit) => _cartRemovedProduct(event, emit));
  }

  void _cartAddedProduct(CartAddedProduct event, Emitter emit) {
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final updatedCart = Map<Meal, int>.from(currentState.meals);
      if (updatedCart.containsKey(event.meal)) {
        updatedCart[event.meal] = updatedCart[event.meal]! + 1;
      } else {
        updatedCart[event.meal] = 1;
      }
      emit(CartLoaded(updatedCart));
    } else {
      emit(CartLoaded({event.meal: 1}));
    }
  }

  void _cartRemovedProduct(CartRemovedProduct event, Emitter emit) {
    final currentState = state as CartLoaded;
    final updatedCart = Map<Meal, int>.from(currentState.meals);
    if (updatedCart[event.meal]! > 1) {
      updatedCart[event.meal] = updatedCart[event.meal]! - 1;
    } else {
      updatedCart.remove(event.meal);
    }

    if (updatedCart.isEmpty) {
      emit(CartInitial());
    } else {
      emit(CartLoaded(updatedCart));
    }
  }
}
