import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tourism_project/business_logic/dynamicTrip/update_trip/update_trip_cubit.dart';
import 'package:tourism_project/business_logic/flight/searchFlight_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/dynamic_booking_details_model.dart';
import 'package:tourism_project/data/models/going_and_return_plane_trip.dart';
import 'package:tourism_project/data/models/going_plane_trip.dart';

class CustomFlight extends StatefulWidget {
  const CustomFlight(
      {super.key,
      required this.header,
      required this.planeName,
      required this.price,
      required this.source,
      required this.destination,
      required this.isEdit,
      required this.returnEdit,
      required this.model});

  final String header;
  final String planeName;
  final String price;
  final String source;
  final String destination;
  final bool isEdit; //for add plane does not exist
  final bool returnEdit; //for just plane change
  final DataModel? model;

  @override
  State<CustomFlight> createState() => _CustomFlightState();
}

class _CustomFlightState extends State<CustomFlight> {
  List<ReturnTrip>? returnFlightList;
  List<GoingTrip>? goingFlightList;
  List<GoingPlaneTrip> goingPlaneTrip = [];
  String errMessage = '';
  String returnPaneName = '';
  String going = '';
  bool isChange = false;

  @override
  Widget build(BuildContext context) {
    context.read<SearchFlightCubit>().getallPlaneTripGoingAndReturn(
        country_source_id: widget.model!.dynamicTrip!.sourceTripId!.toString(),
        country_destination_id:
            widget.model!.dynamicTrip!.destinationTripId!.toString(),
        flight_date: widget.model!.dynamicTrip!.endDate!);
    context.read<SearchFlightCubit>().getallPlaneTripGoingAndReturn(
        country_source_id: widget.model!.dynamicTrip!.sourceTripId!.toString(),
        country_destination_id:
            widget.model!.dynamicTrip!.destinationTripId!.toString(),
        flight_date: widget.model!.dynamicTrip!.startDate!);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: BlocConsumer<SearchFlightCubit, SearchFlightState>(
        listener: (context, state) {
          if (state is SearchFlightSuccess) {
            returnFlightList = (state).goingAndReturnPlaneTrip!.data.returnTrip;
            goingFlightList = (state).goingAndReturnPlaneTrip!.data.goingTrip;
          }
          if (state is SearchFlightFailure) {
            errMessage = (state).errMessage;
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.header,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17.5),
                      ),
                      Text(
                        !isChange
                            ? widget.planeName
                            : widget.header == 'Going Trip : '
                                ? going
                                : returnPaneName,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  widget.isEdit
                      ? GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                showDragHandle: true,
                                enableDrag: true,
                                useSafeArea: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return state is SearchFlightSuccess
                                      ? Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                flex: 30,
                                                child: Container(
                                                  child: ListView.builder(
                                                      itemCount: widget
                                                                  .header ==
                                                              'Going Trip : '
                                                          ? goingFlightList!
                                                              .length
                                                          : returnFlightList!
                                                              .length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return widget.header ==
                                                                'Going Trip : '
                                                            ? goingRoundCard(
                                                                goingFlightList![
                                                                    index],
                                                                index)
                                                            : returnRoundCard(
                                                                returnFlightList![
                                                                    index],
                                                                index);
                                                      }),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : const Center(
                                          child: CircularProgressIndicator());
                                });
                          },
                          child: Row(
                            children: [
                              Icon(
                                Iconsax.add_circle_copy,
                                size: 20,
                                color: widget.header == 'Going Trip : '
                                    ? Colors.red
                                    : AppColor.primaryColor,
                              ),
                              Text(
                                " Add",
                                style: TextStyle(color: AppColor.primaryColor),
                              )
                            ],
                          ),
                        )
                      : widget.price == ""
                          ? Container()
                          : widget.returnEdit
                              ? GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        enableDrag: true,
                                        useSafeArea: true,
                                        context: context,
                                        builder: (BuildContext context) {
                                          return state is SearchFlightSuccess
                                              ? Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 15),
                                                  child: ListView.builder(
                                                      itemCount:
                                                          returnFlightList!
                                                              .length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return returnRoundCard(
                                                            returnFlightList![
                                                                index],
                                                            index);
                                                      }),
                                                )
                                              : Center(
                                                  child:
                                                      const CircularProgressIndicator());
                                        });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Iconsax.add_circle_copy,
                                        size: 20,
                                        color: AppColor.primaryColor,
                                      ),
                                      Text(
                                        " Edit",
                                        style: TextStyle(
                                            color: AppColor.primaryColor),
                                      )
                                    ],
                                  ),
                                )
                              : Text(
                                  "\$ ${widget.price}",
                                  style: const TextStyle(fontSize: 15),
                                )
                ],
              ),
              widget.planeName == "empty"
                  ? Container()
                  : const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Row(children: [
                      widget.source == ""
                          ? Container()
                          : const Icon(
                              Icons.circle,
                              color: Colors.grey,
                              size: 18,
                            ),
                      Text(
                        "  ${widget.source}",
                        style: const TextStyle(fontSize: 18),
                      )
                    ]),
                  ),
                  Container(
                    child: Row(children: [
                      widget.destination == ""
                          ? Container()
                          : const Icon(
                              Icons.circle,
                              color: Colors.grey,
                              size: 18,
                            ),
                      Text(
                        "  ${widget.destination}",
                        style: const TextStyle(fontSize: 18),
                      )
                    ]),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }

  Widget returnRoundCard(ReturnTrip returnList, int index) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      returnList.plane.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColor.primaryColor),
                    ),
                    Text(returnList.flightDate)
                  ],
                ),
                const SizedBox(height: 10),
                //  const Text("name airpot : dimashq"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          returnList.airportSource.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(returnList.countrySource.name),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          returnList.airportDestination.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(returnList.countryDestination.name),
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
                          'Duration',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(returnList.flight_duration),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Ticket Price',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('\$ ${returnList.currentPrice}')
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      returnPaneName = returnFlightList![index].plane.name;
                      context.read<UpdateTripCubit>().newReturn =
                          returnFlightList![index].id.toString();
                      isChange = true;
                      print(returnFlightList![index].id);
                      context.pop();
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: AppColor.thirdColor.withAlpha(35),
                        //  const Color.fromARGB(255, 202, 208, 209),
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(width: 1, color: AppColor.primaryColor)),
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

  Widget goingRoundCard(GoingTrip goingPlane, int index) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      goingPlane.plane.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColor.primaryColor),
                    ),
                    Text(goingPlane.flightDate)
                  ],
                ),
                const SizedBox(height: 10),
                //  const Text("name airpot : dimashq"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          goingPlane.airportSource.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          goingPlane.countrySource.name,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          goingPlane.airportDestination.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          goingPlane.countryDestination.name,
                        ),
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
                          'Duration',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          goingPlane.flight_duration,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Ticket Price',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('\$ ${goingPlane.currentPrice}')
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      going = goingFlightList![index].plane.name;
                      context.read<UpdateTripCubit>().newGoing =
                          goingFlightList![index].id.toString();
                      isChange = true;
                      print(goingFlightList![index].id);
                      context.pop();
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: AppColor.thirdColor.withAlpha(35),
                        //  const Color.fromARGB(255, 202, 208, 209),
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(width: 1, color: AppColor.primaryColor)),
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
