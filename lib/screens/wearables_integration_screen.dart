import 'package:flutter/material.dart';
import 'package:wearable_integration/wearable_integration.dart';

class WearablesIntegrationScreen extends StatefulWidget {
  const WearablesIntegrationScreen({super.key});

  @override
  _WearablesIntegrationScreenState createState() => _WearablesIntegrationScreenState();
}

class _WearablesIntegrationScreenState extends State<WearablesIntegrationScreen> {
  // Placeholder for wearable data
  Map<String, dynamic> wearableData = {
    'heartRate': 0,
    'caloriesBurned': 0,
  };

  // Simulate data synchronization with wearables
  void syncWearableData() {
    setState(() {
      wearableData['heartRate'] = 75; // Simulated heart rate data
      wearableData['caloriesBurned'] = 200; // Simulated calories burned data
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Heart Rate: ${wearableData['heartRate']} bpm'),
            Text('Calories Burned: ${wearableData['caloriesBurned']} kcal'),
          ],
        ),
      ),
    );
  }
}
