import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Creates a user object based on FirebaseUser.
  /// 
  /// Takes a [user] object of type [User].
  /// Returns a [User] object if the user is not null, otherwise returns null.
  User _userFromFirebaseUser(User user) {
    return user != null ? User(uid: user.uid) : null;
  }

  /// Auth change user stream.
  /// 
  /// Returns a stream of [User] objects that emits the current user whenever the authentication state changes.
  Stream<User> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  /// Signs in with email and password.
  /// 
  /// Takes the user's [email] and [password].
  /// Returns a [User] object if the sign-in is successful, otherwise returns null.
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// Registers with email and password.
  /// 
  /// Takes the user's [email] and [password].
  /// Returns a [User] object if the registration is successful, otherwise returns null.
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /// Signs out the current user.
  /// 
  /// Returns true if the sign-out is successful, otherwise returns false.
  Future signOut() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  /// Resets the password for the given email.
  /// 
  /// Takes the user's [email].
  /// Returns true if the password reset email is sent successfully, otherwise returns false.
  Future resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  // Reset password
  Future resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
