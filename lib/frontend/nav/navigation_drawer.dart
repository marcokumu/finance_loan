import 'package:finance_loan/frontend/login-page/signup_login.dart';
import 'package:finance_loan/frontend/screens/new_home.dart';
import 'package:finance_loan/frontend/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NavigationDrawerExample extends StatelessWidget {
  const NavigationDrawerExample({Key? key}) : super(key: key);

  // Function to handle user logout
  Future<void> _signOut(BuildContext context) async {
    print("Signing out...");
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate back to the login page
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    } catch (e) {
      print("Error signing out: $e");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('An error occurred while signing out.'),
        // backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // A list to define a menu of items with their icons, titles, and onTap callbacks
    final List<Map<String, dynamic>> menuItems = [
      {
        'icon': Icons.insert_chart_rounded,
        'title': 'Statistical Analysis',
        'onTap': () {
          Navigator.push(
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
          Navigator.push(
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingsPage(),
            ),
          );
        },
      },
      {
        'icon': Icons.notifications,
        'title': 'Notifications',
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingsPage(),
            ),
          );
        },
      },
      {
        'icon': Icons.settings,
        'title': 'Settings',
        'onTap': () {
          Navigator.push(
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingsPage(),
            ),
          );
        },
      },
      {
        'icon': Icons.logout,
        'title': 'Logout',
        'onTap': () => _signOut(context), // Call _signOut when Logout is tapped
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
