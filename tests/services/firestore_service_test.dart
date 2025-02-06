import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bahrfitnesspro/services/firestore_service.dart';

class MockFirestore extends Mock implements FirebaseFirestore {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

void main() {
  group('FirestoreService', () {
    MockFirestore mockFirestore;
    FirestoreService firestoreService;

    setUp(() {
      mockFirestore = MockFirestore();
      firestoreService = FirestoreService();
    });

    test('addUser adds user to Firestore', () async {
      final mockCollectionReference = MockCollectionReference();
      final mockDocumentReference = MockDocumentReference();
      when(mockFirestore.collection('users')).thenReturn(mockCollectionReference);
      when(mockCollectionReference.doc('testUserId')).thenReturn(mockDocumentReference);
      when(mockDocumentReference.set(any)).thenAnswer((_) async => null);

      await firestoreService.addUser('testUserId', {'key': 'value'});

      verify(mockDocumentReference.set({'key': 'value'})).called(1);
    });

    test('getUser returns correct user data', () async {
      final mockDocumentSnapshot = MockDocumentSnapshot();
      when(mockFirestore.collection('users').doc('testUserId').get())
          .thenAnswer((_) async => mockDocumentSnapshot);
      when(mockDocumentSnapshot.data()).thenReturn({'key': 'value'});

      final userData = await firestoreService.getUser('testUserId');

      expect(userData, isNotNull);
      expect(userData.data(), {'key': 'value'});
    });

    test('updateUser updates user data in Firestore', () async {
      final mockCollectionReference = MockCollectionReference();
      final mockDocumentReference = MockDocumentReference();
      when(mockFirestore.collection('users')).thenReturn(mockCollectionReference);
      when(mockCollectionReference.doc('testUserId')).thenReturn(mockDocumentReference);
      when(mockDocumentReference.update(any)).thenAnswer((_) async => null);

      await firestoreService.updateUser('testUserId', {'key': 'value'});

      verify(mockDocumentReference.update({'key': 'value'})).called(1);
    });

    test('deleteUser deletes user from Firestore', () async {
      final mockCollectionReference = MockCollectionReference();
      final mockDocumentReference = MockDocumentReference();
      when(mockFirestore.collection('users')).thenReturn(mockCollectionReference);
      when(mockCollectionReference.doc('testUserId')).thenReturn(mockDocumentReference);
      when(mockDocumentReference.delete()).thenAnswer((_) async => null);

      await firestoreService.deleteUser('testUserId');

      verify(mockDocumentReference.delete()).called(1);
    });
  });
}
