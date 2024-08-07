import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/business_logic/dynamicTrip/update_trip/update_trip_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/dynamic_booking_details_model.dart';

class TopDetailsCard extends StatefulWidget {
  const TopDetailsCard({super.key, this.mymodel, required this.isEdit});
  final DataModel? mymodel;
  final bool isEdit;

  @override
  State<TopDetailsCard> createState() => _TopDetailsCardState();
}

class _TopDetailsCardState extends State<TopDetailsCard> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final ThemeData customTheme = ThemeData(
      primaryColor: AppColor.primaryColor,
      colorScheme: ColorScheme.light(
          primary: AppColor.primaryColor, background: AppColor.secondColor),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            fontFamily: "Philosopher"),
      ),
      dialogTheme: DialogTheme(
        elevation: 10,
        backgroundColor: AppColor.secondColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
    );
    DateTime preDate = DateTime.parse(widget.mymodel!.dynamicTrip!.endDate!);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(preDate.year, preDate.month, preDate.day),
      firstDate: DateTime(preDate.year, preDate.month, preDate.day),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(data: customTheme, child: child!);
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        context.read<UpdateTripCubit>().newDate =
            _selectedDate!.toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColor.secondColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "${widget.mymodel!.dynamicTrip!.tripName!}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                          color: AppColor.primaryColor),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          widget.mymodel!.sourceTrip!.name!,
                          style: const TextStyle(fontSize: 17),
                        ),
                        const Text(
                          "-",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.mymodel!.destinationTrip!.name!,
                          style: const TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 7),
              Row(
                children: [
                  Icon(
                    Icons.date_range_sharp,
                    color: AppColor.primaryColor,
                  ),
                  Text(
                    " Start date : ${widget.mymodel!.dynamicTrip!.startDate!}",
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        color: AppColor.primaryColor,
                      ),
                      Text(
                        " End date : ${_selectedDate == null ? widget.mymodel!.dynamicTrip!.endDate! : _selectedDate!.toString().split(' ')[0]}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  widget.isEdit
                      ? IconButton(
                          onPressed: () {
                            _selectDate(context);
                          },
                          icon: Icon(Icons.edit, color: AppColor.primaryColor))
                      : Container()
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
