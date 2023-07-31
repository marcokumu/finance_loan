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
