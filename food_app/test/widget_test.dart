import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('order screen renders key content', (WidgetTester tester) async {
    await tester.pumpWidget(const FoodOrderApp());

    expect(find.text('Order #A2309'), findsOneWidget);
    expect(find.text('Your items'), findsOneWidget);
    expect(find.text('Track order'), findsOneWidget);
  });
}
