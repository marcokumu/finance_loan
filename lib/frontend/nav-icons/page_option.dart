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
      ),
      Icon(
        Icons.home,
      )),
  PageOption(
      'Transactions',
      Icon(
        Icons.wallet,
      ),
      Icon(
        Icons.wallet,
      )),
  PageOption(
      'Inventory',
      Icon(
        Icons.text_snippet,
      ),
      Icon(
        Icons.text_snippet,
      )),
  PageOption(
      'New Loan',
      Icon(
        Icons.local_atm,
      ),
      Icon(
        Icons.local_atm,
      )),
  PageOption(
      'Notifications',
      Icon(
        Icons.notifications,
      ),
      Icon(
        Icons.notifications,
      )),
];
