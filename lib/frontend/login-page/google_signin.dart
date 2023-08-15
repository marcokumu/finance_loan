import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  // A function to handle the Google sign-in process
  final VoidCallback onPressed;

  // A constructor that takes the onPressed function as a parameter
  const GoogleSignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
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
            const SizedBox(width: 8.0),
            const Text(
              'Continue with Google',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
