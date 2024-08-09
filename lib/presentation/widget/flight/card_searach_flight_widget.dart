import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';

import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/going_and_return_plane_trip.dart';
import 'package:tourism_project/data/models/going_plane_trip.dart';

// ignore: must_be_immutable
class WidgetSearchFlight extends StatefulWidget {
  WidgetSearchFlight(
      {@required this.goingPlaneTrip,
      @required this.goingTrip,
      @required this.returnTrip,
      @required this.goingId,
      @required this.returnId,
      @required this.onePlane,
      required this.isTrip,
      required this.departflight,
      required this.round,
      super.key});
  GoingTrip? goingTrip;
  ReturnTrip? returnTrip;
  GoingPlaneTrip? goingPlaneTrip;
  String? goingId;
  String? returnId;
  String? onePlane;
  bool departflight;
  bool round;
  bool isTrip;

  @override
  State<WidgetSearchFlight> createState() => _WidgetSearchFlightState();
}

class _WidgetSearchFlightState extends State<WidgetSearchFlight> {
  bool isTapped = false;
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
                widget.isTrip
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Text(
                              " ${widget.round ? widget.departflight ? widget.goingTrip?.plane.name : widget.returnTrip?.plane.name : widget.goingPlaneTrip?.plane.name}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: AppColor.primaryColor),
                            ),
                            Text(widget.goingPlaneTrip!.flightDate)
                          ])
                    : Center(
                        child: Text(
                          " ${widget.round ? widget.departflight ? widget.goingTrip?.plane.name : widget.returnTrip?.plane.name : widget.goingPlaneTrip?.plane.name}",
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
                          '${widget.round ? widget.departflight ? widget.goingTrip?.airportSource.name : widget.returnTrip?.airportSource.name : widget.goingPlaneTrip?.airportSource.name}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                            '${widget.round ? widget.departflight ? widget.goingTrip?.countrySource.name : widget.returnTrip?.countrySource.name : widget.goingPlaneTrip?.countrySource.name}'),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '${widget.round ? widget.departflight ? widget.goingTrip?.airportDestination.name : widget.returnTrip?.airportDestination.name : widget.goingPlaneTrip?.airportDestination.name}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                            "${widget.round ? widget.departflight ? widget.goingTrip?.countryDestination.name : widget.returnTrip?.countryDestination.name : widget.goingPlaneTrip?.countryDestination.name}"),
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
                            '${widget.round ? widget.departflight ? widget.goingTrip?.flightDate : widget.returnTrip?.flightDate : widget.goingPlaneTrip?.flightDate}'),
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
                            '${widget.round ? widget.departflight ? widget.goingTrip?.landingDate : widget.returnTrip?.landingDate : widget.goingPlaneTrip?.landingDate}'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                //! chang this row if it trip
                !widget.isTrip
                    ? Row(
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
                                        fontSize: 22,
                                        color: AppColor.primaryColor),
                                  ),
                                  Text(
                                    '${widget.round ? widget.departflight ? widget.goingTrip?.currentPrice : widget.returnTrip?.currentPrice : widget.goingPlaneTrip?.currentPrice}',
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
                                  '/flightDetails/${widget.round ? widget.departflight ? widget.goingTrip?.id : widget.returnTrip?.id : widget.goingPlaneTrip?.id}');
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
                    : GestureDetector(
                        onTap: () {
                          print(
                              "var flight = context.read<DynamicTripCubit>();");
                          onePlaneId = widget.onePlane ?? '';
                          goingPlaneId = widget.goingId ?? '';
                          returnPlaneId = widget.returnId ?? '';
                          //  Navigator.pop(context);
                          setState(() {
                            isTapped = !isTapped;
                          });
                          print(isTapped);
                          print(
                              "one $onePlaneId   going $goingPlaneId return $returnPlaneId");
                          // var flight =
                          //     BlocProvider.of<DynamicTripCubit>(context);
                          // print("=============${flight.startDate}");
                          // flight.plane_trip_id = goingId ?? '1';
                          // flight.plane_trip_away_id = returnId ?? '1';
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: !isTapped
                                  ? AppColor.thirdColor.withAlpha(35)
                                  : Color.fromARGB(255, 202, 208, 209),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1, color: AppColor.primaryColor)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 10),
                            child: Text(
                              'Tap to Select',
                              style: TextStyle(
                                  fontFamily: 'Philosopher',
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryColor),
                            ),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
