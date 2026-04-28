import 'package:flutter/material.dart';

import 'screens/cart/cart01.dart';
import 'screens/cart/cart02.dart';
import 'screens/discount/discount01.dart';
import 'screens/discount/discount02.dart';
import 'screens/rating/rating01.dart';
import 'screens/rating/rating02.dart';
import 'screens/rating/rating03.dart';
import 'screens/rating/rating04.dart';
import 'screens/tracking/tracking01.dart';
import 'screens/tracking/tracking02.dart';
import 'screens/tracking/tracking03.dart';
import 'screens/tracking/tracking04.dart';
import 'screens/tracking/tracking05.dart';
import 'screens/tracking/tracking06.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cart Screens',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF9900),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      initialRoute: Cart01Screen.routeName,
      routes: {
        Cart01Screen.routeName: (_) => const Cart01Screen(),
        Cart02Screen.routeName: (_) => const Cart02Screen(),
        Discount01Screen.routeName: (_) => const Discount01Screen(),
        Discount02Screen.routeName: (_) => const Discount02Screen(),
        Rating01Screen.routeName: (_) => const Rating01Screen(),
        Rating02Screen.routeName: (_) => const Rating02Screen(),
        Rating03Screen.routeName: (_) => const Rating03Screen(),
        Rating04Screen.routeName: (_) => const Rating04Screen(),
        Tracking01Screen.routeName: (_) => const Tracking01Screen(),
        Tracking02Screen.routeName: (_) => const Tracking02Screen(),
        Tracking03Screen.routeName: (_) => const Tracking03Screen(),
        Tracking04Screen.routeName: (_) => const Tracking04Screen(),
        Tracking05Screen.routeName: (_) => const Tracking05Screen(),
        Tracking06Screen.routeName: (_) => const Tracking06Screen(),
      },
    );
  }
}
