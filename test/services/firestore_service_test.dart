import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/mockito.dart';
import 'package:bahrfitnesspro/services/firestore_service.dart';

class MockFirestore extends Mock implements FirebaseFirestore {}
class MockDocumentReference extends Mock implements DocumentReference {}
class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}
class MockCollectionReference extends Mock implements CollectionReference {}

void main() {
  group('FirestoreService', () {
    MockFirestore mockFirestore;
    FirestoreService firestoreService;

    setUp(() {
      mockFirestore = MockFirestore();
      firestoreService = FirestoreService();
    });

    test('addUser adds a new user to Firestore', () async {
      final mockDocumentReference = MockDocumentReference();
      when(mockFirestore.collection('users').doc(any)).thenReturn(mockDocumentReference);
      when(mockDocumentReference.set(any)).thenAnswer((_) async => null);

      await firestoreService.addUser('testUid', {'name': 'Test User'});

      verify(mockFirestore.collection('users').doc('testUid').set({'name': 'Test User'})).called(1);
    });

    test('getUser retrieves user data from Firestore', () async {
      final mockDocumentSnapshot = MockDocumentSnapshot();
      when(mockFirestore.collection('users').doc(any)).thenReturn(MockDocumentReference());
      when(mockFirestore.collection('users').doc(any).get()).thenAnswer((_) async => mockDocumentSnapshot);

      final result = await firestoreService.getUser('testUid');

      expect(result, isNotNull);
      expect(result, isInstanceOf<DocumentSnapshot>());
    });

    test('updateUser updates user data in Firestore', () async {
      final mockDocumentReference = MockDocumentReference();
      when(mockFirestore.collection('users').doc(any)).thenReturn(mockDocumentReference);
      when(mockDocumentReference.update(any)).thenAnswer((_) async => null);

      await firestoreService.updateUser('testUid', {'name': 'Updated User'});

      verify(mockFirestore.collection('users').doc('testUid').update({'name': 'Updated User'})).called(1);
    });

    test('deleteUser deletes user from Firestore', () async {
      final mockDocumentReference = MockDocumentReference();
      when(mockFirestore.collection('users').doc(any)).thenReturn(mockDocumentReference);
      when(mockDocumentReference.delete()).thenAnswer((_) async => null);

      await firestoreService.deleteUser('testUid');

      verify(mockFirestore.collection('users').doc('testUid').delete()).called(1);
    });
  });
}
