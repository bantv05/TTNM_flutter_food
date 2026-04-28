<<<<<<< HEAD
import 'package:flutter/material.dart';
=======
>>>>>>> origin/hong-branch
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/screens/cart/cart02.dart';
import 'package:flutter_application_1/screens/discount/discount01.dart';
import 'package:flutter_application_1/screens/rating/rating01.dart';
import 'package:flutter_application_1/screens/tracking/tracking01.dart';
import 'package:flutter_application_1/screens/tracking/tracking02.dart';
import 'package:flutter_application_1/screens/tracking/tracking03.dart';
import 'package:flutter_application_1/screens/tracking/tracking04.dart';
import 'package:flutter_application_1/screens/tracking/tracking05.dart';
import 'package:flutter_application_1/screens/tracking/tracking06.dart';

void main() {
<<<<<<< HEAD
  group('Cart02 flow', () {
    testWidgets(
      'applies a promotion in discount screen and updates cart totals',
      (tester) async {
        await tester.pumpWidget(_buildTestApp());
        await tester.pumpAndSettle();

        expect(find.byType(Cart02Screen), findsOneWidget);
        expect(_amountFor(tester, 'cart-discount-value'), 0);
        expect(_amountFor(tester, 'cart-total-value'), 70000);
        expect(_amountFor(tester, 'cart-bottom-total'), 70000);

        await tester.tap(find.byKey(const Key('cart-discount-card')));
        await tester.pumpAndSettle();

        expect(find.byType(Discount01Screen), findsOneWidget);

        await tester.tap(find.byKey(const ValueKey('promotion-card-order_20')));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(const Key('discount-apply-button')));
        await tester.pumpAndSettle();

        expect(find.byType(Cart02Screen), findsOneWidget);
        expect(find.text('20%'), findsOneWidget);
        expect(_amountFor(tester, 'cart-discount-value'), 14000);
        expect(_amountFor(tester, 'cart-total-value'), 56000);
        expect(_amountFor(tester, 'cart-bottom-total'), 56000);
      },
    );

    testWidgets(
      'moves from tracking01 to tracking06 every five seconds after placing an order',
      (tester) async {
        await tester.pumpWidget(_buildTestApp());
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(const Key('cart-place-order-button')));
        await tester.pumpAndSettle();

        expect(find.byType(Tracking01Screen), findsOneWidget);

        await _advanceAndExpect<Tracking02Screen>(tester);
        await _advanceAndExpect<Tracking03Screen>(tester);
        await _advanceAndExpect<Tracking04Screen>(tester);
        await _advanceAndExpect<Tracking05Screen>(tester);
        await _advanceAndExpect<Tracking06Screen>(tester);
      },
    );
=======
  testWidgets('order screen renders key content', (WidgetTester tester) async {
    await tester.pumpWidget(const FoodOrderApp());

    expect(find.text('Order #A2309'), findsOneWidget);
    expect(find.text('Your items'), findsOneWidget);
    expect(find.text('Track order'), findsOneWidget);
>>>>>>> origin/hong-branch
  });
}

Widget _buildTestApp() {
  return MaterialApp(
    home: const Cart02Screen(),
    routes: {
      Cart02Screen.routeName: (_) => const Cart02Screen(),
      Tracking01Screen.routeName: (_) => const Tracking01Screen(),
      Tracking02Screen.routeName: (_) => const Tracking02Screen(),
      Tracking03Screen.routeName: (_) => const Tracking03Screen(),
      Tracking04Screen.routeName: (_) => const Tracking04Screen(),
      Tracking05Screen.routeName: (_) => const Tracking05Screen(),
      Tracking06Screen.routeName: (_) => const Tracking06Screen(),
      Rating01Screen.routeName: (_) => const Rating01Screen(),
    },
  );
}

Future<void> _advanceAndExpect<T extends Widget>(WidgetTester tester) async {
  await tester.pump(const Duration(seconds: 5));
  await tester.pumpAndSettle();
  expect(find.byType(T), findsOneWidget);
}

int _amountFor(WidgetTester tester, String keyValue) {
  final widget = tester.widget<Text>(find.byKey(Key(keyValue)));
  final text = widget.data ?? widget.textSpan?.toPlainText() ?? '';
  final digits = text.replaceAll(RegExp(r'[^0-9]'), '');
  return digits.isEmpty ? 0 : int.parse(digits);
}
