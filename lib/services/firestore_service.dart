import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add a new user to the Firestore database
  Future<void> addUser(String uid, Map<String, dynamic> userData) async {
    try {
      await _db.collection('users').doc(uid).set(userData);
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  // Get user data from the Firestore database
  Future<DocumentSnapshot> getUser(String uid) async {
    try {
      return await _db.collection('users').doc(uid).get();
    } catch (e) {
      print('Error getting user: $e');
      return null;
    }
  }

  // Update user data in the Firestore database
  Future<void> updateUser(String uid, Map<String, dynamic> userData) async {
    try {
      await _db.collection('users').doc(uid).update(userData);
    } catch (e) {
      print('Error updating user: $e');
    }
  }

  // Delete user from the Firestore database
  Future<void> deleteUser(String uid) async {
    try {
      await _db.collection('users').doc(uid).delete();
    } catch (e) {
      print('Error deleting user: $e');
    }
  }

  // Save workout log to Firestore
  Future<void> saveWorkoutLog(Map<String, dynamic> workoutData) async {
    try {
      await _db.collection('workouts').add(workoutData);
    } catch (e) {
      print('Error saving workout log: $e');
    }
  }

  // Save meal log to Firestore
  Future<void> saveMealLog(Map<String, dynamic> mealData) async {
    try {
      await _db.collection('meals').add(mealData);
    } catch (e) {
      print('Error saving meal log: $e');
    }
  }

  // Update user details in Firestore
  Future<void> updateUserDetails(String uid, Map<String, dynamic> userDetails) async {
    try {
      await _db.collection('users').doc(uid).update(userDetails);
    } catch (e) {
      print('Error updating user details: $e');
    }
  }

  // Update user profile picture in Firestore
  Future<void> updateUserProfilePicture(String uid, String photoUrl) async {
    try {
      await _db.collection('users').doc(uid).update({'photoUrl': photoUrl});
    } catch (e) {
      print('Error updating profile picture: $e');
    }
  }
}
