import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bahrfitnesspro/services/ai_recommendation_service.dart';

class MockFirestore extends Mock implements FirebaseFirestore {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

void main() {
  group('AIRecommendationService', () {
    MockFirestore mockFirestore;
    AIRecommendationService aiRecommendationService;

    setUp(() {
      mockFirestore = MockFirestore();
      aiRecommendationService = AIRecommendationService();
    });

    test('generateFitnessRecommendations returns correct recommendations', () async {
      final mockDocumentSnapshot = MockDocumentSnapshot();
      when(mockFirestore.collection('users').doc('testUserId').get())
          .thenAnswer((_) async => mockDocumentSnapshot);
      when(mockDocumentSnapshot.data()).thenReturn({
        'uid': 'testUserId',
        'email': 'test@example.com',
        'displayName': 'Test User',
        'photoUrl': 'testPhotoUrl',
      });

      final recommendations = await aiRecommendationService.generateFitnessRecommendations('testUserId');

      expect(recommendations, isNotNull);
      expect(recommendations['workoutPlan'], '3 days of strength training, 2 days of cardio');
      expect(recommendations['exerciseSuggestions'], ['Squats', 'Deadlifts', 'Bench Press']);
    });

    test('generateDietRecommendations returns correct recommendations', () async {
      final mockDocumentSnapshot = MockDocumentSnapshot();
      when(mockFirestore.collection('users').doc('testUserId').get())
          .thenAnswer((_) async => mockDocumentSnapshot);
      when(mockDocumentSnapshot.data()).thenReturn({
        'uid': 'testUserId',
        'email': 'test@example.com',
        'displayName': 'Test User',
        'photoUrl': 'testPhotoUrl',
      });

      final recommendations = await aiRecommendationService.generateDietRecommendations('testUserId');

      expect(recommendations, isNotNull);
      expect(recommendations['mealPlan'], 'High protein, moderate carbs, low fat');
      expect(recommendations['foodSuggestions'], ['Chicken breast', 'Brown rice', 'Broccoli']);
    });
  });
}
