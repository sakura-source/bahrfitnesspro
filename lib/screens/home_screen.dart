import 'package:flutter/material.dart';

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
