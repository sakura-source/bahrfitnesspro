import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('leaderboard').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          var leaderboardData = snapshot.data.docs;
          return ListView.builder(
            itemCount: leaderboardData.length,
            itemBuilder: (context, index) {
              var data = leaderboardData[index].data();
              return ListTile(
                title: Text(data['name']),
                trailing: Text(data['score'].toString()),
              );
            },
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
                    FirebaseFirestore.instance.collection('challenges').add({
                      'name': _challengeName,
                      'description': _challengeDescription,
                      'timestamp': FieldValue.serverTimestamp(),
                    });
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
