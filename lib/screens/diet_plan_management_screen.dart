import 'package:flutter/material.dart';
import 'package:bahrfitnesspro/services/ai_recommendations_service.dart';

class DietPlanManagementScreen extends StatefulWidget {
  const DietPlanManagementScreen({super.key});

  @override
  _DietPlanManagementScreenState createState() =>
      _DietPlanManagementScreenState();
}

class _DietPlanManagementScreenState extends State<DietPlanManagementScreen> {
  AIRecommendationsService _aiRecommendationsService;
  List<Map<String, dynamic>> mealPlans = [];

  @override
  void initState() {
    super.initState();
    _aiRecommendationsService = AIRecommendationsService();
    _fetchAIRecommendations();
  }

  Future<void> _fetchAIRecommendations() async {
    List<String> recommendations = await _aiRecommendationsService.getRecommendations([/* user data */]);
    setState(() {
      mealPlans = _parseRecommendations(recommendations);
    });
  }

  List<Map<String, dynamic>> _parseRecommendations(List<String> recommendations) {
    // Parse the AI recommendations into meal plans
    // This is a placeholder implementation
    return [
      {
        'meal': 'Breakfast',
        'items': ['Oatmeal', 'Banana', 'Almonds'],
        'calories': 350,
        'macronutrients': {'carbs': 50, 'protein': 10, 'fat': 15}
      },
      {
        'meal': 'Lunch',
        'items': ['Grilled Chicken', 'Quinoa', 'Broccoli'],
        'calories': 450,
        'macronutrients': {'carbs': 40, 'protein': 30, 'fat': 20}
      },
      {
        'meal': 'Dinner',
        'items': ['Salmon', 'Sweet Potato', 'Asparagus'],
        'calories': 500,
        'macronutrients': {'carbs': 45, 'protein': 35, 'fat': 25}
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diet Plan Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'AI-Suggested Meal Plans',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: mealPlans.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(mealPlans[index]['meal']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Items: ${mealPlans[index]['items'].join(', ')}'),
                          Text('Calories: ${mealPlans[index]['calories']}'),
                          Text(
                              'Carbs: ${mealPlans[index]['macronutrients']['carbs']}g'),
                          Text(
                              'Protein: ${mealPlans[index]['macronutrients']['protein']}g'),
                          Text(
                              'Fat: ${mealPlans[index]['macronutrients']['fat']}g'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Nutrition Tracking',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text('Total Calories: ${nutritionTracking['calories']}'),
            Text(
                'Total Carbs: ${nutritionTracking['macronutrients']['carbs']}g'),
            Text(
                'Total Protein: ${nutritionTracking['macronutrients']['protein']}g'),
            Text('Total Fat: ${nutritionTracking['macronutrients']['fat']}g'),
          ],
        ),
      ),
    );
  }
}
