import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/Home/Home01.dart';

void main() {
  testWidgets('FoodApp renders Home01', (WidgetTester tester) async {
    await tester.pumpWidget(const FoodApp());
    await tester.pumpAndSettle();

    expect(find.byType(Home01), findsOneWidget);
  });
}
