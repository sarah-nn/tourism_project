import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tourism_project/business_logic/flight/detailsTrip_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/going_plane_trip.dart';
import 'package:tourism_project/presentation/widget/hotel/add_minus_widget.dart';
import 'package:tourism_project/presentation/widget/hotel/custom_elevated_buttom.dart';

// ignore: camel_case_types, must_be_immutable
class flightDetails extends StatefulWidget {
  flightDetails({required this.planeTripId, super.key});
  String planeTripId;
  @override
  State<flightDetails> createState() => _flightDetailsState();
}

// ignore: camel_case_types
class _flightDetailsState extends State<flightDetails> {
  int numberSeat = 0;
  GoingPlaneTrip? goingPlaneTrip;
  @override
  void initState() {
    super.initState();
    context
        .read<DetailsPlaneTripCubit>()
        .getDetailsPalneTrip(widget.planeTripId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsPlaneTripCubit, DetailsPlaneTripState>(
        listener: (context, state) {
      if (state is DetailsPlaneTripSuccess) {
        goingPlaneTrip = (state).goingPlaneTrip;
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("state.success")));
      }
      if (state is DetailsPlaneTripFailure) {
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text("state.fauil")));
        showAlertDialog(context, state.errMessage);
      }
    }, builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor,
            centerTitle: true,
            title: Text('Details and Book'),
            elevation: 0,
          ),
          body: state is DetailsPlaneTripSuccess
              ? Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Stack(
                          children: [
                            Container(
                              child: Image.asset(
                                'assets/images/flight_details.jpeg',
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height / 45,
                              left: MediaQuery.of(context).size.width / 34.5,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '${goingPlaneTrip?.airportSource.name} ',
                                        style: TextStyle(
                                            color: AppColor.fifeColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 26),
                                      ),
                                      Text(
                                        '${goingPlaneTrip?.countrySource.name} ',
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        width: 190,
                                        color: AppColor.fifeColor,
                                        'assets/images/1.png',
                                      ),
                                      const Text('1 h 24m \nNoo-stop')
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '${goingPlaneTrip?.airportDestination.name} ',
                                        style: TextStyle(
                                            color: AppColor.fifeColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 26),
                                      ),
                                      Text(
                                        '${goingPlaneTrip?.countryDestination.name} ',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                bottom: 30,
                                left: 30,
                                child: Row(
                                  children: [
                                    const Text(
                                      '\$',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 27,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${goingPlaneTrip?.currentPrice} ',
                                      style: TextStyle(
                                          color: AppColor.fifeColor,
                                          fontSize: 27,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'per person',
                                      style: TextStyle(
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                  ],
                                ))
                          ],
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          color: AppColor.fifeColor,
                          child: SingleChildScrollView(
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Flight',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 120, 201, 244),
                                              fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${goingPlaneTrip?.plane.name}",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          'Date',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 120, 201, 244),
                                              fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          '6',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Depart',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 120, 201, 244),
                                              fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          '9:30',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          'Seat',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 120, 201, 244),
                                              fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '${goingPlaneTrip?.availableSeats} A',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                    const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Arrive',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 120, 201, 244),
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '11:45',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Date',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 120, 201, 244),
                                              fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '6',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: AppColor.secondColor,
                                    borderRadius: const BorderRadius.only(
                                        //  topLeft: Radius.circular(40),
                                        topRight: Radius.circular(100))),
                                child: Padding(
                                  padding: const EdgeInsets.all(17),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'if you want boohing this plane \npleas Selected number seat ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black45,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          const Text(
                                            'seat : ',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          WidgetAddAndMinus(
                                            icon: Icons.exposure_minus_1,
                                            onTap: numberSeat != 0
                                                ? () {
                                                    setState(() {
                                                      numberSeat--;
                                                    });
                                                  }
                                                : null,
                                            color: numberSeat != 0
                                                ? AppColor.IconAdd
                                                : AppColor.IconMinus,
                                          ),
                                          const SizedBox(width: 5),
                                          Text('$numberSeat'),
                                          const SizedBox(width: 5),
                                          WidgetAddAndMinus(
                                            icon: Icons.exposure_plus_1,
                                            onTap: () {
                                              setState(() {
                                                numberSeat++;
                                              });
                                            },
                                            color: AppColor.IconAdd,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 60, right: 60),
                                        child: WidgetElevatedButton(
                                          text: "Book",
                                          onTap: () {},
                                          height: 45,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ))
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ));
    });
  }
}
