import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  User? _user;
  String? _userPhotoURL;

  @override
  void initState() {
    super.initState();
    _getUserDetails();
  }

  Future<void> _getUserDetails() async {
    _user = _auth.currentUser;
    if (_user != null) {
      DocumentSnapshot userSnapshot = await _firestore
          .collection('users')
          .doc(_user!.uid)
          .collection('user-profile')
          .doc('profile')
          .get();

      if (userSnapshot.exists) {
        setState(() {
          _fullNameController.text = userSnapshot['fullName'];
          _emailController.text = userSnapshot['email'];
          _phoneNumberController.text = userSnapshot['phoneNumber'];
        });
      } else {
        _fullNameController.text = _user!.displayName ?? '';
        _emailController.text = _user!.email ?? '';
      }

      setState(() {
        _userPhotoURL = _user!.photoURL;
      });
    }
  }

  Future<void> _saveProfileDetails() async {
    if (_user != null) {
      await _firestore
          .collection('users')
          .doc(_user!.uid)
          .collection('user-profile')
          .doc('profile')
          .set({
        'fullName': _fullNameController.text,
        'email': _emailController.text,
        'phoneNumber': _phoneNumberController.text,
      }, SetOptions(merge: true));
    }
  }

  Future<void> _uploadImage() async {
    if (_user != null) {
      final ref = _storage.ref().child('profile_images').child(_user!.uid);
      final uploadTask = ref.putFile(File('path/to/image'));

      final snapshot = await uploadTask.whenComplete(() {});
      final imageUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        _userPhotoURL = imageUrl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Fill Your Profile',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              "Don't worry, you can always change it later.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () async {
                await _uploadImage();
              },
              child: Container(
                width: 100,
                height: 100,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: _userPhotoURL != null
                    ? Image.network(
                        _userPhotoURL!,
                      )
                    : const Icon(Icons.person, size: 60),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _fullNameController,
              decoration: const InputDecoration(labelText: 'Full Name'),
            ),
            const SizedBox(height: 26),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 26),
            Row(
              children: [
                // Implement country code dropdown or text field here

                Expanded(
                  child: TextField(
                    controller: _phoneNumberController,
                    decoration:
                        const InputDecoration(labelText: 'Phone Number'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await _saveProfileDetails();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profile details saved')),
                );
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
