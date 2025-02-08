import 'package:flutter/material.dart';

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
    syncWearableData(); // Sync data when the screen is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wearables Integration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Heart Rate: ${wearableData['heartRate']} bpm'),
            const SizedBox(height: 20),
            Text('Calories Burned: ${wearableData['caloriesBurned']} kcal'),
          ],
        ),
      ),
    );
  }
}
