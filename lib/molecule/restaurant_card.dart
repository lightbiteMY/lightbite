import 'package:flutter/material.dart';
import 'package:lightbite/data/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                constraints: const BoxConstraints(
                  maxHeight: 120,
                  maxWidth: 300,
                ),
                alignment: Alignment.center,
                child: Image.network(restaurant.imageUrl),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                restaurant.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: restaurant.tags
                      .map(
                        (tag) => Chip(
                          label: Text(
                            tag,
                            style: const TextStyle(
                              fontSize: 9,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                )),
          ],
        ),
      ),
    );
  }
}
