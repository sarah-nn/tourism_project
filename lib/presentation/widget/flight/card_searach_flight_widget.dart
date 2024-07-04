import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/going_and_return_plane_trip.dart';
import 'package:tourism_project/data/models/going_plane_trip.dart';

// ignore: must_be_immutable
class WidgetSearchFlight extends StatelessWidget {
  WidgetSearchFlight(
      {@required this.goingPlaneTrip,
      @required this.goingTrip,
      @required this.returnTrip,
      required this.departflight,
      required this.round,
      super.key});
  GoingTrip? goingTrip;
  ReturnTrip? returnTrip;
  GoingPlaneTrip? goingPlaneTrip;
  bool departflight;
  bool round;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 20,
        child: Container(
          // height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 0.6, color: AppColor.thirdColor),
            color: AppColor.secondColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    " ${round ? departflight ? goingTrip?.plane.name : returnTrip?.plane.name : goingPlaneTrip?.plane.name}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: AppColor.primaryColor),
                  ),
                ),
                const SizedBox(height: 10),
                //  const Text("name airpot : dimashq"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          '${round ? departflight ? goingTrip?.airportSource.name : returnTrip?.airportSource.name : goingPlaneTrip?.airportSource.name}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                            '${round ? departflight ? goingTrip?.countrySource.name : returnTrip?.countrySource.name : goingPlaneTrip?.countrySource.name}'),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '${round ? departflight ? goingTrip?.airportDestination.name : returnTrip?.airportDestination.name : goingPlaneTrip?.airportDestination.name}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                            "${round ? departflight ? goingTrip?.countryDestination.name : returnTrip?.countryDestination.name : goingPlaneTrip?.countryDestination.name}"),
                      ],
                    )
                  ],
                ),
                Center(
                  child: Image.asset(
                    width: double.infinity,
                    color: AppColor.primaryColor,
                    'assets/images/2.png',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Depart',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            '${round ? departflight ? goingTrip?.flightDate : returnTrip?.flightDate : goingPlaneTrip?.flightDate}'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Arrive',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                            '${round ? departflight ? goingTrip?.landingDate : returnTrip?.landingDate : goingPlaneTrip?.landingDate}'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "The cost :",
                          style: TextStyle(
                              backgroundColor:
                                  Color.fromARGB(255, 236, 168, 163),
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              ' \$',
                              style: TextStyle(
                                  fontSize: 22, color: AppColor.primaryColor),
                            ),
                            Text(
                              '${round ? departflight ? goingTrip?.currentPrice : returnTrip?.currentPrice : goingPlaneTrip?.currentPrice}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.fifeColor,
                                  fontSize: 17),
                            ),
                          ],
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(
                            '/flightDetails/${round ? departflight ? goingTrip?.id : returnTrip?.id : goingPlaneTrip?.id}');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.thirdColor.withAlpha(35),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1, color: AppColor.primaryColor)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          child: Text(
                            'more details...',
                            style: TextStyle(
                                fontFamily: 'Philosopher',
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryColor),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
