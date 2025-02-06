import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String errorText;
  final TextStyle textStyle;

  ErrorMessageWidget({@required this.errorText, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorText,
        style: textStyle ?? TextStyle(color: Colors.red, fontSize: 16),
      ),
    );
  }
}
