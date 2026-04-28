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
import 'screens/cart/cart01.dart';
import 'screens/cart/cart02.dart';
import 'screens/discount/discount01.dart';
import 'screens/discount/discount02.dart';
import 'screens/order/order01.dart';
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
      title: 'Food App Flows',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
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
      home: const FlowSelectorScreen(),
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

class FlowSelectorScreen extends StatelessWidget {
  const FlowSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Food App Flows')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _FlowButton(
            title: 'Burger',
            subtitle: 'Burger 01 -> Burger 10',
            onTap: () => Navigator.pushNamed(context, Burger01Screen.routeName),
          ),
          _FlowButton(
            title: 'Cart',
            subtitle: 'Cart 01 -> Cart 02',
            onTap: () => Navigator.pushNamed(context, Cart01Screen.routeName),
          ),
          _FlowButton(
            title: 'Discount',
            subtitle: 'Discount 01 -> Discount 02',
            onTap: () =>
                Navigator.pushNamed(context, Discount01Screen.routeName),
          ),
          _FlowButton(
            title: 'Rating',
            subtitle: 'Rating 01 -> Rating 04',
            onTap: () => Navigator.pushNamed(context, Rating01Screen.routeName),
          ),
          _FlowButton(
            title: 'Tracking',
            subtitle: 'Tracking 01 -> Tracking 06',
            onTap: () =>
                Navigator.pushNamed(context, Tracking01Screen.routeName),
          ),
          _FlowButton(
            title: 'Order',
            subtitle: 'Order and cancel-order flow',
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const Order01Screen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FlowButton extends StatelessWidget {
  const _FlowButton({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: onTap,
        ),
      ),
    );
  }
}
