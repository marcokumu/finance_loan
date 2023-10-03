import 'package:finance_loan/frontend/nav-icons/page_option.dart';
import 'package:finance_loan/frontend/screens/new_loan.dart';
import 'package:finance_loan/frontend/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:finance_loan/frontend/nav/navigation_drawer.dart';
import 'package:finance_loan/frontend/screens/home.dart';
import 'package:finance_loan/frontend/screens/transactions.dart';
import 'package:finance_loan/frontend/screens/inventory.dart';
import 'package:finance_loan/frontend/screens/notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ionicons/ionicons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _currentIndex = 0;

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      _currentIndex = selectedScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final String? photoURL = user?.photoURL;
    final String profileImageUrl = photoURL ?? 'assets/images/user.png';

    // Custom AppBar for the Home page
    final customAppBar = AppBar(
      centerTitle: true,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(
            Ionicons.menu_outline,
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
        const SizedBox(
          width: 10,
        )
      ],
    );

    return Scaffold(
      appBar: _currentIndex == 0 ? customAppBar : null,
      body: _buildPage(),
      drawer: const NavigationDrawerExample(),
      // extendBody: true, // add this line

      bottomNavigationBar:
           SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            curve: Curves.easeOutQuint,
            duration: const Duration(milliseconds: 600),
            items: destinations.map((destination) {
              return SalomonBottomBarItem(
                icon: destination.icon,
                title: Text(destination.label),
                // selectedColor: Colors.purple, // Customize the selected color
              );
            }).toList(),
            backgroundColor: Colors.white.withOpacity(0.5),

          ),
        );


  }

  Widget _buildPage() {
    switch (_currentIndex) {
      case 0:
        return const Home(
          userId: '',
        );
      case 1:
        return const Transactions();
      case 2:
        return SearchTransitionDemo();
      case 3:
        return const Notify();
      case 4:
        return NotificationPage();
      default:
        return Container();
    }
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
}
