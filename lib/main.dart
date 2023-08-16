import 'package:finance_loan/frontend/nav/bottom_navigation_bar.dart';
import 'package:finance_loan/frontend/theme/app_theme.dart';
import 'package:finance_loan/frontend/theme/theme_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    // Initialize Firebase
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
  ]);
}

void main() async {
  await initializeApp();

  runApp(
    MultiProvider(
      // Use MultiProvider to provide multiple providers if needed
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        // Add other providers here if needed
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: Provider.of<ThemeModel>(context).themeMode,
      home: const BottomNavigationBarExample(),
      builder: EasyLoading.init(),
    );
  }
}
