import 'package:flutter/material.dart';

import 'cart02.dart';
import 'cart_screen.dart';

class Cart01Screen extends StatelessWidget {
  const Cart01Screen({super.key});

  static const routeName = '/cart/cart01';

  @override
  Widget build(BuildContext context) {
    return CartScreen(
      variant: CartVariant.summaryOnly,
      onRequestCheckoutInfo: () {
        Navigator.of(context).pushNamed(Cart02Screen.routeName);
      },
      onPlaceOrder: () {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text(
                'Vui lòng hoàn tất địa chỉ và thanh toán trước khi đặt hàng.',
              ),
            ),
          );
        Navigator.of(context).pushNamed(Cart02Screen.routeName);
      },
    );
  }
}
