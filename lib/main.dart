import 'package:finance_loan/frontend/login-page/signup_login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // bool isLoggedIn = await checkLoggedIn();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home:  LoginPage(),
    ),
  );
}

// Future<bool> checkLoggedIn() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

//   // Check if the user is already logged in
//   if (isLoggedIn) {
//     // Implement the logic to check if the user's session is still valid
//     // For example, you can use the FirebaseAuth instance to check the current user
//     // If the current user is not null, the user is logged in, and return true
//     // Otherwise, return false

//     final FirebaseAuth _auth = FirebaseAuth.instance;
//     User? currentUser = _auth.currentUser;
//     if (currentUser != null) {
//       return true;
//     } else {
//       // If the user's session is not valid, clear the isLoggedIn flag
//       // to force the user to log in again
//       prefs.setBool('isLoggedIn', false);
//       return false;
//     }
//   } else {
//     return false;
//   }
// }
