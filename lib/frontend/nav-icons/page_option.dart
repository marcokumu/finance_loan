import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../services/darklight_mode_icon.dart';

class PageOption {
  const PageOption(this.label, this.icon);

  final String label;
  final Widget icon;
}

const List<PageOption> destinations = <PageOption>[
  PageOption('Home', DarkLightModeIcon(assetPath: 'assets/icons/house-chimney.svg', width: 24, height: 24)),
  PageOption('Trends',  DarkLightModeIcon(assetPath: 'assets/icons/stats.svg', width: 24, height: 24)),
  PageOption('Inventory', Icon(Ionicons.receipt_outline)),
  PageOption('New Loan', Icon(Ionicons.add_circle_outline)),
  PageOption('Alerts', Icon(Ionicons.notifications_outline)),
];
