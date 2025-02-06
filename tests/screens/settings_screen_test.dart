import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bahrfitnesspro/screens/settings_screen.dart';

void main() {
  group('SettingsScreen', () {
    testWidgets('displays settings options', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SettingsScreen()));

      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('App Customization'), findsOneWidget);
      expect(find.text('Dark Mode'), findsOneWidget);
      expect(find.text('Notification Preferences'), findsOneWidget);
    });

    testWidgets('toggles dark mode', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: SettingsScreen()));

      expect(find.byType(Switch), findsOneWidget);
      expect(find.byType(Switch).evaluate().single.widget, isA<Switch>().having((s) => s.value, 'value', isFalse));

      await tester.tap(find.byType(Switch));
      await tester.pump();

      expect(find.byType(Switch).evaluate().single.widget, isA<Switch>().having((s) => s.value, 'value', isTrue));
    });
  });
}
