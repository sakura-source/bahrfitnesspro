import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkoutTrackingScreen extends StatefulWidget {
  @override
  _WorkoutTrackingScreenState createState() => _WorkoutTrackingScreenState();
}

class _WorkoutTrackingScreenState extends State<WorkoutTrackingScreen> {
  final _formKey = GlobalKey<FormState>();
  String _workoutName;
  int _duration;
  int _caloriesBurned;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Tracking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Workout Name'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a workout name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _workoutName = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Duration (minutes)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the duration';
                  }
                  return null;
                },
                onSaved: (value) {
                  _duration = int.parse(value);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Calories Burned'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the calories burned';
                  }
                  return null;
                },
                onSaved: (value) {
                  _caloriesBurned = int.parse(value);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Log Workout'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _saveWorkoutLog();
    }
  }

  void _saveWorkoutLog() async {
    await FirebaseFirestore.instance.collection('workouts').add({
      'workoutName': _workoutName,
      'duration': _duration,
      'caloriesBurned': _caloriesBurned,
      'timestamp': Timestamp.now(),
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Workout logged successfully!')),
    );
  }
}
