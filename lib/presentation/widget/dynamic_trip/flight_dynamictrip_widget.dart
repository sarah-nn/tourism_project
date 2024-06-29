import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/open_buttomsheet.dart';

class FlightDynamicTrip extends StatefulWidget {
  const FlightDynamicTrip({super.key});

  @override
  State<FlightDynamicTrip> createState() => _FlightDynamicTripState();
}

class _FlightDynamicTripState extends State<FlightDynamicTrip> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DynamicTripCubit, DynamicTripState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "How would you travel ?",
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Radio(
                    value: 1,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                        OpenButtomSheet().flightButtomSheet(context);
                      });
                    }),
                SizedBox(width: 10.0),
                Text("Round Trip")
              ],
            ),
            Row(
              children: [
                Radio(
                    value: 2,
                    groupValue: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                        // context.read<DynamicTripCubit>().addToTripList();
                        OpenButtomSheet().flightButtomSheet(context);
                      });
                    }),
                SizedBox(width: 10.0),
                Text("One Way")
              ],
            ),
            SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
