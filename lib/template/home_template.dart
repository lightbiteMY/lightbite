import 'package:flutter/material.dart';
import 'package:lightbite/data/restaurant.dart';
import 'package:lightbite/molecule/restaurant_card.dart';

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
      appBar: AppBar(
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
                    style: const TextStyle(fontSize: 10, color: Colors.black),
                  ),
                  const Icon(Icons.edit_location_alt_outlined)
                ],
              ),
            ),
          ),
        ),
        leading: const IconButton(onPressed: null, icon: Icon(Icons.menu)),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: FilterChip(
                      label: const Text(
                        'Free Delivery Available',
                        style: TextStyle(fontSize: 9),
                      ),
                      onSelected: (value) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: FilterChip(
                      label: const Text(
                        'Exclusive Partners',
                        style: TextStyle(fontSize: 9),
                      ),
                      onSelected: (value) {},
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                padding: const EdgeInsets.all(20),
                mainAxisSpacing: 10,
                childAspectRatio: 1,
                children: restaurants
                    .map((restaurant) => RestaurantCard(restaurant: restaurant))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
