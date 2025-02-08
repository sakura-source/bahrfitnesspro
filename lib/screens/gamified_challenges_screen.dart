import 'package:flutter/material.dart';

class GamifiedChallengesScreen extends StatelessWidget {
  const GamifiedChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gamified Challenges'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to Gamified Challenges!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LeaderboardScreen()),
                );
              },
              child: const Text('View Leaderboard'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateChallengeScreen()),
                );
              },
              child: const Text('Create Challenge'),
            ),
          ],
        ),
      ),
    );
  }
}

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
      ),
      body: const Center(
        child: Text('Leaderboard Screen'),
      ),
    );
  }
}

class CreateChallengeScreen extends StatelessWidget {
  const CreateChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Challenge'),
      ),
      body: const Center(
        child: Text('Create Challenge Screen'),
      ),
    );
  }
}
