import 'package:flutter/material.dart';

class NavigationBarItem {
  final BottomNavigationBarItem header;

  final Widget content;

  NavigationBarItem({
    required this.header,
    required this.content,
  });
}
