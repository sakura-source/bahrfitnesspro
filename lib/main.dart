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
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        title: 'BahrFitnessPRO',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen(),
          '/forgot_password': (context) => ForgotPasswordScreen(),
          '/home': (context) => HomeScreen(),
          '/workout_tracking': (context) => WorkoutTrackingScreen(),
          '/diet_tracking': (context) => DietTrackingScreen(),
          '/profile': (context) => ProfileScreen(),
          '/settings': (context) => SettingsScreen(),
          '/mental_wellness': (context) => MentalWellnessScreen(),
          '/gamified_challenges': (context) => GamifiedChallengesScreen(),
          '/hormone_management': (context) => HormoneManagementScreen(),
          '/wearables_integration': (context) => WearablesIntegrationScreen(),
        },
      ),
    );
  }
}
