import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bahrfitnesspro/services/analytics_service.dart';

class MockFirestore extends Mock implements FirebaseFirestore {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

void main() {
  group('AnalyticsService', () {
    MockFirestore mockFirestore;
    AnalyticsService analyticsService;

    setUp(() {
      mockFirestore = MockFirestore();
      analyticsService = AnalyticsService();
    });

    test('trackUserActivity adds activity to Firestore', () async {
      final mockCollectionReference = MockCollectionReference();
      final mockDocumentReference = MockDocumentReference();
      when(mockFirestore.collection('analytics')).thenReturn(mockCollectionReference);
      when(mockCollectionReference.add(any)).thenAnswer((_) async => mockDocumentReference);

      await analyticsService.trackUserActivity('testUserId', 'testActivity', {'key': 'value'});

      verify(mockCollectionReference.add({
        'userId': 'testUserId',
        'activityType': 'testActivity',
        'activityData': {'key': 'value'},
        'timestamp': FieldValue.serverTimestamp(),
      })).called(1);
    });

    test('generateUserProgressReport returns correct report', () async {
      final mockQuerySnapshot = MockQuerySnapshot();
      final mockDocumentSnapshot = MockDocumentSnapshot();
      when(mockFirestore.collection('analytics').where('userId', isEqualTo: 'testUserId').orderBy('timestamp', descending: true).get())
          .thenAnswer((_) async => mockQuerySnapshot);
      when(mockQuerySnapshot.docs).thenReturn([mockDocumentSnapshot]);
      when(mockDocumentSnapshot['activityType']).thenReturn('testActivity');
      when(mockDocumentSnapshot['activityData']).thenReturn({'key': 'value'});

      final report = await analyticsService.generateUserProgressReport('testUserId');

      expect(report, isNotNull);
      expect(report['testActivity'], isNotNull);
      expect(report['testActivity'].length, 1);
      expect(report['testActivity'][0], {'key': 'value'});
    });
  });
}
