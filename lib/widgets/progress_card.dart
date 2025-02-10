import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  final String title;

    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
            ),
            Text(
            ),
            ),
            Text(
            ),
          ],
        ),
      ),
    );
  }
}
