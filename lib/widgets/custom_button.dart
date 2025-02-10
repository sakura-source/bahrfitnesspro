import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

    @required this.text,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          isPrimary ? Colors.blue : Colors.orange,
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        ),
        textStyle: MaterialStateProperty.all(
          TextStyle(fontSize: 16.0),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
