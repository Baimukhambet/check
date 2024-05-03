import 'package:go_router/go_router.dart';
import 'package:tabletap/features/home/home_screen.dart';
import 'package:tabletap/features/restaurant/restaurant_screen.dart';

final GoRouter router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: '/',
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: '/restaurant',
    name: '/restaurant',
    builder: (context, state) => RestaurantScreen(),
  ),
]);
