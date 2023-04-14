import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({ Key? key }) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context){
    var navigator = Navigator.of(context);

    var theme = Theme.of(context);

    const unselectedColor = Color.fromARGB(255, 0xC6, 0xC6, 0xC6);
    final selectedColor = theme.primaryColor;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
      iconSize: 26,
      backgroundColor: const Color.fromARGB(255, 0xF9, 0xF9, 0xF9),
      selectedItemColor: selectedColor,
      unselectedItemColor: unselectedColor,
      selectedLabelStyle: theme.textTheme.labelSmall,
      unselectedLabelStyle: theme.textTheme.labelSmall,
      selectedIconTheme: IconThemeData(
        shadows: [
          Shadow(
            color: Color.fromARGB(235, 228, 222, 255),
            offset: Offset.fromDirection(40 * pi/180, 3),
          ),
        ],
      ),
      items: [
        _navbarItem("主頁", Icons.home, theme),
        _navbarItem("預約", Icons.watch_later_outlined, theme),
        _navbarItem("記錄", Icons.receipt_outlined, theme),
        _navbarItem("個人", Icons.person_outline_rounded, theme),
      ],
    );
  }

  BottomNavigationBarItem _navbarItem(
    String label,
    IconData icon,
    ThemeData theme,
  ) {
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(icon),
    );
  }

  _onItemTapped(int selectedIndex) {
    setState(() {
      _selectedIndex = selectedIndex;
    });
  }
}