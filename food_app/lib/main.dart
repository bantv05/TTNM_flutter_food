import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        ),
      ),
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
      },
    );
  }
}
