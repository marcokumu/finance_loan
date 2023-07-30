import 'package:finance_loan/frontend/login-page/signup_login.dart';
import 'package:finance_loan/frontend/widgets/home-widgets/transaction_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
