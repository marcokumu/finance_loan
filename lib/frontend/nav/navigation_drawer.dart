import 'package:finance_loan/frontend/screens/new_home.dart';
import 'package:finance_loan/frontend/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ionicons/ionicons.dart';

class NavigationDrawerExample extends StatelessWidget {
  const NavigationDrawerExample({Key? key}) : super(key: key);

  // Function to handle user logout
  Future<void> _signOut(BuildContext context) async {
    final scaffoldContext = ScaffoldMessenger.of(context); // Capture the context
    final navigatorContext = Navigator.of(context); // Capture the Navigator's context
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate back to the login page
      navigatorContext.pushReplacementNamed( '/login');
    } catch (e) {

      scaffoldContext.showSnackBar(const SnackBar(
        content: Text('An error occurred while signing out.'),
        // backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  void showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _signOut(context);
              },
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  // color: Colors.red,
                ),
              ),
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    // A list to define a menu of items with their icons, titles, and onTap callbacks
    final List<Map<String, dynamic>> menuItems = [
      {
        'icon': Ionicons.stats_chart_outline,
        'title': 'Statistical Analysis',
        'onTap': () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingsPage(),
            ),
          );
          // Navigator.pop(context); // Close the drawer
        },
      },
      {
        'icon': Icons.account_tree_outlined,
        'title': 'Transactions',
        'onTap': () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const NewHomePage(),
            ),
          );
        },
      },
      // Add more menu items later
      {
        'icon': Icons.inventory,
        'title': 'Inventory',
        'onTap': () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingsPage(),
            ),
          );
        },
      },
      {
        'icon': Ionicons.notifications_outline,
        'title': 'Notifications',
        'onTap': () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingsPage(),
            ),
          );
        },
      },
      {
        'icon': Ionicons.options_outline,
        'title': 'Settings',
        'onTap': () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingsPage(),
            ),
          );
        },
      },
      {
        'icon': Icons.help_outline,
        'title': 'Help',
        'onTap': () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingsPage(),
            ),
          );
        },
      },
      {
        'icon': Ionicons.log_out_outline,
        'title': 'Logout',
        'onTap': () => showLogoutConfirmationDialog(context), // Call _signOut when Logout is tapped
      },
    ];

    return Drawer(
      // backgroundColor: const Color.fromRGBO(249, 239, 235, 1),
      child: ListView.builder(
        itemCount: menuItems.length + 1, // Add one for the header
        itemBuilder: (context, index) {
          if (index == 0) {
            // Return the header widget for the first item
            return const DrawerHeader(
              decoration: BoxDecoration(
                  // color: Color.fromRGBO(249, 239, 235, 1),
                  ),
              child: Text(
                'Loan Tracker',
                style: TextStyle(
                  // color: Color.fromARGB(255, 26, 25, 25),
                  fontSize: 24,
                ),
              ),
            );
          } else {
            // Return a ListTile widget for the other items
            return _buildMenuItem(
              icon: menuItems[index - 1]['icon'],
              title: menuItems[index - 1]['title'],
              onTap: menuItems[index - 1]['onTap'],
            );
          }
        },
      ),
    );
  }

  // A method that returns a ListTile widget with the given parameters
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
      // focusColor: const Color.fromRGBO(249, 239, 235, 1),
    );
  }
}
