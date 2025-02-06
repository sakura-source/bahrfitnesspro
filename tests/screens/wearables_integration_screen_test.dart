import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:bahrfitnesspro/screens/wearables_integration_screen.dart';

void main() {
  testWidgets('WearablesIntegrationScreen displays wearable data', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: WearablesIntegrationScreen()));

    expect(find.text('Heart Rate: 0 bpm'), findsOneWidget);
    expect(find.text('Calories Burned: 0 kcal'), findsOneWidget);
  });
}
