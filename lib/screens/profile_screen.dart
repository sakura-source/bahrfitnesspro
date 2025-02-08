import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bahrfitnesspro/models/user_model.dart';
import 'package:bahrfitnesspro/providers/user_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String _displayName;
  String _photoUrl;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              if (user != null) ...[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user.photoUrl),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: user.displayName,
                  decoration: const InputDecoration(labelText: 'Display Name'),
                  onSaved: (value) => _displayName = value,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  initialValue: user.photoUrl,
                  decoration: const InputDecoration(labelText: 'Photo URL'),
                  onSaved: (value) => _photoUrl = value,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      User updatedUser = User(
                        uid: user.uid,
                        email: user.email,
                        displayName: _displayName,
                        photoUrl: _photoUrl,
                      );
                      await userProvider.updateUser(updatedUser);
                    }
                  },
                  child: const Text('Update Profile'),
                ),
              ] else ...[
                const CircularProgressIndicator(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
