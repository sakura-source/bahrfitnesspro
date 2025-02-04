import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DietTrackingScreen extends StatefulWidget {
  @override
  _DietTrackingScreenState createState() => _DietTrackingScreenState();
}

class _DietTrackingScreenState extends State<DietTrackingScreen> {
  final _formKey = GlobalKey<FormState>();
  String mealName;
  int calories;
  String time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diet Tracking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Meal Name'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a meal name';
                  }
                  return null;
                },
                onSaved: (value) {
                  mealName = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Calories'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the number of calories';
                  }
                  return null;
                },
                onSaved: (value) {
                  calories = int.parse(value);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Time'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter the time';
                  }
                  return null;
                },
                onSaved: (value) {
                  time = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Save Meal'),
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
      _saveMealToFirestore();
    }
  }

  void _saveMealToFirestore() async {
    await FirebaseFirestore.instance.collection('meals').add({
      'mealName': mealName,
      'calories': calories,
      'time': time,
      'timestamp': FieldValue.serverTimestamp(),
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Meal saved successfully')),
    );
  }
}
