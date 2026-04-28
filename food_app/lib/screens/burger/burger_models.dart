import 'package:flutter/material.dart';

@immutable
class BurgerItem {
  const BurgerItem({
    required this.name,
    required this.subtitle,
    required this.description,
    required this.price,
    required this.rating,
    required this.deliveryTime,
    required this.calories,
    required this.accent,
  });

  final String name;
  final String subtitle;
  final String description;
  final double price;
  final double rating;
  final String deliveryTime;
  final int calories;
  final Color accent;
}

@immutable
class BurgerCategory {
  const BurgerCategory({
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;
}

@immutable
class OrderStep {
  const OrderStep({
    required this.label,
    required this.time,
    this.done = false,
    this.active = false,
  });

  final String label;
  final String time;
  final bool done;
  final bool active;
}
