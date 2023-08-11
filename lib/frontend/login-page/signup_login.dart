import 'package:finance_loan/frontend/nav/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:finance_loan/frontend/login-page/google_signin.dart';

// Define a LoginPage widget that handles the login and signup UI and logic
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
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

      // Use Firebase Auth's signInWithEmailAndPassword method to sign in the user with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      // Check if the user is not null and is verified
      User? user = userCredential.user;
      if (user != null && user.emailVerified) {
        // Navigate to the main app page or dashboard using Navigator.pushReplacement
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const BottomNavigationBarExample()));
      } else {
        throw Exception(
            'Please verify your email address or sign up for a new account.');
      }
    } on FirebaseAuthException catch (e) {
      // Handle any Firebase Auth errors and display appropriate messages to the user
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('No user found for that email.'),
          // backgroundColor: Colors.red,
        ));
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('Wrong password provided for that user.'),
          // backgroundColor: Colors.red,
        ));
      } else {
        print(e.message);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(e.message!),
          // backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      // Handle any other errors and display appropriate messages to the user
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(e.toString()),
        // backgroundColor: Colors.red,
      ));
    } finally {
      // Set the loading state to false
      setState(() {
        _isLoading = false;
      });
    }
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

      // Use Firebase Auth's createUserWithEmailAndPassword method to create a new user with email and password
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Check if the user is not null
      User? user = userCredential.user;
      if (user != null) {
        // Send a verification email to the user
        await user.sendEmailVerification();

        // Display a success message to the user
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
              'A verification email has been sent to $email. Please verify your email address and sign in.'),
          // backgroundColor: Colors.green,
        ));

        // Clear the text controllers
        _emailController.clear();
        _passwordController.clear();

        // Set the signing up state to false
        setState(() {
          _isSigningUp = false;
        });
      } else {
        throw Exception('Something went wrong. Please try again later.');
      }
    } on FirebaseAuthException catch (e) {
      // Handle any Firebase Auth errors and display appropriate messages to the user
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('The account already exists for that email.'),
          // backgroundColor: Colors.red,
        ));
      } else {
        print(e.message);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(e.message!),
          // backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      // Handle any other errors and display appropriate messages to the user
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(e.toString()),
        // backgroundColor: Colors.red,
      ));
    } finally {
      // Set the loading state to false
      setState(() {
        _isLoading = false;
      });
    }
  }

  // A function to handle the Google sign-in process
  Future<void> _signInWithGoogle() async {
    try {
      // Set the loading state to true
      setState(() {
        _isLoading = true;
      });

      // Use GoogleSignIn's signIn method to sign in the user with Google
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // Check if the Google user is not null
      if (googleUser != null) {
        // Get the Google authentication object from the Google user
        GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        // Create a credential object from the Google authentication object
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Use Firebase Auth's signInWithCredential method to sign in the user with Google credential
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        // Check if the user is not null
        User? user = userCredential.user;
        if (user != null) {
          // Navigate to the main app page or dashboard using Navigator.pushReplacement
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const BottomNavigationBarExample()));
        } else {
          throw Exception('Something went wrong. Please try again later.');
        }
      } else {
        throw Exception('Please select a Google account to sign in.');
      }
    } catch (e) {
      // Handle any errors and display appropriate messages to the user
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(e.toString()),
        // backgroundColor: Colors.red,
      ));
    } finally {
      // Set the loading state to false
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Return a Scaffold widget that contains the login and signup UI elements
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // A button to toggle between login and signup modes
                  ElevatedButton(
                    style: TextButton.styleFrom(
                        // backgroundColor: Colors.blue,
                        ),
                    onPressed: () {
                      setState(() {
                        _isSigningUp = !_isSigningUp;
                      });
                    },
                    child: Text(
                      _isSigningUp
                          ? 'Already have an account? Login'
                          : 'Don\'t have an account? Sign up',
                      style: const TextStyle(
                          // color: Colors.white,
                          ),
                    ),
                  ),
                  // A button to trigger the email/password login or signup process
                  ElevatedButton(
                    style: TextButton.styleFrom(
                        // backgroundColor: Colors.green,
                        ),
                    onPressed: _isSigningUp
                        ? _signUpWithEmailAndPassword
                        : _signInWithEmailAndPassword,
                    child: Text(
                      _isSigningUp ? 'Sign up' : 'Login',
                      style: const TextStyle(
                          // color: Colors.white,
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              // A custom GoogleSignInButton to trigger the Google sign-in process
              GoogleSignInButton(
                onPressed: _signInWithGoogle,
              ),
              // A widget to display a loading indicator if the user is loading
              if (_isLoading) const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
