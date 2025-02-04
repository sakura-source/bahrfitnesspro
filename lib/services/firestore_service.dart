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
}
