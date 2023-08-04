import 'package:finance_loan/frontend/screens/privacy_policy.dart';
import 'package:finance_loan/frontend/theme/theme_model.dart';
import 'package:finance_loan/frontend/theme/theme_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    super.key,
  });

  Widget _buildSubHeading(String subHeading) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        subHeading,
        style: const TextStyle(
          fontSize: 12,
          // color: Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          // Light and Dark Mode Switch
          ThemeSwitch(
            isDarkMode: themeModel.themeMode == ThemeMode.dark,
            onChanged: (value) {
              ThemeMode newThemeMode = value ? ThemeMode.dark : ThemeMode.light;
              themeModel.updateTheme(
                  newThemeMode); // Update the theme using the ThemeModel
            },
          ),
        ],
      ),
