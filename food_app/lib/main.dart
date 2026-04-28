import 'package:flutter/material.dart';

<<<<<<< HEAD
<<<<<<< HEAD
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
=======
import 'screens/burger/burger01.dart';
import 'screens/burger/burger02.dart';
import 'screens/burger/burger03.dart';
import 'screens/burger/burger04.dart';
import 'screens/burger/burger05.dart';
import 'screens/burger/burger06.dart';
import 'screens/burger/burger07.dart';
import 'screens/burger/burger08.dart';
import 'screens/burger/burger09.dart';
import 'screens/burger/burger10.dart';
import 'screens/burger/burger_widgets.dart';

void main() {
  runApp(const BurgerApp());
}

class BurgerApp extends StatelessWidget {
  const BurgerApp({super.key});
>>>>>>> origin/anh-branch
=======
import 'screens/order/order01.dart';

void main() {
  runApp(const FoodOrderApp());
}

class FoodOrderApp extends StatelessWidget {
  const FoodOrderApp({super.key});
>>>>>>> origin/hong-branch

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFF7F3EE);
    const accentColor = Color(0xFFDA6A35);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
<<<<<<< HEAD
      title: 'Cart Screens',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF9900),
          brightness: Brightness.light,
=======
      title: 'Burger Flow',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: BurgerColors.canvas,
        colorScheme: ColorScheme.fromSeed(
          seedColor: BurgerColors.primary,
          primary: BurgerColors.primary,
          secondary: BurgerColors.sun,
          surface: Colors.white,
        ),
        textTheme: ThemeData.light().textTheme.apply(
              bodyColor: BurgerColors.ink,
              displayColor: BurgerColors.ink,
            ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: BurgerColors.line),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: BurgerColors.primary,
              width: 1.4,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 16,
          ),
>>>>>>> origin/anh-branch
        ),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
<<<<<<< HEAD
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
=======
      initialRoute: Burger01Screen.routeName,
      routes: {
        Burger01Screen.routeName: (_) => const Burger01Screen(),
        Burger02Screen.routeName: (_) => const Burger02Screen(),
        Burger03Screen.routeName: (_) => const Burger03Screen(),
        Burger04Screen.routeName: (_) => const Burger04Screen(),
        Burger05Screen.routeName: (_) => const Burger05Screen(),
        Burger06Screen.routeName: (_) => const Burger06Screen(),
        Burger07Screen.routeName: (_) => const Burger07Screen(),
        Burger08Screen.routeName: (_) => const Burger08Screen(),
        Burger09Screen.routeName: (_) => const Burger09Screen(),
        Burger10Screen.routeName: (_) => const Burger10Screen(),
>>>>>>> origin/anh-branch
      },
=======
      title: 'Food Order',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: accentColor,
          brightness: Brightness.light,
          surface: Colors.white,
        ),
        textTheme: ThemeData.light().textTheme.apply(
              bodyColor: const Color(0xFF241B16),
              displayColor: const Color(0xFF241B16),
            ),
      ),
      home: const Order01Screen(),
>>>>>>> origin/hong-branch
    );
  }
}
