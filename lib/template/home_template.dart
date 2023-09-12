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
                title: const Text(
                  'XX, JLN KAJANG 1, TAMAN ABC, 43000 KAJANG, SELANGOR',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
                leading:
                    const IconButton(onPressed: null, icon: Icon(Icons.menu)),
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  return FlexibleSpaceBar(
                    centerTitle: true,
                    expandedTitleScale: 1.0,
                    title: Visibility(
                      visible: (constraints.maxHeight < 100) ? false : true,
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  );
                })),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return const ListTile(
                  leading: CircleAvatar(child: Icon(Icons.person)),
                  title: Text('ABC'));
            }, childCount: 20)),
          ],
        ));
  }
}
