import 'package:flutter/material.dart';
import 'package:lightbite/models/address_model.dart';
import 'package:lightbite/models/restaurant_model.dart';
import 'package:lightbite/pages/home/widgets/restaurant_card_widget.dart';

const String defaultInstruction = 'Please Set Your Address';

class HomePage extends StatelessWidget {
  final List<RestaurantModel> restaurants;
  final List<AddressModel> favouritePlaces;
  final int selectedFavouritePlaceIndex;
  final Function onChangeFavouritePlace;

  const HomePage(
      {super.key,
      required this.restaurants,
      required this.favouritePlaces,
      required this.selectedFavouritePlaceIndex,
      required this.onChangeFavouritePlace});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ListView(
                            padding: const EdgeInsets.all(8),
                            children: favouritePlaces
                                .map((place) => RadioListTile(
                                      groupValue: selectedFavouritePlaceIndex,
                                      onChanged: (value) =>
                                          onChangeFavouritePlace(value),
                                      value: favouritePlaces.indexOf(place),
                                      title: Text(
                                        place.name!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        place.getFullAddress!,
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        FilledButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                          label: const Text("Add New Place"),
                        ),
                      ],
                    ),
                  );
                });
              },
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                favouritePlaces.isNotEmpty
                    ? favouritePlaces[selectedFavouritePlaceIndex].getName!
                    : defaultInstruction,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                favouritePlaces.isNotEmpty
                    ? favouritePlaces[selectedFavouritePlaceIndex]
                        .getFullAddress!
                    : "",
                style: const TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ],
          ),
        ),
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
                padding: const EdgeInsets.all(10),
                mainAxisSpacing: 5,
                childAspectRatio: 1,
                children: restaurants
                    .map((restaurant) =>
                        RestaurantCardWidget(restaurant: restaurant))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
