import 'package:flutter/material.dart';
import 'package:finance_loan/frontend/nav-icons/page_option.dart';
import 'package:finance_loan/frontend/nav/navigation_drawer.dart';
import 'package:finance_loan/frontend/screens/home.dart';
import 'package:finance_loan/frontend/screens/transactions.dart';
import 'package:finance_loan/frontend/screens/inventory.dart';
import 'package:finance_loan/frontend/screens/new_loan.dart';
import 'package:finance_loan/frontend/screens/notifications.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(destinations[screenIndex].label),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 8, 8, 8),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 35,
              
            ),
            onPressed: () {},
          )
        ],
      ),
      body: _buildPage(),
      drawer: const NavigationDrawerExample(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black, // Set the selected item label color
        // unselectedItemColor: Colors.black.withOpacity(0.9),
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        selectedLabelStyle: const TextStyle(fontSize: 9.0),
        currentIndex: screenIndex,
        onTap: handleScreenChanged,
        elevation: 0,
        items: destinations.map((PageOption destination) {
          return BottomNavigationBarItem(
            backgroundColor: const Color.fromRGBO(237, 225, 255, 1),
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
        return const NewLoanPage();
      case 4:
        return TransactionChart();
      default:
        return Container();
    }
  }
}
