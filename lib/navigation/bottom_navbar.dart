import 'package:flutter/material.dart';
import 'package:lightbite/page/home_page.dart';

class BottomNavBar extends StatefulWidget {
  final String title;
  const BottomNavBar({super.key, required this.title});

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
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
      NavigationDestination(icon: Icon(Icons.person), label: 'Profile')
    ];
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: _onItemTapped,
        destinations: destinations,
        selectedIndex: currentPageIndex,
        backgroundColor: Color.fromRGBO(230, 230, 230, 1),
        surfaceTintColor: Color.fromRGBO(230, 230, 230, 1),
      ),
      backgroundColor: Color.fromRGBO(230, 230, 230, 1),
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Color.fromRGBO(230, 230, 230, 1),
        title: Text(widget.title),
      ),
      // body: <Widget>[
      // HomePage(),
      // HomePage(),
      // HomePage(),
      // ][currentPageIndex],
    );
  }
}
