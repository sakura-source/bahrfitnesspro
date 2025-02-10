import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bahrfitnesspro/models/user_model.dart';
import 'package:bahrfitnesspro/services/auth_service.dart';
import 'package:bahrfitnesspro/services/firestore_service.dart';

/// UserProvider class handles user-related operations such as fetching user data,
/// updating user data, signing out, and logging workouts/meals.
class UserProvider with ChangeNotifier {
  User _user;
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();

  User get user => _user;

  /// Fetches the current user data from Firestore and updates the provider state.
  Future<void> fetchUser() async {
    try {
      User firebaseUser = _authService.currentUser;
      if (firebaseUser != null) {
        DocumentSnapshot doc =
          await _firestoreService.getUser(firebaseUser.uid);
        _user = User.fromMap(doc.data());
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching user: $e');
    }
  }

  /// Updates the user data in Firestore and updates the provider state.
  Future<void> updateUser(User user) async {
    try {
      _user = user;
      await _firestoreService.updateUser(user.uid, user.toMap());
      notifyListeners();
    } catch (e) {
      print('Error updating user: $e');
    }
  }

  /// Signs out the current user and updates the provider state.
  Future<void> signOut() async {
    try {
      await _authService.signOut();
      _user = null;
      notifyListeners();
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  /// Saves a workout log to Firestore.
  Future<void> saveWorkoutLog(Map<String, dynamic> workoutData) async {
    try {
      await _firestoreService.saveWorkoutLog(workoutData);
    } catch (e) {
      print('Error saving workout log: $e');
    }
  }

  /// Saves a meal log to Firestore.
  Future<void> saveMealLog(Map<String, dynamic> mealData) async {
    try {
      await _firestoreService.saveMealLog(mealData);
    } catch (e) {
      print('Error saving meal log: $e');
    }
  }
}
