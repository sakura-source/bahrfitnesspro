import 'package:flutter/material.dart';

class HormoneManagementScreen extends StatefulWidget {
  @override
  _HormoneManagementScreenState createState() => _HormoneManagementScreenState();
}

class _HormoneManagementScreenState extends State<HormoneManagementScreen> {
  // Sample data for hormone doses, schedules, benefits, and risks
  List<Map<String, String>> hormoneData = [
    {
      'name': 'Testosterone',
      'dose': '50mg',
      'schedule': 'Weekly',
      'benefits': 'Increased muscle mass, improved mood',
      'risks': 'Acne, hair loss, liver damage'
    },
    {
      'name': 'Estrogen',
      'dose': '2mg',
      'schedule': 'Daily',
      'benefits': 'Improved bone density, reduced hot flashes',
      'risks': 'Blood clots, stroke, breast cancer'
    },
  ];

  // Placeholder for AI-driven recommendations
  List<String> recommendations = [
    'Consider increasing your Testosterone dose to 75mg for better results.',
    'Monitor your Estrogen levels closely to avoid potential risks.'
  ];

  // Placeholder for medical warnings and alerts
  List<String> medicalWarnings = [
    'High risk of liver damage with current Testosterone dose.',
    'Increased risk of blood clots with current Estrogen dose.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hormone Management'),
      ),
      body: ListView.builder(
        itemCount: hormoneData.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(hormoneData[index]['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Dose: ${hormoneData[index]['dose']}'),
                  Text('Schedule: ${hormoneData[index]['schedule']}'),
                  Text('Benefits: ${hormoneData[index]['benefits']}'),
                  Text('Risks: ${hormoneData[index]['risks']}'),
                  SizedBox(height: 10),
                  Text('Recommendations: ${recommendations[index]}'),
                  Text('Medical Warnings: ${medicalWarnings[index]}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
