import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/data/models/static_trip_details_model.dart';

class StaticFlightWidget extends StatelessWidget {
  final StaticDetailsModel myTripModel;
  const StaticFlightWidget({super.key, required this.myTripModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: AppColor.staticTripContainer,
            // color: const Color.fromRGBO(232, 243, 255, 1),
            border: Border(
              left: BorderSide(
                  width: 5, color: AppColor.primaryColor.withOpacity(1.0)),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Flight Booking Included ",
                    style: MyTextStyle.poppins.copyWith(
                        fontSize: 19,
                        color: const Color.fromARGB(255, 26, 73, 112)),
                  ),
                  const Icon(
                    Icons.check,
                    color: Color.fromARGB(255, 26, 73, 112),
                  )
                ],
              ),
              widgethelper(
                  "Going Plane : ${myTripModel.goingTrip!.goingPlane!.name!}",
                  myTripModel.goingTrip!.airportSource!.name!,
                  myTripModel.goingTrip!.airportDestination!.name!),
              widgethelper(
                  "Return Plane : ${myTripModel.returnTrip!.returnPlane!.name}",
                  myTripModel.returnTrip!.airportSource!.name!,
                  myTripModel.returnTrip!.airportDestination!.name!)
            ],
          )),
    );
  }

  Widget widgethelper(goingPlane, source, dest) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Radio(
                  value: "",
                  activeColor: AppColor.primaryColor,
                  groupValue: "",
                  onChanged: (index) {}),
              Text(
                goingPlane,
                //  "Going Plane :${myTripModel!.goingTrip!.goingPlane!.name!}",
                style: const TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 26, 73, 112)),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      const Text(
                        "Source Airport",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.5),
                      ),
                      Text(source),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.swap_horiz,
                    color: AppColor.primaryColor,
                    size: 30,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      const Text(
                        "Destination Airport",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.5),
                      ),
                      Text(dest),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
