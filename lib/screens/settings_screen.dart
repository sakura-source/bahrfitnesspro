import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bahrfitnesspro/providers/user_provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;
  bool _isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Language',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text(_isEnglish ? 'English' : 'Arabic'),
              value: _isEnglish,
              onChanged: (bool value) {
                setState(() {
                  _isEnglish = value;
                });
                // Implement language toggle functionality here
              },
            ),
            SizedBox(height: 32),
            Text(
              'Theme',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: Text(_isDarkMode ? 'Dark Mode' : 'Light Mode'),
              value: _isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  _isDarkMode = value;
                });
                // Implement theme toggle functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}
