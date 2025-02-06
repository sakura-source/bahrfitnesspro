import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bahrfitnesspro/screens/mental_wellness_screen.dart';

void main() {
  testWidgets('MentalWellnessScreen navigation test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MentalWellnessScreen()));

    // Verify that the MentalWellnessScreen is displayed
    expect(find.text('Mental Wellness'), findsOneWidget);
    expect(find.text('Stress and Mood Tracking'), findsOneWidget);
    expect(find.text('Guided Meditation and Relaxation'), findsOneWidget);

    // Test navigation to stress tracking screen
    await tester.tap(find.text('Track Now'));
    await tester.pumpAndSettle();
    // Add verification for navigation to stress tracking screen

    // Test navigation to guided meditation screen
    await tester.tap(find.text('Listen Now'));
    await tester.pumpAndSettle();
    // Add verification for navigation to guided meditation screen
  });
}
