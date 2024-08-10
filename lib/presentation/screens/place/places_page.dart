import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/favorite/favorite_cubit.dart';
import 'package:tourism_project/business_logic/places/places_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/places_model.dart';
import 'package:tourism_project/presentation/widget/places/places_item.dart';

class PlacesPage extends StatefulWidget {
  const PlacesPage({super.key});

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  final searchcontroller = TextEditingController();

  List<Place> places = [];
  List<Place> searchedItem = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    context.read<PlacesCubit>().getAllPlace();
    // _categories = BlocProvider.of<PlacesCubit>(context).getAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlacesCubit, PlacesState>(listener: (context, state) {
      if (state is PlacesSuccess) {
        places = (state).placelist!;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("state.success")));
      }
      if (state is PlacesFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("state.fauil")));
      }
    }, builder: (context, state) {
      return Scaffold(
          appBar: isSearching ? searchedBarItem() : appBarItem(),
          body: Column(
            children: <Widget>[
              // SingleChildScrollView(
              //     scrollDirection: Axis.horizontal,
              //     child: Wrap(
              //       spacing: 100,
              //       children: [
              //         FutureBuilder<List<PlaceCategories>>(
              //           future: _categories,
              //           builder: (context, snapshot) {
              //             if (snapshot.hasData) {
              //               final categories = [
              //                 'All',
              //                 ...snapshot.data!.map((category) => category.name)
              //               ];
              //               return Row(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: categories.map((category) {
              //                   return FilterChip(
              //                     label: Text(category),
              //                     selected: _selectedCategory == category,
              //                     onSelected: (isSelected) {
              //                       setState(() {
              //                         _selectedCategory = category;
              //                       });
              //                     },
              //                   );
              //                 }).toList(),
              //               );
              //             } else if (snapshot.hasError) {
              //               return Text('Error: ${snapshot.error}');
              //             } else {
              //               return CircularProgressIndicator();
              //             }
              //           },
              //         ),
              //         // Display the filtered list of items
              //       ],
              //     )),
              Expanded(
                  child: state is PlacesSuccess
                      ? isSearching
                          ? searchedItem.isEmpty &&
                                  searchcontroller.text.isNotEmpty
                              ? const Center(
                                  child: Text(
                                  "No Result",
                                  style: TextStyle(fontSize: 25),
                                ))
                              : ListView.builder(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  itemCount: searchedItem.isNotEmpty
                                      ? searchedItem.length
                                      : places.length,
                                  itemBuilder: (context, index) {
                                    return BlocProvider(
                                      create: (context) => FavoriteCubit(),
                                      child: PlaceItem(
                                        place: searchedItem.isNotEmpty
                                            ? searchedItem[index]
                                            : places[index],
                                        placeCat: null,
                                      ),
                                    );
                                  })
                          : ListView.builder(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              itemCount: searchedItem.isNotEmpty
                                  ? searchedItem.length
                                  : places.length,
                              itemBuilder: (context, index) {
                                return BlocProvider(
                                  create: (context) => FavoriteCubit(),
                                  child: PlaceItem(
                                    place: searchedItem.isNotEmpty
                                        ? searchedItem[index]
                                        : places[index],
                                    placeCat: null,
                                  ),
                                );
                              })
                      : const Center(
                          child: CircularProgressIndicator(),
                        ))
            ],
          ));
    });
  }

  PreferredSizeWidget appBarItem() {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      title: const Text("Places"),
      actions: [
        GestureDetector(
          onTap: () {
            setState(() {
              isSearching = true;
            });
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.search),
          ),
        )
      ],
    );
  }

  PreferredSizeWidget searchedBarItem() {
    return AppBar(
      backgroundColor: AppColor.primaryColor,
      title: TextFormField(
        cursorColor: Colors.white,
        controller: searchcontroller,
        onChanged: (val) {
          addDataToFilteredList(input: val);
        },
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "search for Places",
            hintStyle: TextStyle(color: Colors.white)),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            setState(() {
              searchcontroller.text = ' ';
              searchedItem.clear();
            });
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.clear),
          ),
        )
      ],
    );
  }

  void addDataToFilteredList({required String input}) {
    setState(() {
      searchedItem = places
          .where((element) => element.name!.toLowerCase().startsWith(input))
          .toList();
    });
  }
}
