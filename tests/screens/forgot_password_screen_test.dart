import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:bahrfitnesspro/screens/forgot_password_screen.dart';

void main() {
  testWidgets('ForgotPasswordScreen displays email input and submit button', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ForgotPasswordScreen()));

    expect(find.text('Forgot Password'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('ForgotPasswordScreen handles password recovery process', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ForgotPasswordScreen()));

    await tester.enterText(find.byType(TextField), 'test@example.com');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Add your expectations for the password recovery process here
  });
}
