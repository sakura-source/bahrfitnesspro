import 'package:flutter/material.dart';

class GamifiedChallengesScreen extends StatelessWidget {
  const GamifiedChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gamified Challenges'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Gamified Challenges!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                );
              },
              child: Text('View Leaderboard'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                );
              },
              child: Text('Create Challenge'),
            ),
          ],
        ),
      ),
    );
  }
}
