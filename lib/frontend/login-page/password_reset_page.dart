import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PasswordResetPage extends StatefulWidget {
  final String? initialEmail; // Add this line
  const PasswordResetPage({Key? key, this.initialEmail}) : super(key: key);

  @override
  PasswordResetPageState createState() => PasswordResetPageState();
}

class PasswordResetPageState extends State<PasswordResetPage> {
  final TextEditingController _emailController = TextEditingController();
  bool _isResetting = false;

  @override
  void initState() {
    super.initState();
    // Set the initial value for _emailController if it's provided
    if (widget.initialEmail != null) {
      _emailController.text = widget.initialEmail!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Forgot Your Password?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Enter your email address below, and we will send you a password reset link.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            FilledButton(
              onPressed: _isResetting ? null : _resetPassword,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Reset Password',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            if (_isResetting)
              const Center(
                child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _resetPassword() async {
    final scaffoldContext = ScaffoldMessenger.of(context);
    final navigatorContext = Navigator.of(context);
    setState(() {
      _isResetting = true;
    });

    try {
      final String email = _emailController.text;
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      scaffoldContext.showSnackBar(
        const SnackBar(
          content: Text('A password reset link has been sent to your email.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      navigatorContext.pop(); // Close the reset password page
    } catch (e) {
      scaffoldContext.showSnackBar(
        const SnackBar(
          content: Text('Password reset failed. Please try again later.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      setState(() {
        _isResetting = false;
      });
    }
  }
}
