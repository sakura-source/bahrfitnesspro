import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AIRecommendationsService {
  Interpreter _interpreter;
  GoogleGenerativeAI _generativeAI;

  AIRecommendationsService() {
    _loadModel();
    _initializeGenerativeAI();
  }

  Future<void> _loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset('model.tflite');
    } catch (e) {
      print('Error loading model: $e');
    }
  }

  Future<void> _initializeGenerativeAI() async {
    try {
      _generativeAI = GoogleGenerativeAI(apiKey: 'YOUR_API_KEY');
    } catch (e) {
      print('Error initializing Google Generative AI: $e');
    }
  }

  List<double> predict(List<double> input) {
    var output = List.filled(1 * 10, 0.0).reshape([1, 10]);
    _interpreter.run(input, output);
    return output[0];
  }

  Future<List<String>> getRecommendations(List<double> userData) async {
    var predictions = predict(userData);
    var aiRecommendations = await _fetchAIRecommendations(userData);
    return _interpretPredictions(predictions, aiRecommendations);
  }

  Future<List<String>> _fetchAIRecommendations(List<double> userData) async {
    try {
      var response = await _generativeAI.generateRecommendations(userData);
      return response.recommendations;
    } catch (e) {
      print('Error fetching AI recommendations: $e');
      return [];
    }
  }

  List<String> _interpretPredictions(List<double> predictions, List<String> aiRecommendations) {
    // Interpret the predictions and combine with AI recommendations
    // This is a placeholder implementation
    var combinedRecommendations = predictions
        .map((prediction) => 'Prediction: $prediction')
        .toList();
    combinedRecommendations.addAll(aiRecommendations);
    return combinedRecommendations;
  }
}
