import 'package:flutter/material.dart';

class DietPlanManagementScreen extends StatefulWidget {
  const DietPlanManagementScreen({super.key});

  @override
  _DietPlanManagementScreenState createState() =>
      _DietPlanManagementScreenState();
}

class _DietPlanManagementScreenState extends State<DietPlanManagementScreen> {
  // Sample data for AI-suggested meal plans
  List<Map<String, dynamic>> mealPlans = [
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

  // Placeholder for tracking calorie intake and macronutrient breakdown
  Map<String, dynamic> nutritionTracking = {
    'calories': 0,
    'macronutrients': {'carbs': 0, 'protein': 0, 'fat': 0}
  };

  // Function to update nutrition tracking
  void updateNutritionTracking() {
    int totalCalories = 0;
    Map<String, int> totalMacronutrients = {'carbs': 0, 'protein': 0, 'fat': 0};

    for (var meal in mealPlans) {
      totalCalories += meal['calories'];
      totalMacronutrients['carbs'] += meal['macronutrients']['carbs'];
      totalMacronutrients['protein'] += meal['macronutrients']['protein'];
      totalMacronutrients['fat'] += meal['macronutrients']['fat'];
    }

    setState(() {
      nutritionTracking['calories'] = totalCalories;
      nutritionTracking['macronutrients'] = totalMacronutrients;
    });
  }

  @override
  void initState() {
    super.initState();
    updateNutritionTracking();
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
