import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/business_logic/flight/searchFlight_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/going_and_return_plane_trip.dart';
import 'package:tourism_project/data/models/going_plane_trip.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/planesList_widget.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/round_plane_list.dart';

class FlightDynamicTrip extends StatefulWidget {
  const FlightDynamicTrip({super.key});

  @override
  State<FlightDynamicTrip> createState() => _FlightDynamicTripState();
}

class _FlightDynamicTripState extends State<FlightDynamicTrip> {
  String? _selectedOption;
  GoingAndReturnPlaneTrip? goingAndReturnPlaneTrip;
  List<GoingPlaneTrip> planesList = [];
  String planeType = '';
  String errMessage = '';
  bool isChoose = false;

  final List<String> _options = ['Round Trip', 'One Way Trip'];

  void singlePlaneList(
    BuildContext context,
    List<GoingPlaneTrip> singlTrip,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (BuildContext context) {
        return PlaneListWidget(singlTrip: singlTrip);
      },
    );
  }

  void roundPlaneList(
      BuildContext context, GoingAndReturnPlaneTrip something2) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: true,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        builder: (BuildContext context) {
          return RoundPlaneList(roundList: something2);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "How would you travel ?",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, fontFamily: 'normal'),
        ),
        const SizedBox(height: 10),
        isChoose
            ? const Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Color.fromARGB(255, 204, 47, 36),
                    size: 24,
                  ),
                  Text(
                    " Choose your Plane Type",
                    style: TextStyle(
                      color: Color.fromARGB(255, 204, 47, 36),
                    ),
                  )
                ],
              )
            : Container(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: _options.map((option) {
              return BlocConsumer<SearchFlightCubit, SearchFlightState>(
                listener: (context, state) {
                  if (state is SearchFlightSuccess) {
                    print("SearchFlightSuccess");
                    errMessage = '';
                    _selectedOption == 'Round Trip'
                        ? goingAndReturnPlaneTrip =
                            (state).goingAndReturnPlaneTrip
                        : planesList = (state).goingPlaneTrip!;

                    print(planesList);
                  }
                  if (state is SearchFlightFailure) {
                    errMessage = state.errMessage;
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Text(state.errMessage),
                    //   ),
                    // );
                  }
                },
                builder: (context, state) {
                  return RadioListTile<String>(
                    title: Text(option),
                    value: option,
                    groupValue: _selectedOption,
                    onChanged: (String? value) {
                      var params = context.read<DynamicTripCubit>();
                      print("round trip");
                      setState(() {
                        // state is SearchFlightFailure
                        //     ? errMessage = state.errMessage
                        //     : errMessage = '';
                        _selectedOption = value;
                        isChoose = false;
                        _selectedOption == 'Round Trip'
                            ? context
                                .read<SearchFlightCubit>()
                                .getallPlaneTripGoingAndReturn(
                                    country_source_id: params.sourceTripId,
                                    country_destination_id:
                                        params.destinationTripId,
                                    flight_date: params.startDate)
                            : context
                                .read<SearchFlightCubit>()
                                .getallPlaneTripGoing(
                                    country_source_id: params.sourceTripId,
                                    country_destination_id:
                                        params.destinationTripId,
                                    flight_date: params.startDate);
                      });
                    },
                  );
                },
              );
            }).toList(),
          ),
        ),
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
              color: AppColor.secondColor,
              border: Border.all(color: AppColor.primaryColor.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(15)),
          child: MaterialButton(
            elevation: 10,
            onPressed: () {
              // errMessage == '' ? null : showAlertDialog(context, errMessage);
              //! it sometimes make null exception
              //! it is because of not choose time
              //! buttom sheet have new tree widget
              if (_selectedOption != null) {
                _selectedOption == 'Round Trip'
                    ? errMessage == ''
                        ? roundPlaneList(context, goingAndReturnPlaneTrip!)
                        : showAlertDialog(context, errMessage)
                    : errMessage == ''
                        ? singlePlaneList(context, planesList)
                        : showAlertDialog(context, errMessage);
              } else {
                setState(() {
                  isChoose = true;
                });
              }
            },
            child: const Text(
              "-- Show Avaliable Planes --",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
