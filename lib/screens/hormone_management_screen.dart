import 'package:flutter/material.dart';

class HormoneManagementScreen extends StatefulWidget {
  const HormoneManagementScreen({super.key});

  @override
  _HormoneManagementScreenState createState() =>
      _HormoneManagementScreenState();
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
    // Add more hormone data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
