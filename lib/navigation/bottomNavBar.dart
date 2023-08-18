import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPageIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const List<NavigationDestination> destinations = [
      NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
      NavigationDestination(icon: Icon(Icons.mail), label: 'Notification'),
      NavigationDestination(icon: Icon(Icons.people), label: 'Profile')
    ];
    return NavigationBar(
      onDestinationSelected: _onItemTapped,
      destinations: destinations,
      selectedIndex: currentPageIndex,
    );
  }
}
