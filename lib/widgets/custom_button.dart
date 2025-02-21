import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;

    @required this.text,
    @required this.onPressed,
    this.isPrimary = true,
  

  CustomButton({super.key});});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          isPrimary ? Colors.blue : Colors.orange,
        ),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        ),
        textStyle: WidgetStateProperty.all(
          TextStyle(fontSize: 16.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
