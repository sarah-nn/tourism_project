import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/core/utils/global.dart';

class TripDate extends StatefulWidget {
  @override
  _TripDateState createState() => _TripDateState();
}

class _TripDateState extends State<TripDate> {
  String _selectedDateRange = '';
  String startDate = '';
  String endDate = '';

  Future<void> _selectDateRange() async {
    final DateTimeRange? pickedDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: DateTimeRange(
        start: DateTime.now().subtract(const Duration(days: 4)),
        end: DateTime.now().add(const Duration(days: 3)),
      ),
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    );

    if (pickedDateRange != null) {
      setState(() {
        _selectedDateRange =
            '${pickedDateRange.start.toString().split(' ')[0]} \n ${pickedDateRange.end.toString().split(' ')[0]}';
        startDate = pickedDateRange.start.toString().split(' ')[0];
        endDate = pickedDateRange.end.toString().split(' ')[0];
        gstartDate = startDate;
        gendDate = endDate;
        print("$startDate    $endDate");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DynamicTripCubit, DynamicTripState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: _selectDateRange,
              child: Text('Select Date Range'),
            ),
            SizedBox(height: 20),
            Text(
              'The Selected date range:\n $_selectedDateRange',
              style: TextStyle(fontSize: 18, height: 1.7),
            ),
          ],
        );
      },
    );
  }
}
