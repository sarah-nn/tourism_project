import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tourism_project/business_logic/places/places_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/place_country_model.dart';
import 'package:tourism_project/data/models/places_model.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/pace_item_card_widget.dart';

class TestPage2 extends StatefulWidget {
  const TestPage2({
    super.key,
  });

  @override
  _TestPage2State createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  late Future<PlaceResponse> futureResponse;
  List<Place> places = [];

  @override
  void initState() {
    super.initState();
    futureResponse = context.read<PlacesCubit>().sarah();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1,
        title: Text(
          "Choose Places",
          style: MyTextStyle.headers
              .copyWith(color: Colors.black, fontSize: 28, letterSpacing: 1),
        ),
      ),
      backgroundColor: AppColor.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: Stack(children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 8),
                      child: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColor.secondColor.withOpacity(0.4),
                                const Color.fromARGB(255, 167, 206, 218),
                              ]),
                        ),
                        child: const Text(
                          "Tap to Select Places , submit below",
                          // then Submit it within the Buttom below ",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              height: 1.3),
                        ),
                      ),
                    ),
                    FutureBuilder<PlaceResponse>(
                      future: futureResponse,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final placesWithAreaNames =
                              snapshot.data!.areaPlaces.expand((areaPlace) {
                            return areaPlace.places.map((place) => {
                                  'placeName': place.name,
                                  'placeId': place.id,
                                  // 'placeImage': place.images[0] ?? null,
                                  'areaName': areaPlace.name,
                                });
                          }).toList();

                          return Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: placesWithAreaNames.length,
                              itemBuilder: (context, index) {
                                var placeWithAreaName =
                                    placesWithAreaNames[index];
                                final isSelected = placeIds
                                    .contains(placeWithAreaName['placeId']);
                                return PlaceItemCard(
                                    place: placeWithAreaName,
                                    isSelected: isSelected,
                                    onSelectedCountry: selectCountry);
                              },
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(child: Text('${snapshot.error}'));
                        }
                        return const Center(
                            child: Padding(
                          padding: EdgeInsets.only(top: 150),
                          child: CircularProgressIndicator(),
                        ));
                      },
                    ),
                  ],
                ),
              ),
            ]),
          ),
          buildSelectButton(context)
        ],
      ),
    );
  }

  Widget buildSelectButton(BuildContext context) {
    final label = 'Select ${placeIds.length} Places';

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      color: AppColor.primaryColor,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          minimumSize: Size.fromHeight(40),
          primary: Colors.white,
        ),
        child: Text(
          label,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        onPressed: () {
          context.pop(placeNames);
          //  Navigator.pop(context, placeNames);
          print(placeIds);
          print(placeNames);
        },
      ),
    );
  }

  void selectCountry(Map<String, dynamic> place) {
    final isSelected1 = placeIds.contains(place['placeId']);
    final isSelected2 = placeIds.contains(place['placeId']);
    setState(() => isSelected1
        ? placeIds.remove(place['placeId'])
        : placeIds.add(place['placeId']));
    setState(() => isSelected2
        ? placeNames.remove(place['placeName'])
        : placeNames.add(place['placeName']));
    print(placeIds);
  }
}

 
// import 'package:flutter/material.dart';
// import 'package:tourism_project/data/models/going_and_return_plane_trip.dart';
// import 'package:tourism_project/data/models/going_plane_trip.dart';

// class Test2Page extends StatefulWidget {
//   String? selectedOption;
//   String? planeType;
//   List<GoingPlaneTrip>? oneWayPlane;
//   List<GoingTrip>? goingTrip;
//   List<ReturnTrip>? returnTrip;
//   Test2Page(
//       {super.key,
//       this.oneWayPlane,
//       this.selectedOption,
//       this.planeType,
//       this.goingTrip,
//       this.returnTrip});

//   @override
//   State<Test2Page> createState() => _Test2PageState();
// }

// class _Test2PageState extends State<Test2Page> {
//   bool value = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: widget.selectedOption == "Round Trip"
//             ? Column(
//                 children: [
//                   Container(
//                     height: 50,
//                     child: Row(
//                       children: [
//                         Expanded(
//                             child: MaterialButton(
//                           onPressed: () {
//                             setState(() {
//                               value = false;
//                             });
//                           },
//                           color: Colors.green,
//                           child: const Text("Going Trip"),
//                         )),
//                         Expanded(
//                             child: MaterialButton(
//                           onPressed: () {
//                             setState(() {
//                               value = true;
//                             });
//                           },
//                           color: Colors.red,
//                           child: const Text("Return Trip"),
//                         ))
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: widget.planeType == 'gointTrip'
//                             ? widget.goingTrip?.length
//                             : widget.returnTrip?.length,
//                         itemBuilder: (context, index) {
//                           return Container(
//                               height: 50,
//                               color: Colors.amber,
//                               child: Column(
//                                 children: [
//                                   Text(
//                                     widget.planeType == 'gointTrip'
//                                         ? widget.goingTrip![index].plane.name
//                                         : widget.returnTrip![index].plane.name,
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                   Text("Aairports"),
//                                 ],
//                               ));
//                           // ListTile(
//                           // title: Text(value == 'gointTrip'
//                           //     ? goingTrip[index].plane.name
//                           //     : returnTrip[index].plane.name),
//                           //       subtitle: Row(),
//                           // );
//                         }),
//                   )
//                 ],
//               )
//             : ListView.builder(
//                 itemCount: widget.oneWayPlane?.length,
//                 itemBuilder: (context, index) {
//                   return const ListTile(
//                     title: Text("i wanna sth jsut"),
//                   );
//                 }));
//   }
// }
