import 'package:flutter/material.dart';

class PageOption {
  const PageOption(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const List<PageOption> destinations = <PageOption>[
  PageOption(
      'Home',
      Icon(
        Icons.home,
        // color: Color.fromARGB(255, 90, 87, 87),
      ),
      Icon(
        Icons.home,
        // color: Color.fromRGBO(191, 55, 33, 1),
      )),
  PageOption(
      'Transactions',
      Icon(
        Icons.wallet,
        // color: Color.fromARGB(255, 90, 87, 87),
      ),
      Icon(
        Icons.wallet,
        // color: Color.fromRGBO(191, 55, 33, 1),
      )),
  PageOption(
      'Inventory',
      Icon(
        Icons.text_snippet,
        // color: Color.fromARGB(255, 90, 87, 87),
      ),
      Icon(
        Icons.text_snippet,
        // color: Color.fromRGBO(191, 55, 33, 1),
      )),
  PageOption(
      'New Loan',
      Icon(
        Icons.local_atm,
        // color: Color.fromARGB(255, 90, 87, 87),
      ),
      Icon(
        Icons.local_atm,
        // color: Color.fromRGBO(191, 55, 33, 1),
      )),
  PageOption(
      'Notifications',
      Icon(
        Icons.notifications,
        // color: Color.fromARGB(255, 90, 87, 87),
      ),
      Icon(
        Icons.notifications,
        // color: Color.fromRGBO(191, 55, 33, 1),
      )),
];
