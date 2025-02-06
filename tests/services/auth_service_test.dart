import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

    test('signInWithEmailAndPassword returns user on successful sign in', () async {
      final mockUserCredential = MockUserCredential();
      final mockUser = MockUser();
      when(mockFirebaseAuth.signInWithEmailAndPassword(email: 'test@example.com', password: 'password'))
          .thenAnswer((_) async => mockUserCredential);
      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockUser.uid).thenReturn('testUid');

      final user = await authService.signInWithEmailAndPassword('test@example.com', 'password');

      expect(user, isNotNull);
      expect(user.uid, 'testUid');
    });

    test('registerWithEmailAndPassword returns user on successful registration', () async {
      final mockUserCredential = MockUserCredential();
      final mockUser = MockUser();
      when(mockFirebaseAuth.createUserWithEmailAndPassword(email: 'test@example.com', password: 'password'))
          .thenAnswer((_) async => mockUserCredential);
      when(mockUserCredential.user).thenReturn(mockUser);
      when(mockUser.uid).thenReturn('testUid');

      final user = await authService.registerWithEmailAndPassword('test@example.com', 'password');

      expect(user, isNotNull);
      expect(user.uid, 'testUid');
    });

    test('signOut signs out the user', () async {
      await authService.signOut();

      verify(mockFirebaseAuth.signOut()).called(1);
    });
  });
}
