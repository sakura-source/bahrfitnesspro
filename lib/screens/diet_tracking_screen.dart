import 'package:flutter/material.dart';

class DietTrackingScreen extends StatefulWidget {
  @override
  _DietTrackingScreenState createState() => _DietTrackingScreenState();
}

class _DietTrackingScreenState extends State<DietTrackingScreen> {
  final _formKey = GlobalKey<FormState>();
  String _mealType;
  int _calories;
  String _macronutrients;

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
                decoration: InputDecoration(labelText: 'Meal Type'),
                onSaved: (value) {
                  _mealType = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Calories'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _calories = int.parse(value);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Macronutrients'),
                onSaved: (value) {
                  _macronutrients = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    // Save diet log
                  }
                },
                child: Text('Save Diet Log'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
