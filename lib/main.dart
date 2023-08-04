import 'package:finance_loan/frontend/nav/bottom_navigation_bar.dart';
import 'package:finance_loan/frontend/theme/app_theme.dart';
import 'package:finance_loan/frontend/theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart'; // Import the provider package
import 'firebase_options.dart';
// Import the theme_switch.dart file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      // Wrap with ChangeNotifierProvider to provide the ThemeModel
      create: (_) => ThemeModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: Provider.of<ThemeModel>(context)
          .themeMode, // Access the themeMode from the provider
      home: BottomNavigationBarExample(),
    );
  }
}

// ... Rest of the code
