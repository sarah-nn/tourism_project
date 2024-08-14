import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/activity/activity_cubit.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/business_logic/hotel/searchHotel_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/going_plane_trip.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/activity_dynamic_windget.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/custom_trip_filed.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/flight_dynamictrip_widget.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/fromTo_dynamictrip_widget.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/hotel_dynamictrip_widget.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/number_of_tourist_widget.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/places_dynamictrip_widget.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/trip_date_widget.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/tripnote_dynamic_Widget.dart';

class DynamicTripPage extends StatefulWidget {
  const DynamicTripPage({super.key});

  @override
  State<DynamicTripPage> createState() => _DynamicTripPageState();
}

class _DynamicTripPageState extends State<DynamicTripPage> {
  int currentStep = 0;
  String countryId = '';
  List<GoingPlaneTrip> planesList = [];
  String? tripId;
  bool isSuccess = false;

  // DynamicTripModel? bookingModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DynamicTripCubit, DynamicTripState>(
      listener: (context, state) {
        if (state is BookingSuccess) {
          tripId = (state).tripId;
          print("===trip is from page==$tripId");
          showBookingDoneDialog(context, AppRoutes.dynamicTripDetails, tripId,
              () {
            replace(context, AppRoutes.startDynamicPage);
          });
          // context.pop();
          placeIds.clear();
          activities.clear();
          placeNames.clear();
        }
        //print("❗${bookingModel}");
        //print("❗❤${bookingModel?}");
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                "Make Trip",
                style: MyTextStyle.headers
                    .copyWith(color: Colors.white, fontSize: 30),
              ),
              shape: const LinearBorder(start: LinearBorderEdge(size: 0.5)),
              centerTitle: true,
              backgroundColor:
                  light ? AppColor.primaryColor : AppColor.primaryColorDark,
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 25,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        colorScheme:
                            ColorScheme.light(primary: AppColor.primaryColor)),
                    child: Stepper(
                        type: StepperType.vertical,
                        onStepContinue: () {
                          if (currentStep != 7) {
                            setState(() => currentStep++);
                          }
                        },
                        onStepCancel: () {
                          if (currentStep != 0) {
                            setState(() => currentStep--);
                          }
                        },
                        controlsBuilder:
                            (BuildContext context, ControlsDetails details) {
                          return Container();
                        },
                        connectorThickness: 1,
                        currentStep: currentStep,
                        onStepTapped: (index) {
                          setState(() {
                            currentStep = index;
                            if (index == 3) {
                              setState(() {
                                countryId = context
                                    .read<DynamicTripCubit>()
                                    .destinationTripId;
                                // BlocProvider.of<DynamicTripCubit>(context)
                                //     .destinationTripId;
                              });
                              countryId == ''
                                  ? null
                                  : context
                                      .read<SearchHotelCubit>()
                                      .getAllHotel(countryId);
                            }
                            if (currentStep == 5) {
                              print(tripDestination);
                              setState(() {
                                tripDestination;
                              });
                            }
                            if (currentStep == 4) {
                              // var params = context.read<DynamicTripCubit>();
                              // BlocListener<SearchFlightCubit,
                              //     SearchFlightState>(
                              //   listener: (context, state) {
                              //     if (state is SearchFlightSuccess) {
                              //       print("done");
                              //     }
                              //   },
                              // );

                              // context
                              //     .read<SearchFlightCubit>()
                              //     .getallPlaneTripGoingAndReturn(
                              //         country_source_id: params.sourceTripId,
                              //         country_destination_id:
                              //             params.destinationTripId,
                              //         flight_date: params.startDate);
                              // context
                              //     .read<SearchFlightCubit>()
                              //     .getallPlaneTripGoing(
                              //         country_source_id: params.sourceTripId,
                              //         country_destination_id:
                              //             params.destinationTripId,
                              //         flight_date: params.startDate);
                            }
                          });
                        },
                        steps: [
                          Step(
                            isActive: currentStep >= 0,
                            title: stepTitle("Trip Name", ""),
                            content: CustomTripField(),
                          ),
                          Step(
                              isActive: currentStep >= 1,
                              title: stepTitle("Trip Date", "required"),
                              content: TripDate(),
                              subtitle: stepSubTitle("'required'")),
                          Step(
                              subtitle: stepSubTitle("'required'"),
                              isActive: currentStep >= 2,
                              title: stepTitle("From_To", "required"),
                              content: FromToDynamicTrip()),
                          Step(
                              isActive: currentStep >= 3,
                              title:
                                  stepTitle("Number of Tourist", "'required'"),
                              content: NumberOfTourist(),
                              subtitle: stepSubTitle("'required'")),
                          Step(
                              isActive: currentStep >= 4,
                              title: stepTitle("Flight", ""),
                              content: FlightDynamicTrip()),
                          Step(
                              isActive: currentStep >= 5,
                              title: stepTitle("Places", ""),
                              subtitle: stepSubTitle("'required'"),
                              content: const Align(
                                  alignment: Alignment.centerLeft,
                                  child: PlacesDynamicWidget())),
                          Step(
                              // state: currentStep >= 7
                              //     ? StepState.complete
                              //     : StepState.disabled,
                              isActive: currentStep >= 6,
                              title: stepTitle("Activity", "'required'"),
                              content: BlocProvider(
                                create: (context) => ActivityCubit(),
                                child: ActivityDynamicWidget(),
                              )),
                          Step(
                            isActive: currentStep >= 7,
                            title: stepTitle("Hotel", ""),
                            content: HotelDynamicTrip(),
                          ),
                          Step(
                            subtitle: stepSubTitle(
                                "add your checkPoint or important events"),
                            isActive: currentStep >= 8,
                            title: stepTitle("Trip Notes", ""),
                            content: TripNoteWidget(),
                          ),
                        ]),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 21),
                        child: MaterialButton(
                          minWidth: double.maxFinite,
                          //  minWidth: MediaQuery.of(context).size.width / 1.4,
                          onPressed: () {
                            // GoRouter.of(context).push(
                            //     '/bookingDynamicDetails/${39.toString()}');
                            print(tripId);
                            // BlocProvider.of<DynamicTripCubit>(context)
                            //     .printList();
                            //!booking now
                            context
                                .read<DynamicTripCubit>()
                                .dynamicTripBooking();
                            // placeIds.clear();
                            // placeNames.clear();
                            // activities.clear();
                            //tripDestination = '';
                          },
                          color: AppColor.primaryColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5)),
                          ),
                          child: Text(
                            "Confirm Booking",
                            style: MyTextStyle.headers
                                .copyWith(fontSize: 25, color: Colors.white),
                          ),
                        )))
              ],
            ));
      },
    );
  }
}

Widget stepTitle(String stepName, String data) {
  return Container(
    color: light
        ? AppColor.secondColor.withOpacity(0.6)
        : AppColor.secoundColorDark,
    child: Text(
      stepName,
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),
  );
}

Widget stepSubTitle(String stepName) {
  return Text(
    stepName,
    style: const TextStyle(fontSize: 15),
  );
}
