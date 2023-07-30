import 'package:finance_loan/frontend/login-page/signup_login.dart';
import 'package:finance_loan/frontend/nav/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  Future<void> _signUpWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationBarExample()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        setState(() {
          _errorMessage = 'The email address is already in use.';
        });
      } else {
        setState(() {
          _errorMessage = 'An unknown error occurred.';
        });
      }
    }
  }
