import 'package:flutter_test/flutter_test.dart';
import 'package:bahrfitnesspro/services/ai_recommendations_service.dart';

void main() {
  group('AIRecommendationsService', () {
    AIRecommendationsService aiRecommendationsService;

    setUp(() {
      aiRecommendationsService = AIRecommendationsService();
    });

    test('should load model successfully', () async {
      await aiRecommendationsService._loadModel();
      expect(aiRecommendationsService._interpreter, isNotNull);
    });

    test('should initialize Google Generative AI successfully', () async {
      await aiRecommendationsService._initializeGenerativeAI();
      expect(aiRecommendationsService._generativeAI, isNotNull);
    });

    test('should make predictions using TensorFlow model', () {
      List<double> input = [1.0, 2.0, 3.0, 4.0, 5.0];
      List<double> output = aiRecommendationsService.predict(input);
      expect(output, isNotEmpty);
    });

    test('should fetch AI recommendations successfully', () async {
      List<double> userData = [1.0, 2.0, 3.0, 4.0, 5.0];
      List<String> recommendations = await aiRecommendationsService.getRecommendations(userData);
      expect(recommendations, isNotEmpty);
    });

    test('should interpret predictions and AI recommendations', () {
      List<double> predictions = [0.1, 0.2, 0.3, 0.4, 0.5];
      List<String> aiRecommendations = ['Recommendation 1', 'Recommendation 2'];
      List<String> combinedRecommendations = aiRecommendationsService._interpretPredictions(predictions, aiRecommendations);
      expect(combinedRecommendations, contains('Prediction: 0.1'));
      expect(combinedRecommendations, contains('Recommendation 1'));
    });
  });
}
