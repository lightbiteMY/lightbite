import 'package:flutter/material.dart';
import 'package:lightbite/data/restaurant.dart';

class HomeTemplate extends StatelessWidget {
  final String address;
  final List<Restaurant> restaurants;
  const HomeTemplate({
    super.key,
    required this.address,
    required this.restaurants,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 120,
              title: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container();
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SelectionContainer.disabled(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          address,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: const TextStyle(
                              fontSize: 10, color: Colors.black),
                        ),
                        const Icon(Icons.edit_location_alt_outlined)
                      ],
                    ),
                  ),
                ),
              ),
              leading:
                  const IconButton(onPressed: null, icon: Icon(Icons.menu)),
              flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return const FlexibleSpaceBar(
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                  // to add a weather widget here

                  // title: Visibility(
                  //   visible: (constraints.maxHeight < 100) ? false : true,
                  //   child: const Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: 20.0),
                  //     child: SearchBar(
                  //       padding: MaterialStatePropertyAll(
                  //         EdgeInsets.symmetric(horizontal: 10.0),
                  //       ),
                  //       leading: Icon(Icons.search),
                  //     ),
                  //   ),
                  // ),
                );
              })),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Free Delivery Available',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100.0,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 180.0,
                    child: Card(
                      child: SizedBox(
                        width: 180.0,
                        height: 100,
                        child: Image.network(restaurants[index].imageUrl),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Exclusive Partners',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Image.network(restaurants[index].imageUrl),
                ),
                title: Text(restaurants[index].name),
              );
            }, childCount: restaurants.length),
          ),
        ],
      ),
    );
  }
}
