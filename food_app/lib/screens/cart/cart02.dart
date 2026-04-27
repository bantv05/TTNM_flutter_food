import 'package:flutter/material.dart';

import '../discount/discount01.dart';
import '../tracking/tracking01.dart';
import 'cart_screen.dart';

class Cart02Screen extends StatefulWidget {
  const Cart02Screen({super.key});

  static const routeName = '/cart/cart02';

  @override
  State<Cart02Screen> createState() => _Cart02ScreenState();
}

class _Cart02ScreenState extends State<Cart02Screen> {
  Set<String> _selectedPromotionIds = <String>{};

  @override
  Widget build(BuildContext context) {
    return CartScreen(
      variant: CartVariant.completedInfo,
      initialSelectedPromotionIds: _selectedPromotionIds,
      onOpenDiscounts: (currentSelection) async {
        final result = await Navigator.of(context).push<Set<String>>(
          MaterialPageRoute<Set<String>>(
            builder: (_) =>
                Discount01Screen(initialSelectedPromotionIds: currentSelection),
          ),
        );

        if (result != null) {
          setState(() {
            _selectedPromotionIds = result;
          });
        }
        return result;
      },
      onPlaceOrder: () {
        Navigator.of(context).pushNamed(Tracking01Screen.routeName);
      },
    );
  }
}
