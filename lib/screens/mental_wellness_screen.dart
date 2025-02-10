import 'package:flutter/material.dart';

class MentalWellnessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              'Stress and Mood Tracking',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
              'Track your stress levels and mood over time.',
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
              },
            ),
              'Guided Meditation and Relaxation',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
              'Listen to guided meditation and relaxation audio content.',
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
              },
            ),
        ),
      ),
      ),
      ),
      ),
      ),
    );
  }
}
