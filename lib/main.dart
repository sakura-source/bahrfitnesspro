import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bahrfitnesspro/screens/signup_screen.dart';
import 'package:bahrfitnesspro/screens/forgot_password_screen.dart';
import 'package:bahrfitnesspro/screens/profile_screen.dart';
import 'package:bahrfitnesspro/screens/settings_screen.dart';
import 'package:bahrfitnesspro/screens/workout_tracking_screen.dart';
import 'package:bahrfitnesspro/screens/diet_tracking_screen.dart';
import 'package:bahrfitnesspro/screens/progress_photos_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BahrFitnessPRO',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: HomeScreen(toggleDarkMode: _toggleDarkMode),
      routes: {
        '/signup': (context) => SignupScreen(),
        '/forgot_password': (context) => ForgotPasswordScreen(),
        '/profile': (context) => ProfileScreen(),
        '/settings': (context) => SettingsScreen(),
        '/workout_tracking': (context) => WorkoutTrackingScreen(),
        '/diet_tracking': (context) => DietTrackingScreen(),
        '/progress_photos': (context) => ProgressPhotosScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Function toggleDarkMode;

  HomeScreen({this.toggleDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BahrFitnessPRO Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: toggleDarkMode,
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to BahrFitnessPRO!'),
      ),
    );
  }
}

Future<void> initializeFirebase() async {
  try {
    await Firebase.initializeApp();
  } catch (e) {
    print("Firebase initialization error: $e");
  }
}
