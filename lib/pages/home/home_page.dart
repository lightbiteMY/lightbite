import 'package:flutter/material.dart';
import 'package:lightbite/models/address_model.dart';
import 'package:lightbite/models/restaurant_model.dart';
import 'package:lightbite/pages/home/widgets/restaurant_card_widget.dart';

const String defaultInstruction = 'Please Set Your Address';
const int filterListLength = 5;

class HomePage extends StatelessWidget {
  final List<RestaurantModel> restaurants;
  final List<AddressModel> favouritePlaces;
  final List<String> filterList;
  final List<String> selectedFilterList;
  final int selectedFavouritePlaceIndex;
  final Function onChangeFavouritePlace;
  final Function onChangeFilter;

  const HomePage({
    super.key,
    required this.restaurants,
    required this.favouritePlaces,
    required this.filterList,
    required this.selectedFilterList,
    required this.selectedFavouritePlaceIndex,
    required this.onChangeFavouritePlace,
    required this.onChangeFilter,
  });

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
                    builder: (BuildContext context, StateSetter setModalState) {
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
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.05,
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(builder:
                            (BuildContext context, StateSetter setModalState) {
                          List<String> selectedFilterListinModal =
                              selectedFilterList;
                          return AlertDialog(
                            title: const Text('Filter'),
                            content: Wrap(
                              spacing: 10,
                              children: filterList
                                  .map(
                                    (option) => FilterChip(
                                        label: Text(option,
                                            style:
                                                const TextStyle(fontSize: 9)),
                                        selected: selectedFilterListinModal
                                            .contains(option),
                                        onSelected: (bool selected) {
                                          setModalState(() {
                                            if (selected) {
                                              selectedFilterListinModal
                                                  .add(option);
                                            } else {
                                              selectedFilterListinModal
                                                  .remove(option);
                                              if (selectedFilterListinModal
                                                  .isEmpty) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                        'At least 1 option must be selected! Defaulted to ${filterList[0]}'),
                                                  ),
                                                );
                                                selectedFilterListinModal
                                                    .add(filterList[0]);
                                              }
                                            }
                                          });
                                        }),
                                  )
                                  .toList(),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  onChangeFilter(selectedFilterListinModal);
                                },
                                child: const Text('Confirm'),
                              )
                            ],
                          );
                        });
                      },
                    );
                  },
                  child: ListTile(
                    leading: const Icon(Icons.filter_list),
                    title: Wrap(
                      spacing: 8,
                      runSpacing: 0,
                      children: selectedFilterList.length <= filterListLength
                          ? selectedFilterList
                              .map(
                                (option) => Text(
                                  '#$option',
                                  style: const TextStyle(fontSize: 9),
                                ),
                              )
                              .toList()
                          : selectedFilterList
                              .map(
                                (option) => Text(
                                  '#$option',
                                  style: const TextStyle(fontSize: 9),
                                ),
                              )
                              .toList()
                              .sublist(0, filterListLength),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ListTile(
                            title: const Text(
                              "Enjoy Lowest Promotion Rate as a new Merchant now!",
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text(
                              "Terms & Conditions applied",
                              style: TextStyle(fontSize: 8),
                            ),
                            trailing: FilledButton(
                              onPressed: () {},
                              child: const Text(
                                "Join Now",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GridView.count(
                      shrinkWrap: true,
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
