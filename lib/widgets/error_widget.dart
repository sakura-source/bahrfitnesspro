import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final String errorMessage;
  final bool isCritical;

  ErrorWidget({@required this.errorMessage, this.isCritical = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isCritical ? Colors.red : Colors.orange,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isCritical ? Icons.error : Icons.warning,
              color: Colors.white,
              size: 48.0,
            ),
            SizedBox(height: 8.0),
            Text(
              errorMessage,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
