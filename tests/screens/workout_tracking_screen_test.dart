import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bahrfitnesspro/screens/workout_tracking_screen.dart';

void main() {
  testWidgets('WorkoutTrackingScreen form validation and saving workout log', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: WorkoutTrackingScreen()));

    // Verify that the form fields are present
    expect(find.byType(TextFormField), findsNWidgets(3));
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Enter valid data into the form fields
    await tester.enterText(find.byType(TextFormField).at(0), 'Running');
    await tester.enterText(find.byType(TextFormField).at(1), '30');
    await tester.enterText(find.byType(TextFormField).at(2), 'High');

    // Tap the save button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that the form is saved successfully
    expect(find.text('Running'), findsOneWidget);
    expect(find.text('30'), findsOneWidget);
    expect(find.text('High'), findsOneWidget);
  });
}
