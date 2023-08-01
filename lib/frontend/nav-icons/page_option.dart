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
        Icons.home_outlined,
        color: Colors.black,
      ),
      Icon(
        Icons.home,
        color: Colors.black,
      )),
  PageOption(
      'Transactions',
      Icon(
        Icons.wallet_outlined,
        color: Colors.black,
      ),
      Icon(
        Icons.wallet_outlined,
        color: Colors.black,
      )),
  PageOption(
      'Inventory',
      Icon(
        Icons.text_snippet_outlined,
        color: Colors.black,
      ),
      Icon(
        Icons.text_snippet,
        color: Colors.black,
      )),
  PageOption(
      'New Loan',
      Icon(
        Icons.local_atm_outlined,
        color: Colors.black,
      ),
      Icon(
        Icons.local_atm,
        color: Colors.black,
      )),
  PageOption(
      'Notifications',
      Icon(
        Icons.notifications_outlined,
        color: Colors.black,
      ),
      Icon(
        Icons.notifications,
        color: Colors.black,
      )),
];
