import 'package:flutter/material.dart';
import 'package:wearable_integration/wearable_integration.dart';

class WearablesIntegrationScreen extends StatefulWidget {
  @override
  _WearablesIntegrationScreenState createState() => _WearablesIntegrationScreenState();
}

class _WearablesIntegrationScreenState extends State<WearablesIntegrationScreen> {
  Map<String, dynamic> wearableData = {
    'heartRate': 0,
    'caloriesBurned': 0,
  };

  @override
  void initState() {
    super.initState();
    syncWearableData();
  }

  Future<void> syncWearableData() async {
    try {
      var data = await WearableIntegration.getWearableData();
      setState(() {
        wearableData = data;
      });
    } catch (e) {
      print('Error syncing wearable data: $e');
    }
  }

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
