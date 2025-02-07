import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';
import 'package:bahrfitnesspro/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockUserCredential extends Mock implements UserCredential {}
class MockUser extends Mock implements User {}

void main() {
  group('LoginScreen', () {
    MockFirebaseAuth mockFirebaseAuth;
    LoginScreen loginScreen;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      loginScreen = LoginScreen();
    });

    testWidgets('displays email and password fields', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: loginScreen));

      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.text('Enter your email'), findsOneWidget);
      expect(find.text('Enter your password'), findsOneWidget);
    });

    testWidgets('displays login button', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: loginScreen));

      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
    });

    testWidgets('calls signInWithEmailAndPassword on login button press', (WidgetTester tester) async {
      final mockUserCredential = MockUserCredential();
      final mockUser = MockUser();
      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockFirebaseAuth.signInWithEmailAndPassword(email: anyNamed('email'), password: anyNamed('password')))
          .thenAnswer((_) async => mockUserCredential);

      await tester.pumpWidget(MaterialApp(home: loginScreen));

      await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
      await tester.enterText(find.byType(TextField).at(1), 'password123');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      verify(mockFirebaseAuth.signInWithEmailAndPassword(email: 'test@example.com', password: 'password123')).called(1);
    });

    testWidgets('navigates to home screen on successful login', (WidgetTester tester) async {
      final mockUserCredential = MockUserCredential();
      final mockUser = MockUser();
      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockFirebaseAuth.signInWithEmailAndPassword(email: anyNamed('email'), password: anyNamed('password')))
          .thenAnswer((_) async => mockUserCredential);

      await tester.pumpWidget(MaterialApp(home: loginScreen));

      await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
      await tester.enterText(find.byType(TextField).at(1), 'password123');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.text('BahrFitnessPRO Home'), findsOneWidget);
    });

    testWidgets('displays error message on login failure', (WidgetTester tester) async {
      when(mockFirebaseAuth.signInWithEmailAndPassword(email: anyNamed('email'), password: anyNamed('password')))
          .thenThrow(FirebaseAuthException(code: 'user-not-found'));

      await tester.pumpWidget(MaterialApp(home: loginScreen));

      await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
      await tester.enterText(find.byType(TextField).at(1), 'password123');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text('user-not-found'), findsOneWidget);
    });
  });
}
