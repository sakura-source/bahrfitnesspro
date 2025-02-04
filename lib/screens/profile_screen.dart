import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _picker = ImagePicker();
  User _user;
  File _image;
  String _name;
  String _email;
  double _weight;
  double _height;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    _name = _user.displayName;
    _email = _user.email;
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    DocumentSnapshot doc = await _firestore.collection('users').doc(_user.uid).get();
    setState(() {
      _weight = doc['weight'];
      _height = doc['height'];
    });
  }

  Future<void> _updateUserDetails() async {
    await _firestore.collection('users').doc(_user.uid).update({
      'name': _name,
      'email': _email,
      'weight': _weight,
      'height': _height,
    });
  }

  Future<void> _uploadProfilePicture() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      // Upload the image to Firebase Storage and update the user's profile picture URL
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _uploadProfilePicture,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _image != null ? FileImage(_image) : NetworkImage(_user.photoURL),
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) {
                _name = value;
              },
              controller: TextEditingController(text: _name),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                _email = value;
              },
              controller: TextEditingController(text: _email),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Weight (kg)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _weight = double.parse(value);
              },
              controller: TextEditingController(text: _weight?.toString()),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Height (cm)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _height = double.parse(value);
              },
              controller: TextEditingController(text: _height?.toString()),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateUserDetails,
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
