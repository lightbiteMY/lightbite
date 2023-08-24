import 'package:flutter/material.dart';

class HomeTemplate extends StatelessWidget {
  const HomeTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 100,
            ),
            SliverList(delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                child: Placeholder(),
              )
            },))
          ],
        ));
  }
}
