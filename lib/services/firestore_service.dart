import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Adds a new user to the Firestore database.
  ///
  /// Takes the user's unique identifier [uid] and a map of user data [userData].
  /// Throws an error if the operation fails.
  Future<void> addUser(String uid, Map<String, dynamic> userData) async {
    try {
      await _db.collection('users').doc(uid).set(userData);
    } catch (e) {
      print('Error adding user: $e');
    }
  }

  /// Retrieves user data from the Firestore database.
  ///
  /// Takes the user's unique identifier [uid].
  /// Returns a [DocumentSnapshot] containing the user data.
  /// Throws an error if the operation fails.
  Future<DocumentSnapshot> getUser(String uid) async {
    try {
      return await _db.collection('users').doc(uid).get();
    } catch (e) {
      print('Error getting user: $e');
      return null;
    }
  }

  /// Updates user data in the Firestore database.
  ///
  /// Takes the user's unique identifier [uid] and a map of user data [userData].
  /// Throws an error if the operation fails.
  Future<void> updateUser(String uid, Map<String, dynamic> userData) async {
    try {
      await _db.collection('users').doc(uid).update(userData);
    } catch (e) {
      print('Error updating user: $e');
    }
  }

  /// Deletes a user from the Firestore database.
  ///
  /// Takes the user's unique identifier [uid].
  /// Throws an error if the operation fails.
  Future<void> deleteUser(String uid) async {
    try {
      await _db.collection('users').doc(uid).delete();
    } catch (e) {
      print('Error deleting user: $e');
    }
  }
}
