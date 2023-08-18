import 'package:flutter/material.dart';

class HomeTemplate extends StatelessWidget {
  const HomeTemplate({
    super.key,
    required this.title,
    required this.currentPageIndex,
    required this.onDestinationSelected,
  });

  final String title;
  final int currentPageIndex;
  final Function onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            onDestinationSelected(index);
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.mail), label: 'Notification'),
            NavigationDestination(icon: Icon(Icons.people), label: 'Profile')
          ],
        ),
        body: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have clicked the button this many times:',
                ),
                Text(
                  '1',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Notification',
                ),
                Text(
                  '2',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Profile',
                ),
                Text(
                  '3',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ][currentPageIndex]);
  }
}
