import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/data/models/going_plane_trip.dart';
import 'package:tourism_project/presentation/widget/flight/card_searach_flight_widget.dart';

class PlaneListWidget extends StatelessWidget {
  final List<GoingPlaneTrip>? singlTrip;

  const PlaneListWidget({super.key, @required this.singlTrip});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text(
                  "Save",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 18),
                ),
              ),
            )),
        Container(
          height: 400,
          child: ListView.builder(
              itemCount: singlTrip!.length,
              itemBuilder: (context, index) {
                var planeList = singlTrip![index];
                return WidgetSearchFlight(
                    onePlane: planeList.planeId.toString(),
                    isTrip: true,
                    goingPlaneTrip: planeList,
                    departflight: true,
                    round: false);
                // ListTile(
                //   title: Text(planeList.airportDestination.name!),
                //   subtitle: Text(planeList.currentPrice.toString()),
                // );
              }),
        ),
      ],
    );
  }
}
