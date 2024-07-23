import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';

class TripNoteWidget extends StatefulWidget {
  const TripNoteWidget({super.key});

  @override
  State<TripNoteWidget> createState() => _CustomTripFieldState();
}

class _CustomTripFieldState extends State<TripNoteWidget> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var noteController = context.read<DynamicTripCubit>();
    return BlocListener<DynamicTripCubit, DynamicTripState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          const Text(
            "What Your Notes to Saved ..",
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 40.0, maxHeight: 200.0),
            child: IntrinsicHeight(
              child: TextField(
                controller: noteController.tripNote,
                focusNode: _focusNode,
                maxLines: null, // Allows the TextField to grow in height
                expands: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Type something...',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
