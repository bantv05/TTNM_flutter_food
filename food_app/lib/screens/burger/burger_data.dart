import 'package:flutter/material.dart';

import 'burger_models.dart';
import 'burger_widgets.dart';

const List<BurgerCategory> burgerCategories = [
  BurgerCategory(label: 'Classic', icon: Icons.lunch_dining),
  BurgerCategory(label: 'Cheese', icon: Icons.egg_alt_outlined),
  BurgerCategory(label: 'Double', icon: Icons.layers_outlined),
  BurgerCategory(label: 'Veggie', icon: Icons.eco_outlined),
  BurgerCategory(label: 'Combo', icon: Icons.local_mall_outlined),
];

const List<String> burgerToppings = [
  'Cheddar',
  'Smoky bacon',
  'Pickles',
  'Onion jam',
  'Jalapeno',
];

const List<String> burgerAddresses = [
  'Office - 289 Nguyen Trai',
  'Home - 14 Pasteur Street',
  'Campus - Building B1',
];

const List<String> burgerPaymentMethods = [
  'Cash',
  'Apple Pay',
  'Momo',
];

const List<OrderStep> burgerSteps = [
  OrderStep(label: 'Order confirmed', time: '06:15 PM', done: true),
  OrderStep(label: 'Cooking in kitchen', time: '06:22 PM', done: true),
  OrderStep(label: 'Courier on the way', time: '06:34 PM', active: true),
  OrderStep(label: 'Delivered', time: 'ETA 12 min'),
];

const List<BurgerItem> burgerItems = [
  BurgerItem(
    name: 'Fire Stack',
    subtitle: 'Double smash burger',
    description: 'Two seared patties with cheddar, onion jam and house sauce.',
    price: 8.90,
    rating: 4.9,
    deliveryTime: '15 min',
    calories: 780,
    accent: BurgerColors.sun,
  ),
  BurgerItem(
    name: 'Crispy Ranch',
    subtitle: 'Chicken crunch burger',
    description: 'Crispy chicken, ranch dressing and bright slaw in a toasted bun.',
    price: 7.40,
    rating: 4.8,
    deliveryTime: '18 min',
    calories: 690,
    accent: BurgerColors.peach,
  ),
  BurgerItem(
    name: 'Green Melt',
    subtitle: 'Veggie delight',
    description: 'Plant patty, avocado cream, lettuce and tomato.',
    price: 7.10,
    rating: 4.7,
    deliveryTime: '16 min',
    calories: 520,
    accent: Color(0xFF74C69D),
  ),
  BurgerItem(
    name: 'Midnight BBQ',
    subtitle: 'Smokehouse special',
    description: 'BBQ glaze, bacon strips and caramelized onions.',
    price: 9.30,
    rating: 5.0,
    deliveryTime: '20 min',
    calories: 830,
    accent: Color(0xFF6D597A),
  ),
];
