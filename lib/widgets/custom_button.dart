import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  CustomButton({
    @required this.text,
    @required this.color,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        textStyle: TextStyle(fontSize: 16.0),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
