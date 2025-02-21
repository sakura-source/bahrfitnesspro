import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final bool isPrimary;

  const LoadingIndicator({super.key, this.isPrimary = true});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          isPrimary ? Colors.blue : Colors.orange,
        ),
      ),
    );
  }
}
