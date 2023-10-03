import 'package:flutter/material.dart';
import 'package:lightbite/pages/home/home_controller.dart';

class BottomNavBar extends StatefulWidget {
  final String title;
  const BottomNavBar({super.key, required this.title});

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<NavigationDestination> destinations = [
      const NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
      NavigationDestination(
          icon: Badge.count(
            count: 10,
            child: const Icon(Icons.mail),
          ),
          label: 'Notification'),
      const NavigationDestination(icon: Icon(Icons.person), label: 'Profile')
    ];
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        destinations: destinations,
        selectedIndex: currentPageIndex,
        // backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
        // surfaceTintColor: const Color.fromRGBO(230, 230, 230, 1),
      ),
      // backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
      body: <Widget>[
        const HomeController(),
        const HomeController(),
        const HomeController(),
      ][currentPageIndex],
    );
  }
}
