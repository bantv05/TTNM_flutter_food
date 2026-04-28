import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('main app renders merged flow selector', (tester) async {
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = const Size(1440, 3200);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MainApp());
    await tester.pumpAndSettle();

    expect(find.text('Food App Flows'), findsOneWidget);
    expect(find.text('Burger'), findsOneWidget);
    expect(find.text('Cart'), findsOneWidget);
    expect(find.text('Discount'), findsOneWidget);
    expect(find.text('Rating'), findsOneWidget);
    expect(find.text('Tracking'), findsOneWidget);
    expect(find.text('Order'), findsOneWidget);

    await tester.ensureVisible(find.text('Home'));
    await tester.pumpAndSettle();
    expect(find.text('Home'), findsOneWidget);

    await tester.ensureVisible(find.text('Location'));
    await tester.pumpAndSettle();
    expect(find.text('Location'), findsOneWidget);

    await tester.ensureVisible(find.text('Profile'));
    await tester.pumpAndSettle();
    expect(find.text('Profile'), findsOneWidget);
  });
}
