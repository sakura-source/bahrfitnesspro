import 'package:flutter/material.dart';

class MentalWellnessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mental Wellness'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Stress and Mood Tracking',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Track your stress levels and mood over time.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to stress and mood tracking screen
              },
              child: Text('Track Now'),
            ),
            SizedBox(height: 32),
            Text(
              'Guided Meditation and Relaxation',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Listen to guided meditation and relaxation audio content.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to guided meditation and relaxation screen
              },
              child: Text('Listen Now'),
            ),
          ],
        ),
      ),
    );
  }
}
