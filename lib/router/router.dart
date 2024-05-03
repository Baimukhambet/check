import 'package:go_router/go_router.dart';
import 'package:tabletap/features/home/home_screen.dart';
import 'package:tabletap/features/restaurant/restaurant_screen.dart';

final GoRouter router = GoRouter(initialLocation: '/home', routes: [
  GoRoute(
    path: '/home',
    name: '/home',
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: '/home/restaurant',
    name: '/home/restaurant',
    builder: (context, state) => RestaurantScreen(),
  ),
]);
