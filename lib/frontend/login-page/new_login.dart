import 'package:finance_loan/frontend/nav/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool _isLoading = false;
  bool rememberMe = false;

  Future<String?> _authUser(LoginData data) async {
    try {
      setState(() {
        _isLoading = true;
      });


      String email = data.name;
      String password = data.password;

      if (rememberMe) {
        // Save credentials if needed
        await _saveUserCredentials(email, password);
      }

      // Firebase authentication
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null && user.emailVerified) {
        return null; // Login successful
      } else {
        return 'Please verify your email address or sign up for a new account.';
      }
    } catch (e) {
      return e.toString();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<String?> _signupUser(SignupData data) async {
    try {
      setState(() {
        _isLoading = true;
      });

      if (data.name == null || data.password == null) {
        return 'Invalid signup data'; // Handle invalid data
      }

      String email = data.name!;
      String password = data.password!;

      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        await user.sendEmailVerification();
        return ''; // Return an empty string for success
      } else {
        return 'Something went wrong. Please try again later.';
      }
    } catch (e) {
      return e.toString();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }



  Future<String?> _recoverPassword(String email) async {
    try {
      setState(() {
        _isLoading = true;
      });

      // Firebase password reset
      await _auth.sendPasswordResetEmail(email: email);

      return 'Password reset email has been sent.';
    } catch (e) {
      return e.toString();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _saveUserCredentials(String email, String password) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'email', value: email);
    await storage.write(key: 'password', value: password);
  }

  Future<String?> _signInWithGoogle() async {
    try {
      setState(() {
        _isLoading = true;
      });

      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential = await _auth.signInWithCredential(credential);

        User? user = userCredential.user;

        if (user != null) {
          return null; // Google sign-in successful
        } else {
          return 'Something went wrong. Please try again later.';
        }
      } else {
        return 'Please select a Google account to sign in.';
      }
    } catch (e) {
      return e.toString();
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      footer: 'LifeTrackr',
      logo: const AssetImage('assets/images/track.png'),
      onLogin: _authUser,
      messages: LoginMessages(),
      onSignup: _signupUser,
      onRecoverPassword: _recoverPassword,
      // navigateBackAfterRecovery: true,
      loginProviders: <LoginProvider>[
        LoginProvider(
          icon: FontAwesomeIcons.google,
          label: 'Google',
          animated: true,
          callback: _signInWithGoogle,
        ),
      ],
      onSubmitAnimationCompleted: () {
        // Navigate to your main app page or dashboard here
        Navigator.pushReplacementNamed(context, '/homepage');
      },
    );
  }
}