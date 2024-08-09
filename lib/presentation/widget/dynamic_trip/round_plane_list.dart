import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/going_and_return_plane_trip.dart';

class RoundPlaneList extends StatefulWidget {
  final GoingAndReturnPlaneTrip roundList;
  const RoundPlaneList({
    super.key,
    required this.roundList,
  });

  @override
  State<RoundPlaneList> createState() => _RoundPlaneListState();
}

class _RoundPlaneListState extends State<RoundPlaneList> {
  bool goOrReturn = false;
  int goingChoose = -1;
  int returnChoose = -1;
  bool completBook = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(right: 20, left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                completBook
                    ? const Text(
                        "Choose Going and Return Plane trip",
                        style: TextStyle(color: Colors.red),
                      )
                    : Container(),
                TextButton(
                  onPressed: () {
                    print("going id $goingPlaneId  return id $returnPlaneId");
                    returnChoose == -1 || goingChoose == -1
                        ? setState(() {
                            completBook = true;
                            print("choose first");
                          })
                        : context.pop();
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 18),
                  ),
                ),
              ],
            )),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // print(context.read<DynamicTripCubit>().endDate);
                    // print(widget.roundList.data.returnTrip[0].landingDate);
                    setState(() {
                      goOrReturn = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(75, 60),
                    backgroundColor:
                        goOrReturn ? Colors.white : AppColor.primaryColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColor.primaryColor),
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                    ),
                  ),
                  child: Text(
                    "Going",
                    style: MyTextStyle.bright.copyWith(
                        color:
                            goOrReturn ? AppColor.primaryColor : Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      goOrReturn = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(75, 60),
                    backgroundColor:
                        !goOrReturn ? Colors.white : AppColor.primaryColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColor.primaryColor),
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                    ),
                  ),
                  child: Text(
                    "Return",
                    style: MyTextStyle.bright.copyWith(
                        color:
                            !goOrReturn ? AppColor.primaryColor : Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: double.maxFinite,
            child: ListView.builder(
              itemCount: goOrReturn
                  ? widget.roundList.data.returnTrip.length
                  : widget.roundList.data.goingTrip.length,
              itemBuilder: (context, index) {
                //  var goingTrip =widget.roundList.data.goingTrip[index];
                //  var returnTrip =widget.roundList.data.returnTrip[index] ?? [];
                return goOrReturn
                    ? returnRoundCard(
                        widget.roundList.data.returnTrip[index], index)
                    : goingRoundCard(
                        widget.roundList.data.goingTrip[index], index);
                // return WidgetSearchFlight(
                //   goingId: goOrReturn
                //       ? null
                //       : widget.roundList.data.goingTrip[index].planeId
                //           .toString(),
                //   returnId: goOrReturn
                //       ? widget.roundList.data.returnTrip[index].planeId
                //           .toString()
                //       : null,
                //   goingTrip: goOrReturn
                //       ? null
                //       : widget.roundList.data.goingTrip[index],
                //   isTrip: true,
                //   goingPlaneTrip: null,
                //   returnTrip: goOrReturn
                //       ? widget.roundList.data.returnTrip[index]
                //       : null,
                //   round: true,
                //   departflight: !goOrReturn,
                // );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget goingRoundCard(GoingTrip goingList, int index) {
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " ${goingList.plane.name}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppColor.primaryColor),
                      ),
                      Text(goingList.flightDate)
                    ],
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
                          goingList.airportSource.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(goingList.countrySource.name),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          goingList.airportDestination.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(goingList.airportDestination.name),
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
                        Text(goingList.flight_duration),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Ticket price',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(goingList.currentPrice)
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    goingPlaneId = goingList.id.toString();
                    print("var flight = context.read<DynamicTripCubit>();");
                    // onePlaneId = widget.onePlane ?? '';
                    // goingPlaneId = widget.goingId ?? '';
                    // returnPlaneId = widget.returnId ?? '';
                    // //  Navigator.pop(context);
                    setState(() {
                      goingChoose = index;
                    });
                    print(goingChoose);
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
                        color: goingChoose != index
                            ? AppColor.thirdColor.withAlpha(35)
                            : const Color.fromARGB(255, 202, 208, 209),
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
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        returnList.plane.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppColor.primaryColor),
                      ),
                      Text(returnList.flightDate)
                    ],
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
                    print("var flight = context.read<DynamicTripCubit>();");
                    returnPlaneId = returnList.id.toString();
                    // onePlaneId = widget.onePlane ?? '';
                    // goingPlaneId = widget.goingId ?? '';
                    // returnPlaneId = widget.returnId ?? '';
                    // //  Navigator.pop(context);
                    setState(() {
                      returnChoose = index;
                    });
                    print(returnChoose);
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
                        color: returnChoose != index
                            ? AppColor.thirdColor.withAlpha(35)
                            : const Color.fromARGB(255, 202, 208, 209),
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
