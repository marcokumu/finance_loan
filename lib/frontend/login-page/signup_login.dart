import 'package:finance_loan/frontend/nav/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Define a custom GoogleSignInButton widget
class GoogleSignInButton extends StatelessWidget {
  // A function to handle the Google sign-in process
  final VoidCallback onPressed;

  // A constructor that takes the onPressed function as a parameter
  GoogleSignInButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // Return a TextButton with Google logo and text
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/google_logo.png',
              height: 44.0,
            ),
            SizedBox(width: 8.0),
            Text(
              'Sign in with Google',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Define a LoginPage widget that handles the login and signup UI and logic
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Create an instance of FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create an instance of GoogleSignIn
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Create a TextEditingController for email input
  final TextEditingController _emailController = TextEditingController();

  // Create a TextEditingController for password input
  final TextEditingController _passwordController = TextEditingController();

  // A boolean to indicate if the user is signing up or logging in
  bool _isSigningUp = false;

  // A boolean to indicate if the user is loading or not
  bool _isLoading = false;

  // A function to handle the email/password login process
  Future<void> _signInWithEmailAndPassword() async {
    try {
      // Set the loading state to true
      setState(() {
        _isLoading = true;
      });

      // Get the email and password from the text controllers
      String email = _emailController.text;
      String password = _passwordController.text;

      // Validate the email and password inputs
      if (email.isEmpty || !email.contains('@')) {
        throw Exception('Please enter a valid email address.');
      }
      if (password.isEmpty || password.length < 6) {
        throw Exception('Please enter a password with at least 6 characters.');
      }

  // A function to handle the email/password signup process
  Future<void> _signUpWithEmailAndPassword() async {
    try {
      // Set the loading state to true
      setState(() {
        _isLoading = true;
      });

      // Get the email and password from the text controllers
      String email = _emailController.text;
      String password = _passwordController.text;

      // Validate the email and password inputs
      if (email.isEmpty || !email.contains('@')) {
        throw Exception('Please enter a valid email address.');
      }
      if (password.isEmpty || password.length < 6) {
        throw Exception('Please enter a password with at least 6 characters.');
      }

