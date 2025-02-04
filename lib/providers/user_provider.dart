import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bahrfitnesspro/models/user_model.dart';

class UserProvider with ChangeNotifier {
  User _user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  User get user => _user;

  Future<void> fetchUser() async {
    User firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      DocumentSnapshot doc = await _db.collection('users').doc(firebaseUser.uid).get();
      _user = User.fromMap(doc.data());
      notifyListeners();
    }
  }

  Future<void> updateUser(User user) async {
    _user = user;
    await _db.collection('users').doc(user.uid).update(user.toMap());
    notifyListeners();
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _user = null;
    notifyListeners();
  }
}
