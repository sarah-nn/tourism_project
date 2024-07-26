import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/data/models/going_and_return_plane_trip.dart';
import 'package:tourism_project/presentation/widget/flight/card_searach_flight_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                "Save",
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 18),
              ),
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
                return WidgetSearchFlight(
                  goingId: goOrReturn
                      ? null
                      : widget.roundList.data.goingTrip[index].planeId
                          .toString(),
                  returnId: goOrReturn
                      ? widget.roundList.data.returnTrip[index].planeId
                          .toString()
                      : null,
                  goingTrip: goOrReturn
                      ? null
                      : widget.roundList.data.goingTrip[index],
                  isTrip: true,
                  goingPlaneTrip: null,
                  returnTrip: goOrReturn
                      ? widget.roundList.data.returnTrip[index]
                      : null,
                  round: true,
                  departflight: !goOrReturn,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
