import 'package:flutter/material.dart';
import 'package:lightbite/models/restaurant_model.dart';

class RestaurantCardWidget extends StatelessWidget {
  final RestaurantModel restaurant;

  const RestaurantCardWidget({
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
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: double.infinity,
                height: 100,
                child: Image.network(restaurant.imageUrl),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Text(
                restaurant.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Wrap(
                spacing: 5.0,
                runSpacing: 0.0,
                children: restaurant.foodTags
                    .map(
                      (tag) => Text(
                        '#$tag',
                        style: const TextStyle(
                          fontSize: 9,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
