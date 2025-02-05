import 'package:flutter/material.dart';

class TrainerClientInteractionScreen extends StatefulWidget {
  @override
  _TrainerClientInteractionScreenState createState() => _TrainerClientInteractionScreenState();
}

class _TrainerClientInteractionScreenState extends State<TrainerClientInteractionScreen> {
  // Placeholder for chat messages
  List<Map<String, String>> chatMessages = [
    {'sender': 'Trainer', 'message': 'Hello! How was your workout today?'},
    {'sender': 'Client', 'message': 'It was great! I feel much stronger.'},
  ];

  // Placeholder for session bookings
  List<Map<String, String>> sessionBookings = [
    {'date': '2023-09-01', 'time': '10:00 AM', 'status': 'Confirmed'},
    {'date': '2023-09-03', 'time': '02:00 PM', 'status': 'Pending'},
  ];

  // Placeholder for feedback
  List<Map<String, String>> feedback = [
    {'session': '2023-09-01', 'rating': '5', 'comments': 'Great session!'},
    {'session': '2023-09-03', 'rating': '4', 'comments': 'Good, but could be better.'},
  ];

  // Placeholder for shared notes
  List<Map<String, String>> sharedNotes = [
    {'date': '2023-09-01', 'note': 'Focus on upper body strength.'},
    {'date': '2023-09-03', 'note': 'Increase cardio intensity.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trainer-Client Interaction'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Chat Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Chat',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(chatMessages[index]['sender']),
                  subtitle: Text(chatMessages[index]['message']),
                );
              },
            ),
            // Session Booking Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Session Bookings',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: sessionBookings.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${sessionBookings[index]['date']} at ${sessionBookings[index]['time']}'),
                  subtitle: Text('Status: ${sessionBookings[index]['status']}'),
                );
              },
            ),
            // Feedback Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Feedback',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: feedback.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Session on ${feedback[index]['session']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Rating: ${feedback[index]['rating']}'),
                      Text('Comments: ${feedback[index]['comments']}'),
                    ],
                  ),
                );
              },
            ),
            // Shared Notes Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Shared Notes',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: sharedNotes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Note on ${sharedNotes[index]['date']}'),
                  subtitle: Text(sharedNotes[index]['note']),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
