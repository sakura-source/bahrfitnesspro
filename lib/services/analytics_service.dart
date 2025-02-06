import 'package:cloud_firestore/cloud_firestore.dart';

class AnalyticsService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Track user activities
  Future<void> trackUserActivity(String userId, String activityType, Map<String, dynamic> activityData) async {
    try {
      await _db.collection('analytics').add({
        'userId': userId,
        'activityType': activityType,
        'activityData': activityData,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error tracking user activity: $e');
    }
  }

  // Generate user progress report
  Future<Map<String, dynamic>> generateUserProgressReport(String userId) async {
    try {
      QuerySnapshot snapshot = await _db
          .collection('analytics')
          .where('userId', isEqualTo: userId)
          .orderBy('timestamp', descending: true)
          .get();

      // Process the data to generate a report
      Map<String, dynamic> report = {};
      snapshot.docs.forEach((doc) {
        // Example processing logic
        String activityType = doc['activityType'];
        if (!report.containsKey(activityType)) {
          report[activityType] = [];
        }
        report[activityType].add(doc['activityData']);
      });

      return report;
    } catch (e) {
      print('Error generating user progress report: $e');
      return null;
    }
  }
}
