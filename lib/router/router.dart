import 'package:go_router/go_router.dart';
import 'package:tabletap/features/cart/cart_screen.dart';
import 'package:tabletap/features/home/home_screen.dart';
import 'package:tabletap/features/restaurant/restaurant_screen.dart';
import 'package:tabletap/repositories/models/restaurant.dart';

final GoRouter router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: '/',
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: '/:restaurantName',
    name: '/restaurant',
    builder: (context, state) => RestaurantScreen(
      restaurant: state.extra as Restaurant,
    ),
  ),
  GoRoute(
    path: '/cart',
    name: '/cart',
    builder: (context, state) => CartScreen(),
  ),
]);
