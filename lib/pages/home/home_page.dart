import 'package:flutter/material.dart';
import 'package:lightbite/models/address_model.dart';
import 'package:lightbite/models/restaurant_model.dart';
import 'package:lightbite/pages/home/widgets/restaurant_card_widget.dart';

class HomePage extends StatelessWidget {
  final String defaultInstruction = 'Please Set Your Address';
  final List<RestaurantModel> restaurants;
  final List<AddressModel> favouritePlaces;
  final int selectedFavouritePlace;
  final Function changeFavouritePlace;
  const HomePage(
      {super.key,
      required this.restaurants,
      required this.favouritePlaces,
      required this.selectedFavouritePlace,
      required this.changeFavouritePlace});

  void showFavouritePlaceModal(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          padding: const EdgeInsets.all(8),
          children: favouritePlaces
              .map((place) => RadioListTile(
                    groupValue: selectedFavouritePlace,
                    onChanged: (value) => changeFavouritePlace(value),
                    value: favouritePlaces.indexOf(place),
                    title: Text(
                      place.name!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      place.getFullAddress!,
                      style: const TextStyle(fontSize: 10),
                    ),
                  ))
              .toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            showFavouritePlaceModal(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SelectionContainer.disabled(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    favouritePlaces.isNotEmpty
                        ? favouritePlaces[selectedFavouritePlace].getName!
                        : defaultInstruction,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    favouritePlaces.isNotEmpty
                        ? favouritePlaces[selectedFavouritePlace]
                            .getFullAddress!
                        : "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
            ),
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
                padding: const EdgeInsets.all(20),
                mainAxisSpacing: 10,
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
