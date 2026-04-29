import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/batdau.dart';

void main() {
  testWidgets('main app starts at BatDau intro flow', (tester) async {
    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = const Size(1440, 3200);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MainApp());
    await tester.pump();

    expect(find.byType(BatDauScreen), findsOneWidget);
  });
}
