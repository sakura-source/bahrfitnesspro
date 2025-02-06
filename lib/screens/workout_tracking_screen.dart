import 'package:flutter/material.dart';

class WorkoutTrackingScreen extends StatefulWidget {
  @override
  _WorkoutTrackingScreenState createState() => _WorkoutTrackingScreenState();
}

class _WorkoutTrackingScreenState extends State<WorkoutTrackingScreen> {
  final _formKey = GlobalKey<FormState>();
  String _exerciseType;
  int _duration;
  String _intensity;

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
                decoration: InputDecoration(labelText: 'Exercise Type'),
                onSaved: (value) {
                  _exerciseType = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Duration (minutes)'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _duration = int.parse(value);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Intensity'),
                onSaved: (value) {
                  _intensity = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    // Save workout log
                  }
                },
                child: Text('Save Workout Log'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
