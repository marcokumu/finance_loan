import 'package:finance_loan/frontend/login-page/new_login.dart';
import 'package:finance_loan/frontend/login-page/signup_login.dart';
import 'package:finance_loan/frontend/nav/bottom_navigation_bar.dart';
import 'package:finance_loan/frontend/theme/app_theme.dart';
import 'package:finance_loan/frontend/theme/theme_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'frontend/services/data_migration.dart';
import 'frontend/services/onboarding.dart';
import 'frontend/widgets/create-loan/create_new_loan.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    // Initialize Firebase
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
  ]);
}

class SystemThemeObserver extends NavigatorObserver {
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    final themeModel =
        Provider.of<ThemeModel>(navigator!.context, listen: false);

    if (navigator != null) {
      // Check the system's brightness mode
      final Brightness currentBrightness =
          MediaQuery.of(navigator!.context).platformBrightness;

      // Determine the corresponding theme mode
      final ThemeMode newThemeMode = currentBrightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;

      // Update the app's theme if it has changed
      if (themeModel.themeMode != newThemeMode) {
        themeModel.updateTheme(newThemeMode);
      }
    }
  }
}

void main() async {
  await initializeApp();

  final themeModel = ThemeModel();
  await themeModel.loadThemeFromStorage(); // Load theme preference from storage

  String? userId = await getUserID();

  // Check if the user is signed in and decide which screen to show
  Widget homeScreen;
  if (userId != null) {
    await performDataMigration();
    homeScreen = const BottomNavigationBarExample();
  } else {
    // Handle the case where userId is null
    debugPrint('User ID is null. Unable to perform data migration.');
    // You can also show an error message to the user or navigate to a different screen.
    // For example, you can redirect the user to the login page or display a message.
    // homeScreen = const LoginPage();
    homeScreen = const OnboardingPage();
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
            value:
                themeModel), // Use value constructor to provide the existing themeModel
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeModel.themeMode, // Use the loaded theme mode
          home: homeScreen,
          initialRoute: '/',
          builder: EasyLoading.init(),
          routes: {
            '/homepage': (context) => const BottomNavigationBarExample(),
            '/login': (context) => const LoginScreen(),
            '/create_loan': (context) => const CreateNewLoan(),
            '/onboarding': (context) => const OnboardingPage(),
          },
          navigatorObservers: [SystemThemeObserver()],
        );
      }),
    ),
  );
}
