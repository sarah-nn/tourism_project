import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/dynamic_booking_value_model.dart';

class CustomTripField extends StatefulWidget {
  const CustomTripField({super.key});

  @override
  State<CustomTripField> createState() => _CustomTripFieldState();
}

class _CustomTripFieldState extends State<CustomTripField> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<DynamicTripCubit, DynamicTripState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: TextField(
        controller: context.read<DynamicTripCubit>().tripName,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                gtripname = context.read<DynamicTripCubit>().tripName.text;
                // context.read<DynamicTripCubit>().addToTripList(
                //     context.read<DynamicTripCubit>().tripName.text);
                // print(tripName.text);
              },
              icon: Icon(Icons.check),
            ),
            hintText: "Enter the name of your Trip"),
      ),
    );
  }
}
