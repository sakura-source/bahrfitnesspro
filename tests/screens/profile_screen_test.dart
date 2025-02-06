import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bahrfitnesspro/screens/profile_screen.dart';

void main() {
  group('ProfileScreen', () {
    testWidgets('displays profile form', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ProfileScreen()));

      expect(find.text('Profile'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(3));
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('validates and saves profile changes', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: ProfileScreen()));

      await tester.enterText(find.byType(TextFormField).at(0), 'My Preferences');
      await tester.enterText(find.byType(TextFormField).at(1), 'My Goals');
      await tester.enterText(find.byType(TextFormField).at(2), 'My Health Stats');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text('My Preferences'), findsOneWidget);
      expect(find.text('My Goals'), findsOneWidget);
      expect(find.text('My Health Stats'), findsOneWidget);
    });
  });
}
