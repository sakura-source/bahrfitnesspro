import 'package:flutter/material.dart';

class MentalWellnessScreen extends StatelessWidget {
  const MentalWellnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mental Wellness'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Stress and Mood Tracking',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Track your stress levels and mood over time.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StressMoodTrackingScreen()),
                );
              },
              child: const Text('Track Now'),
            ),
            const SizedBox(height: 32),
            const Text(
              'Guided Meditation and Relaxation',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Listen to guided meditation and relaxation audio content.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GuidedMeditationScreen()),
                );
              },
              child: const Text('Listen Now'),
            ),
          ],
        ),
      ),
    );
  }
}

class StressMoodTrackingScreen extends StatelessWidget {
  const StressMoodTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stress and Mood Tracking'),
      ),
      body: const Center(
        child: Text('Stress and Mood Tracking Screen'),
      ),
    );
  }
}

class GuidedMeditationScreen extends StatelessWidget {
  const GuidedMeditationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guided Meditation and Relaxation'),
      ),
      body: const Center(
        child: Text('Guided Meditation and Relaxation Screen'),
      ),
    );
  }
}
