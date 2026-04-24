import 'package:flutter/material.dart';

import 'screens/order/order01.dart';

void main() {
  runApp(const FoodOrderApp());
}

class FoodOrderApp extends StatelessWidget {
  const FoodOrderApp({super.key});

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFF7F3EE);
    const accentColor = Color(0xFFDA6A35);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
    );
  }
}
