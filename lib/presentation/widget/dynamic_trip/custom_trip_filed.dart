import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';

class CustomTripField extends StatefulWidget {
  const CustomTripField({super.key});

  @override
  State<CustomTripField> createState() => _CustomTripFieldState();
}

class _CustomTripFieldState extends State<CustomTripField> {
  @override
  Widget build(BuildContext context) {
    var nameController = context.read<DynamicTripCubit>();
    return BlocListener<DynamicTripCubit, DynamicTripState>(
      listener: (context, state) {},
      child: TextField(
        controller: nameController.tripName,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                // gtripname = context.read<DynamicTripCubit>().tripName.text;
                // context.read<DynamicTripCubit>().addToTripList(
                //     context.read<DynamicTripCubit>().tripName.text);
                // print(tripName.text);
              },
              icon: Icon(
                Icons.check,
                color: nameController.tripName.text.isEmpty
                    ? Colors.green
                    : AppColor.primaryColor,
              ),
            ),
            hintText: "Enter the name of your Trip"),
      ),
    );
  }
}
