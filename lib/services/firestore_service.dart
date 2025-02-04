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

  /// Saves a workout log to Firestore.
  /// 
  /// Takes a map of workout data [workoutData].
  /// Throws an error if the operation fails.
  Future<void> saveWorkoutLog(Map<String, dynamic> workoutData) async {
    try {
      await _db.collection('workouts').add(workoutData);
    } catch (e) {
      print('Error saving workout log: $e');
    }
  }

  /// Saves a meal log to Firestore.
  /// 
  /// Takes a map of meal data [mealData].
  /// Throws an error if the operation fails.
  Future<void> saveMealLog(Map<String, dynamic> mealData) async {
    try {
      await _db.collection('meals').add(mealData);
    } catch (e) {
      print('Error saving meal log: $e');
    }
  }

  /// Updates user details in Firestore.
  /// 
  /// Takes the user's unique identifier [uid] and a map of user details [userDetails].
  /// Throws an error if the operation fails.
  Future<void> updateUserDetails(String uid, Map<String, dynamic> userDetails) async {
    try {
      await _db.collection('users').doc(uid).update(userDetails);
    } catch (e) {
      print('Error updating user details: $e');
    }
  }

  /// Updates the user's profile picture in Firestore.
  /// 
  /// Takes the user's unique identifier [uid] and the URL of the new profile picture [photoUrl].
  /// Throws an error if the operation fails.
  Future<void> updateUserProfilePicture(String uid, String photoUrl) async {
    try {
      await _db.collection('users').doc(uid).update({'photoUrl': photoUrl});
    } catch (e) {
      print('Error updating profile picture: $e');
    }
  }
}
