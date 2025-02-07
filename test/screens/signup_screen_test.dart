import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';
import 'package:bahrfitnesspro/screens/signup_screen.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockUserCredential extends Mock implements UserCredential {}
class MockUser extends Mock implements User {}

void main() {
  group('SignupScreen', () {
    MockFirebaseAuth mockFirebaseAuth;
    SignupScreen signupScreen;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      signupScreen = SignupScreen();
    });

    testWidgets('displays email and password fields', (WidgetTester tester) async {
      await tester.pumpWidget(signupScreen);

      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.text('Enter your email'), findsOneWidget);
      expect(find.text('Enter your password'), findsOneWidget);
    });

    testWidgets('displays signup button', (WidgetTester tester) async {
      await tester.pumpWidget(signupScreen);

      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Signup'), findsOneWidget);
    });

    testWidgets('registers user on signup button press', (WidgetTester tester) async {
      final mockUserCredential = MockUserCredential();
      final mockUser = MockUser();
      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockFirebaseAuth.createUserWithEmailAndPassword(email: anyNamed('email'), password: anyNamed('password')))
          .thenAnswer((_) async => mockUserCredential);

      await tester.pumpWidget(signupScreen);

      await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
      await tester.enterText(find.byType(TextField).at(1), 'password123');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      verify(mockFirebaseAuth.createUserWithEmailAndPassword(email: 'test@example.com', password: 'password123')).called(1);
    });

    testWidgets('displays error message on signup failure', (WidgetTester tester) async {
      when(mockFirebaseAuth.createUserWithEmailAndPassword(email: anyNamed('email'), password: anyNamed('password')))
          .thenThrow(FirebaseAuthException(code: 'ERROR'));

      await tester.pumpWidget(signupScreen);

      await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
      await tester.enterText(find.byType(TextField).at(1), 'password123');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text('Signup failed'), findsOneWidget);
    });
  });
}
