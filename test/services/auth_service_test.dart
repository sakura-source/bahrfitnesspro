import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';
import 'package:bahrfitnesspro/services/auth_service.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockUserCredential extends Mock implements UserCredential {}
class MockUser extends Mock implements User {}

void main() {
  group('AuthService', () {
    MockFirebaseAuth mockFirebaseAuth;
    AuthService authService;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      authService = AuthService();
    });

    test('registerWithEmailAndPassword returns a user on successful registration', () async {
      final mockUserCredential = MockUserCredential();
      final mockUser = MockUser();
      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockFirebaseAuth.createUserWithEmailAndPassword(email: anyNamed('email'), password: anyNamed('password')))
          .thenAnswer((_) async => mockUserCredential);

      final result = await authService.registerWithEmailAndPassword('test@example.com', 'password123');

      expect(result, isNotNull);
      expect(result, isInstanceOf<User>());
    });

    test('signInWithEmailAndPassword returns a user on successful login', () async {
      final mockUserCredential = MockUserCredential();
      final mockUser = MockUser();
      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockFirebaseAuth.signInWithEmailAndPassword(email: anyNamed('email'), password: anyNamed('password')))
          .thenAnswer((_) async => mockUserCredential);

      final result = await authService.signInWithEmailAndPassword('test@example.com', 'password123');

      expect(result, isNotNull);
      expect(result, isInstanceOf<User>());
    });

    test('signOut signs out the user', () async {
      when(mockFirebaseAuth.signOut()).thenAnswer((_) async => null);

      await authService.signOut();

      verify(mockFirebaseAuth.signOut()).called(1);
    });
  });
}
