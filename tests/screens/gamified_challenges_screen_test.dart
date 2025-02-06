import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bahrfitnesspro/screens/gamified_challenges_screen.dart';

void main() {
  testWidgets('GamifiedChallengesScreen has a title and buttons', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: GamifiedChallengesScreen()));

    // Verify the title
    expect(find.text('Gamified Challenges'), findsOneWidget);

    // Verify the buttons
    expect(find.text('View Leaderboard'), findsOneWidget);
    expect(find.text('Create Challenge'), findsOneWidget);
  });

  testWidgets('GamifiedChallengesScreen navigates to leaderboard screen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: GamifiedChallengesScreen(),
      routes: {
        '/leaderboard': (context) => Scaffold(body: Text('Leaderboard Screen')),
      },
    ));

    // Tap the 'View Leaderboard' button
    await tester.tap(find.text('View Leaderboard'));
    await tester.pumpAndSettle();

    // Verify navigation to leaderboard screen
    expect(find.text('Leaderboard Screen'), findsOneWidget);
  });

  testWidgets('GamifiedChallengesScreen navigates to create challenge screen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: GamifiedChallengesScreen(),
      routes: {
        '/create_challenge': (context) => Scaffold(body: Text('Create Challenge Screen')),
      },
    ));

    // Tap the 'Create Challenge' button
    await tester.tap(find.text('Create Challenge'));
    await tester.pumpAndSettle();

    // Verify navigation to create challenge screen
    expect(find.text('Create Challenge Screen'), findsOneWidget);
  });
}
