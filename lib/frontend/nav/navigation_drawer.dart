import 'package:finance_loan/frontend/login-page/signup_login.dart';
import 'package:finance_loan/frontend/widgets/home-widgets/transaction_expansion_tile.dart';
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
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } catch (e) {
      print("Error signing out: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('An error occurred while signing out.'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Define a list of menu items with their icons, titles, and onTap callbacks
    final List<Map<String, dynamic>> menuItems = [
      {
        'icon': Icons.insert_chart_rounded,
        'title': 'Statistical Analysis',
        'onTap': () {
          // Handle navigation to Home screen here
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TransactionChart(),
            ),
          );
          // Navigator.pop(context); // Close the drawer
        },
      },
      {
        'icon': Icons.account_tree_outlined,
        'title': 'Transactions',
        'onTap': () {
          // Handle navigation to Transactions screen here
          Navigator.pop(context); // Close the drawer
        },
      },
      // Add more menu items here
      {
        'icon': Icons.logout,
        'title': 'Logout',
        'onTap': () => _signOut(context), // Call _signOut when Logout is tapped
      },
    ];

    return Drawer(
      child: ListView.builder(
        itemCount: menuItems.length + 1, // Add one for the header
        itemBuilder: (context, index) {
          if (index == 0) {
            // Return the header widget for the first item
            return const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 168, 186, 201),
              ),
              child: Text(
                'Loan Tracker',
                style: TextStyle(
                  color: Colors.white,
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
    );
  }
}
