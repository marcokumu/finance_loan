import 'package:finance_loan/frontend/theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwitch extends StatelessWidget {
  // const ThemeSwitch({super.key});

  final bool isDarkMode; // Add the isDarkMode parameter
  final ValueChanged<bool> onChanged; // Add the onChanged parameter

  const ThemeSwitch(
      {super.key, required this.isDarkMode, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context);
    return Switch(
      value: themeModel.themeMode == ThemeMode.dark,
      onChanged: (value) {
        ThemeMode newThemeMode = value ? ThemeMode.dark : ThemeMode.light;
        themeModel
            .updateTheme(newThemeMode); // Notify the app about the theme change
      },
      // activeColor: Colors.blue, // Customize the active color of the switch
    );
  }
}
