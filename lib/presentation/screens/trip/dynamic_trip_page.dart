import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/custom_trip_filed.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/flight_dynamictrip_widget.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/fromTo_dynamictrip_widget.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/hotel_dynamictrip_widget.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/number_of_tourist_widget.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/trip_date_widget.dart';

class DynamicTripPage extends StatefulWidget {
  const DynamicTripPage({super.key});

  @override
  State<DynamicTripPage> createState() => _DynamicTripPageState();
}

class _DynamicTripPageState extends State<DynamicTripPage> {
  int currentStep = 0;
  // List<Step> stepList() => [
  //       Step(
  //         state: currentStep <= 0 ? StepState.indexed : StepState.complete,
  //         isActive: currentStep >= 0,
  //         title: Text("titile"),
  //         content: Center(child: Text("connect")),
  //       ),
  //       Step(
  //         state: currentStep <= 1 ? StepState.indexed : StepState.complete,
  //         isActive: currentStep >= 1,
  //         title: Text("titile"),
  //         content: Center(child: Text("connect")),
  //       ),
  //       Step(
  //         state: currentStep <= 2 ? StepState.indexed : StepState.complete,
  //         isActive: currentStep >= 2,
  //         title: Text("titile"),
  //         content: Center(child: Text("connect")),
  //       ),
  //       Step(
  //         state: currentStep <= 3 ? StepState.indexed : StepState.complete,
  //         isActive: currentStep >= 3,
  //         title: Text("titile"),
  //         content: Center(child: Text("connect")),
  //       ),
  //       Step(
  //         state: currentStep <= 4 ? StepState.indexed : StepState.complete,
  //         isActive: currentStep >= 4,
  //         title: Text("titile"),
  //         content: Center(child: Text("connect")),
  //       ),
  //       Step(
  //         state: currentStep <= 5 ? StepState.indexed : StepState.complete,
  //         isActive: currentStep >= 5,
  //         title: Text("titile"),
  //         content: Center(child: Text("connect")),
  //       )
  //     ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Make Trip",
            style:
                MyTextStyle.headers.copyWith(color: Colors.white, fontSize: 30),
          ),
          shape: const LinearBorder(start: LinearBorderEdge(size: 0.5)),
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
        ),
        // body: Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 30),
        //   child: Stepper(
        //     currentStep: currentStep,
        //     type: StepperType.horizontal,
        //     steps: stepList(),
        //     onStepContinue: () {
        //       if (currentStep < (stepList().length - 1)) {
        //         currentStep += 1;
        //       }
        //       setState(() {});
        //     },
        //     onStepCancel: () {
        //       if (currentStep == 0) {
        //         return;
        //       }
        //       currentStep -= 1;
        //       setState(() {});
        //     },
        //   ),
        // )
        body: Column(
          children: [
            Expanded(
              flex: 11,
              child: Theme(
                data: Theme.of(context).copyWith(
                    colorScheme:
                        ColorScheme.light(primary: AppColor.primaryColor)),
                child: Stepper(
                    type: StepperType.vertical,
                    onStepContinue: () {
                      if (currentStep != 4) {
                        setState(() => currentStep++);
                      }
                    },
                    onStepCancel: () {
                      if (currentStep != 0) {
                        setState(() => currentStep--);
                      }
                    },
                    connectorThickness: 3,
                    currentStep: currentStep,
                    onStepTapped: (index) {
                      setState(() {
                        currentStep = index;
                      });
                    },
                    steps: [
                      Step(
                          isActive: currentStep >= 0,
                          title: stepTitle("Trip Name"),
                          content: CustomTripField()),
                      Step(
                          isActive: currentStep >= 1,
                          title: stepTitle("Trip Date"),
                          content: TripDate()),
                      Step(
                          isActive: currentStep >= 2,
                          title: stepTitle("From_To"),
                          //to be deleted after check it
                          // content: DropDown(),
                          content: FromToDynamicTrip()),
                      Step(
                        isActive: currentStep >= 3,
                        title: stepTitle("Hotel"),
                        content: HotelDynamicTrip(),
                      ),
                      Step(
                        isActive: currentStep >= 4,
                        title: stepTitle("Number of Tourist"),
                        content: NumberOfTourist(),
                      ),
                      Step(
                        isActive: currentStep >= 5,
                        title: stepTitle("Flight"),
                        content: FlightDynamicTrip(),
                      )
                    ]),
              ),
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width / 1.4,
                    onPressed: () {
                      BlocProvider.of<DynamicTripCubit>(context).printList();
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
                      "Confirm Trip",
                      style: MyTextStyle.headers
                          .copyWith(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ))
          ],
        ));
  }
}

Widget stepTitle(String stepName) {
  return Text(
    stepName,
    style: TextStyle(fontSize: 27),
  );
}
