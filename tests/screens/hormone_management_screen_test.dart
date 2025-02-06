import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bahrfitnesspro/screens/hormone_management_screen.dart';

void main() {
  testWidgets('HormoneManagementScreen displays hormone data', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HormoneManagementScreen()));

    // Verify that the hormone data is displayed
    expect(find.text('Testosterone'), findsOneWidget);
    expect(find.text('50mg'), findsOneWidget);
    expect(find.text('Weekly'), findsOneWidget);
    expect(find.text('Increased muscle mass, improved mood'), findsOneWidget);
    expect(find.text('Acne, hair loss, liver damage'), findsOneWidget);

    expect(find.text('Estrogen'), findsOneWidget);
    expect(find.text('2mg'), findsOneWidget);
    expect(find.text('Daily'), findsOneWidget);
    expect(find.text('Improved bone density, reduced hot flashes'), findsOneWidget);
    expect(find.text('Blood clots, stroke, breast cancer'), findsOneWidget);
  });
}
