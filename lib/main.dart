import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      title: 'BahrFitnessPRO',
      ),
    );
  }
}

Future<void> initializeFirebase() async {
  try {
    await Firebase.initializeApp();
  } catch (e) {
  }
}
