// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tourism_project/business_logic/search/country/search_country_cubit.dart';

// class TestPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search Places'),
//       ),
//       body: Column(
//         children: <Widget>[
//           TextField(
//             onChanged: (value) =>
//                 context.read<SearchCubit>().searchPlaces(value),
//             decoration: InputDecoration(
//               labelText: 'Search',
//               suffixIcon: Icon(Icons.search),
//             ),
//           ),
//           BlocBuilder<SearchCubit, SearchCountryState>(
//             builder: (context, state) {
//               if (state is SearchInitial) {
//                 return Text('Enter a search term to begin');
//               } else if (state is SearchLoading) {
//                 return CircularProgressIndicator();
//               } else if (state is SearchLoaded) {
//                 return Expanded(
//                   child: ListView.builder(
//                     itemCount: state.searchResults.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text(state.searchResults[index]['name']),
//                         // هنا يمكنك استخدام البيانات الأخرى من النتائج
//                       );
//                     },
//                   ),
//                 );
//               } else if (state is SearchEmpty) {
//                 return Text('No results found');
//               } else if (state is SearchError) {
//                 return Text(state.message);
//               } else {
//                 return Container(); // للحالات غير المتوقعة
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tourism_project/business_logic/search/country/search_country_cubit.dart';

// class TestPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search Places'),
//       ),
//       body: Column(
//         children: <Widget>[
//           TextField(
//             onChanged: (value) =>
//                 context.read<SearchCubit>().searchPlaces(value),
//             decoration: InputDecoration(
//               labelText: 'Search',
//               suffixIcon: Icon(Icons.search),
//             ),
//           ),
//           BlocBuilder<SearchCubit, SearchCountryState>(
//             builder: (context, state) {
//               if (state is SearchInitial) {
//                 return Text('Enter a search term to begin');
//               } else if (state is SearchLoading) {
//                 return CircularProgressIndicator();
//               } else if (state is SearchLoaded) {
//                 return Expanded(
//                   child: ListView.builder(
//                     itemCount: state.searchResults.length,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text(state.searchResults[index]['name']),
//                         // هنا يمكنك استخدام البيانات الأخرى من النتائج
//                       );
//                     },
//                   ),
//                 );
//               } else if (state is SearchEmpty) {
//                 return Text('No results found');
//               } else if (state is SearchError) {
//                 return Text(state.message);
//               } else {
//                 return Container(); // للحالات غير المتوقعة
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/places/places_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/places_depend_on_category_model.dart';
import 'package:tourism_project/data/models/places_model.dart';
import 'package:tourism_project/presentation/widget/places/get_all_places_widget.dart';
import 'package:tourism_project/presentation/widget/places/places_filterchip_widget.dart';
import 'package:tourism_project/presentation/widget/places/places_item.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final searchcontroller = TextEditingController();

  List<Place> searchedItem = [];
  bool isSearching = false;

  List<Place> places = [];
  List<PlaceDependOnCategoryModel> placesDependOnCategory = [];
  List<dynamic> placeCat = [];
  late Future<List<dynamic>> _categories;
  String _selectedCategory = 'All';
  int categoryId = -1;

  @override
  void initState() {
    super.initState();
    _categories = BlocProvider.of<PlacesCubit>(context).getAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlacesCubit, PlacesState>(listener: (context, state) {
      if (state is PlacesSuccess) {
        placesDependOnCategory = (state).placesCategory!;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("state.success")));
      }
      if (state is PlacesFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("state.fail")));
      }
    }, builder: (context, state) {
      return Scaffold(
          appBar: isSearching ? searchedBarItem() : appBarItem(),
          body: Column(
            children: <Widget>[
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 10,
                    child: Row(
                      children: [
                        FutureBuilder<List<dynamic>>(
                          future: _categories,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              placeCat = snapshot.data!;
                              return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: placeCat.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index == 0) {
                                      return FilterChipWidget(
                                          categoryName: "All",
                                          selectedCategory: _selectedCategory,
                                          setStatFunction: () => setState(() {
                                                _selectedCategory = "All";
                                              }));
                                    } else {
                                      final category = placeCat[index - 1];
                                      return FilterChipWidget(
                                          categoryName: category['name'],
                                          selectedCategory: _selectedCategory,
                                          setStatFunction: () => setState(() {
                                                _selectedCategory =
                                                    category['name'];
                                                categoryId = category['id'];
                                                context
                                                    .read<PlacesCubit>()
                                                    .placeDependOnCategory(
                                                        categoryId);
                                              }));
                                    }
                                  });
                            }
                            return Text('Error: ${snapshot.error}');
                          },
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  child: state is PlacesSuccess && _selectedCategory != 'All'
                      ? placesDependOnCategory.isNotEmpty
                          ? ListView.builder(
                              itemCount: placesDependOnCategory.length,
                              itemBuilder: (context, index) {
                                return PlaceItem(
                                    placeCat: placesDependOnCategory[index]);
                              })
                          : const Center(
                              child: Text("No Places Here"),
                            )
                      : const GetAllPlacesWidget())
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
