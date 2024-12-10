import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tabletap/features/cart/cart_screen.dart';
import 'package:tabletap/features/home/home_screen.dart';
import 'package:tabletap/features/payment/payment_screen.dart';
import 'package:tabletap/features/restaurant/restaurant_screen.dart';
import 'package:tabletap/features/user_agreement/user_agreement_screen.dart';
import 'package:tabletap/repositories/models/restaurant.dart';

final GoRouter router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: '/',
      pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          )),
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
    builder: (context, state) => const CartScreen(),
  ),
  GoRoute(
    path: '/:restaurantName/payment',
    name: '/payment',
    builder: (context, state) => const PaymentScreen(),
  ),
  GoRoute(
    path: '/user-agreement/text',
    name: '/user-agreement/text',
    builder: (context, state) => const UserAgreementScreen(),
  ),
]);
