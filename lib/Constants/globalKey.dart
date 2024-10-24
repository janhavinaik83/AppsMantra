import 'package:flutter/material.dart';

final GlobalKey AboutKey = GlobalKey();
final GlobalKey ServicesKey = GlobalKey();
final GlobalKey WorkKey = GlobalKey();
final GlobalKey ContactKey = GlobalKey();

void scrollToSection(GlobalKey key) {
  if (key.currentContext != null) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}
