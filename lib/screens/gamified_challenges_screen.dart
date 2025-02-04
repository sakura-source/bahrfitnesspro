import 'package:flutter/material.dart';

class GamifiedChallengesScreen extends StatelessWidget {
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
                  MaterialPageRoute(builder: (context) => LeaderboardScreen()),
                );
              },
              child: Text('View Leaderboard'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateChallengeScreen()),
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

class LeaderboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample leaderboard data
    List<Map<String, String>> leaderboardData = [
      {'name': 'User1', 'score': '1000'},
      {'name': 'User2', 'score': '900'},
      {'name': 'User3', 'score': '800'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: ListView.builder(
        itemCount: leaderboardData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(leaderboardData[index]['name']),
            trailing: Text(leaderboardData[index]['score']),
          );
        },
      ),
    );
  }
}

class CreateChallengeScreen extends StatefulWidget {
  @override
  _CreateChallengeScreenState createState() => _CreateChallengeScreenState();
}

class _CreateChallengeScreenState extends State<CreateChallengeScreen> {
  final _formKey = GlobalKey<FormState>();
  String _challengeName;
  String _challengeDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Challenge'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Challenge Name'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a challenge name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _challengeName = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Challenge Description'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a challenge description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _challengeDescription = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    // Save challenge to Firestore
                    Navigator.pop(context);
                  }
                },
                child: Text('Create Challenge'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
