import 'package:flutter/material.dart';

class WearablesIntegrationScreen extends StatefulWidget {
  @override
  _WearablesIntegrationScreenState createState() => _WearablesIntegrationScreenState();
}

class _WearablesIntegrationScreenState extends State<WearablesIntegrationScreen> {
  // Placeholder for wearable data
  Map<String, dynamic> wearableData = {
    'heartRate': 0,
    'caloriesBurned': 0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wearables Integration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Heart Rate: ${wearableData['heartRate']} bpm'),
            SizedBox(height: 20),
            Text('Calories Burned: ${wearableData['caloriesBurned']} kcal'),
          ],
        ),
      ),
    );
  }
}
