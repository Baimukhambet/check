import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabletap/features/home/home_screen.dart';
import 'package:tabletap/repositories/cart_repository.dart';
import 'package:tabletap/repositories/menu_repository.dart';
import 'package:tabletap/router/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartRepository()),
        ChangeNotifierProvider(create: (context) => MenuRepository()),
      ],
      builder: (context, child) => MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
