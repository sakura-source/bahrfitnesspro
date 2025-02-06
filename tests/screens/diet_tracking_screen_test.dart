import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bahrfitnesspro/screens/diet_tracking_screen.dart';

void main() {
  testWidgets('DietTrackingScreen form validation and saving diet log', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: DietTrackingScreen()));

    // Verify that the form fields are present
    expect(find.byType(TextFormField), findsNWidgets(3));
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Enter valid data into the form fields
    await tester.enterText(find.byType(TextFormField).at(0), 'Breakfast');
    await tester.enterText(find.byType(TextFormField).at(1), '500');
    await tester.enterText(find.byType(TextFormField).at(2), 'Protein: 30g, Carbs: 50g, Fat: 20g');

    // Tap the save button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that the form is saved successfully
    expect(find.text('Breakfast'), findsOneWidget);
    expect(find.text('500'), findsOneWidget);
    expect(find.text('Protein: 30g, Carbs: 50g, Fat: 20g'), findsOneWidget);
  });
}
