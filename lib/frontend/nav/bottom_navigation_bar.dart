import 'package:finance_loan/frontend/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:finance_loan/frontend/nav-icons/page_option.dart';
import 'package:finance_loan/frontend/nav/navigation_drawer.dart';
import 'package:finance_loan/frontend/screens/home.dart';
import 'package:finance_loan/frontend/screens/transactions.dart';
import 'package:finance_loan/frontend/screens/inventory.dart';
import 'package:finance_loan/frontend/screens/notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int screenIndex = 0;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  void handleProfileIconTap() {
    // Custom transition for the profile page
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const SettingsPage();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(begin: begin, end: end);
          var curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );

          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final String profileImageUrl = user?.photoURL ?? '';

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              size: 30,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              handleProfileIconTap();
            },
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(profileImageUrl),
            ),
          ),
        ],
      ),
      body: _buildPage(),
      drawer: const NavigationDrawerExample(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: screenIndex,
        onTap: handleScreenChanged,
        items: destinations.map((PageOption destination) {
          return BottomNavigationBarItem(
            label: destination.label,
            icon: destination.icon,
            activeIcon: destination.selectedIcon,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPage() {
    switch (screenIndex) {
      case 0:
        return const Home(
          userId: '',
        );
      case 1:
        return const Transactions();
      case 2:
        return const Inventory();
      case 3:
      // return const NewLoanPage();
      case 4:
        return TransactionChart();
      default:
        return Container();
    }
  }
}
