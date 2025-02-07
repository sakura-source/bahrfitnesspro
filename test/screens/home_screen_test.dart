import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bahrfitnesspro/screens/home_screen.dart';

void main() {
  testWidgets('Home screen displays welcome message', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    expect(find.text('Welcome to BahrFitnessPRO!'), findsOneWidget);
  });

  testWidgets('Home screen has AppBar with title', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    expect(find.text('BahrFitnessPRO Home'), findsOneWidget);
  });
}
