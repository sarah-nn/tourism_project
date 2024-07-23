import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/flight/searchFlight_cubit.dart';

import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/info_user.dart';
import 'package:tourism_project/data/models/going_and_return_plane_trip.dart';
import 'package:tourism_project/data/models/going_plane_trip.dart';
import 'package:tourism_project/presentation/widget/flight/card_searach_flight_widget.dart';

class SearchFlightPage extends StatefulWidget {
  SearchFlightPage({super.key});

  @override
  State<SearchFlightPage> createState() => _SearchFlightPageState();
}

class _SearchFlightPageState extends State<SearchFlightPage> {
  bool departTripFlight = true;
  GoingAndReturnPlaneTrip? goingAndReturnPlaneTrip;
  List<GoingPlaneTrip> goingPlaneTrip = [];

  @override
  void initState() {
    super.initState();
    User.round
        ? context.read<SearchFlightCubit>().getallPlaneTripGoingAndReturn(
            country_source_id: User.countrySourceIdflight.toString(),
            country_destination_id: User.countryDestinationIdflight.toString(),
            flight_date: User.departFlight)
        : context.read<SearchFlightCubit>().getallPlaneTripGoing(
            country_source_id: User.countrySourceIdflight.toString(),
            country_destination_id: User.countryDestinationIdflight.toString(),
            flight_date: User.departFlight);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchFlightCubit, SearchFlightState>(
        listener: (context, state) {
      if (state is SearchFlightSuccess) {
        //  Hotel = (state).HotelList;
        User.round
            ? goingAndReturnPlaneTrip = (state).goingAndReturnPlaneTrip
            : goingPlaneTrip = (state).goingPlaneTrip!;
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("state.success")));
      }
      if (state is SearchFlightFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("state.fauil")));
      }
    }, builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor,
            centerTitle: true,
            title: const Text(
              'Select Flight',
              style: TextStyle(
                fontFamily: 'Philosopher',
              ),
            ),
            elevation: 0,
          ),
          backgroundColor: AppColor.primaryColor,
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: Stack(children: [
                  Image.asset('assets/images/search_flight.png',
                      color: AppColor.secondColor),
                ]),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      User.round
                          ? Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Expanded(
                                    // flex: 2,
                                    // child: WidgetListTileComplete(
                                    //   enableIconButton: false,
                                    //   selectedColor: AppColor.primaryColor,
                                    //   enableCenterText: true,
                                    //   enableIcon: false,
                                    //   selected: departTripFlight,
                                    //   text: 'Depart',
                                    //   style: const TextStyle(
                                    //       fontWeight: FontWeight.bold),
                                    //   onTap: () {
                                    //     setState(() {
                                    //       departTripFlight = true;
                                    //     });
                                    //   },
                                    // ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, right: 12),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            departTripFlight = true;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                AppColor.secondColor,
                                                const Color(0xff6daffa),
                                                const Color(0xff9ce3f8),
                                              ]),
                                              color: departTripFlight
                                                  ? AppColor.primaryColor
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(30)),

                                          //  elevation: 0,
                                          child: Padding(
                                            padding: const EdgeInsets.all(12),
                                            child: Center(
                                              child: Text(
                                                'DEPART',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontFamily: 'Poppins',
                                                    color: departTripFlight
                                                        ? Colors.white
                                                        : Colors.black54,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    //  flex: 2,
                                    // child: WidgetListTileComplete(
                                    //   enableIconButton: false,
                                    //   selectedColor: AppColor.primaryColor,
                                    //   enableCenterText: true,
                                    //   enableIcon: false,
                                    //   selected: !departTripFlight,
                                    //   text: 'Return',
                                    //   style: const TextStyle(
                                    //       fontWeight: FontWeight.bold),
                                    //   onTap: () {
                                    //     setState(() {
                                    //       departTripFlight = false;
                                    //     });
                                    //   },
                                    // ),

                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, right: 12),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            departTripFlight = false;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                                AppColor.secondColor,
                                                const Color(0xff6daffa),
                                                const Color(0xff9ce3f8),
                                              ]),
                                              color: !departTripFlight
                                                  ? AppColor.primaryColor
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(30)),

                                          //  elevation: 0,
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Center(
                                              child: Text(
                                                'RETURN',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontFamily: 'Poppins',
                                                    color: !departTripFlight
                                                        ? Colors.white
                                                        : Colors.black54,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Expanded(
                              flex: 1,
                              child: Center(
                                child: Text(
                                  "${goingPlaneTrip.length} Flight Avilable",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'normal',
                                      fontSize: 18),
                                ),
                              ),
                            ),
                      Expanded(
                          flex: 8,
                          child: state is SearchFlightSuccess
                              ? User.round
                                  ? ListView.builder(
                                      itemCount: departTripFlight
                                          ? goingAndReturnPlaneTrip
                                              ?.data.goingTrip.length
                                          : goingAndReturnPlaneTrip
                                              ?.data.returnTrip.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return departTripFlight
                                            ? WidgetSearchFlight(
                                                isTrip: false,
                                                round: User.round,
                                                departflight: departTripFlight,
                                                goingTrip:
                                                    goingAndReturnPlaneTrip
                                                        ?.data.goingTrip[index],
                                                goingPlaneTrip: null,
                                                returnTrip: null,
                                              )
                                            : WidgetSearchFlight(
                                                isTrip: false,
                                                round: User.round,
                                                departflight: departTripFlight,
                                                returnTrip:
                                                    goingAndReturnPlaneTrip
                                                        ?.data
                                                        .returnTrip[index],
                                                goingPlaneTrip: null,
                                                goingTrip: null,
                                              );
                                      },
                                    )
                                  : ListView.builder(
                                      itemCount: goingPlaneTrip.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return WidgetSearchFlight(
                                          isTrip: false,
                                          round: User.round,
                                          departflight: false,
                                          goingPlaneTrip: goingPlaneTrip[index],
                                          goingTrip: null,
                                          returnTrip: null,
                                        );
                                      })
                              : const Center(
                                  child: CircularProgressIndicator(),
                                ))
                    ],
                  ),
                ),
              ),
            ],
          ));
    });
  }
}
