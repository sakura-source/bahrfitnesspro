import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
