import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bahrfitnesspro/screens/login_screen.dart';
import 'package:bahrfitnesspro/screens/signup_screen.dart';
import 'package:bahrfitnesspro/screens/forgot_password_screen.dart';
import 'package:bahrfitnesspro/screens/home_screen.dart';
import 'package:bahrfitnesspro/screens/workout_tracking_screen.dart';
import 'package:bahrfitnesspro/screens/diet_tracking_screen.dart';
import 'package:bahrfitnesspro/screens/profile_screen.dart';
import 'package:bahrfitnesspro/screens/settings_screen.dart';
import 'package:bahrfitnesspro/screens/mental_wellness_screen.dart';
import 'package:bahrfitnesspro/screens/gamified_challenges_screen.dart';
import 'package:bahrfitnesspro/screens/hormone_management_screen.dart';
import 'package:bahrfitnesspro/screens/wearables_integration_screen.dart';
import 'package:bahrfitnesspro/providers/user_provider.dart';
import 'package:bahrfitnesspro/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BahrFitnessPRO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BahrFitnessPRO Home'),
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
