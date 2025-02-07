import 'package:flutter/material.dart';

class WorkoutTrackingScreen extends StatefulWidget {
  @override
  _WorkoutTrackingScreenState createState() => _WorkoutTrackingScreenState();
}

class _WorkoutTrackingScreenState extends State<WorkoutTrackingScreen> {
  List<Map<String, dynamic>> exercises = [
    {'name': 'Push-ups', 'reps': 0},
    {'name': 'Squats', 'reps': 0},
    {'name': 'Lunges', 'reps': 0},
  ];

  List<Map<String, dynamic>> workoutHistory = [];

  void logWorkout() {
    setState(() {
      workoutHistory.add({
        'date': DateTime.now(),
        'exercises': List.from(exercises),
      });
      exercises.forEach((exercise) {
        exercise['reps'] = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Tracking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(exercises[index]['name']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if (exercises[index]['reps'] > 0) {
                                  exercises[index]['reps']--;
                                }
                              });
                            },
                          ),
                          Text('${exercises[index]['reps']}'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                exercises[index]['reps']++;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: logWorkout,
              child: Text('Log Workout'),
            ),
            SizedBox(height: 20),
            Text(
              'Workout History',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: workoutHistory.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                          'Workout on ${workoutHistory[index]['date'].toString()}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: (workoutHistory[index]['exercises'] as List)
                            .map((exercise) => Text(
                                '${exercise['name']}: ${exercise['reps']} reps'))
                            .toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
