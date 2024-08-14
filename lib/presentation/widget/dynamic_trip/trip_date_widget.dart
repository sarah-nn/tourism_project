import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/utils/global.dart';

class TripDate extends StatefulWidget {
  @override
  _TripDateState createState() => _TripDateState();
}

class _TripDateState extends State<TripDate> {
  String _selectedDateRange = '';
  DateTimeRange? selectedDateRange;
  String startDate = '';
  String endDate = '';
  int? numberOfDays;

  Future<void> _selectDateRange() async {
    final ThemeData customTheme = ThemeData(
      primaryColor: AppColor.primaryColor,
      colorScheme: ColorScheme.light(
          primary: AppColor.primaryColor, background: AppColor.secondColor),
      textTheme: const TextTheme(
        bodyText2:
            TextStyle(fontSize: 20, fontFamily: 'Pacifico'), // Dates text
      ),
      dialogTheme: DialogTheme(
        elevation: 10,
        backgroundColor: AppColor.secondColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
    );
    DateTime now = DateTime.now();
    final DateTimeRange? pickedDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget? child) {
        return Theme(data: customTheme, child: child!);
      },
    );

    if (pickedDateRange != null) {
      setState(() {
        _selectedDateRange =
            '${pickedDateRange.start.toString().split(' ')[0]} \n ${pickedDateRange.end.toString().split(' ')[0]}';
        context.read<DynamicTripCubit>().startDate =
            pickedDateRange.start.toString().split(' ')[0];
        context.read<DynamicTripCubit>().endDate =
            pickedDateRange.end.toString().split(' ')[0];
        startDate = pickedDateRange.start.toString().split(' ')[0];
        endDate = pickedDateRange.end.toString().split(' ')[0];
        selectedDateRange = pickedDateRange;
        print("$startDate    $endDate");
      });
    }

    //!there is null issues here
    if (selectedDateRange != null) {
      if (_selectedDateRange != null) {
        context.read<DynamicTripCubit>().tripDays =
            selectedDateRange!.end.difference(selectedDateRange!.start).inDays;
      }
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
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color:
                        light ? AppColor.secondColor : AppColor.thirdColorDark,
                    borderRadius: BorderRadius.circular(15)),
                child: MaterialButton(
                    onPressed: _selectDateRange,
                    child: context.read<DynamicTripCubit>().startDate == '' &&
                            context.read<DynamicTripCubit>().endDate == ''
                        ? Row(
                            children: [
                              const Icon(
                                Icons.date_range_outlined,
                                color: Color.fromARGB(255, 160, 165, 95),
                                size: 28,
                              ),
                              Text(
                                '   Enter Date Range',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: light
                                        ? Colors.black54
                                        : Colors.white54),
                              ),
                            ],
                          )
                        : Text(
                            "Totel Number Day ${context.read<DynamicTripCubit>().tripDays}",
                            style: const TextStyle(fontSize: 17.5))),
              ),
            ),
            context.read<DynamicTripCubit>().startDate == ''
                ? Container()
                : dateContaner()
            // startDate == '' ? Container() : dateContaner(),
          ],
        );
      },
    );
  }

  Widget dateContaner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.date_range,
                  size: 25,
                  color: Colors.grey,
                ),
                Text(
                  " Start",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: light ? Colors.black45 : Colors.white54),
                )
              ],
            ),
            Text(
              "  ${context.read<DynamicTripCubit>().startDate}",
              style: MyTextStyle.Pacifico.copyWith(
                  fontSize: 25, color: light ? null : Colors.white),
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Row(
              children: [
                const Icon(
                  Icons.date_range,
                  size: 25,
                  color: Colors.grey,
                ),
                Text(
                  " End",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: light ? Colors.black45 : Colors.white54),
                )
              ],
            ),
            Text(
              "  ${context.read<DynamicTripCubit>().endDate}",
              style: MyTextStyle.Pacifico.copyWith(
                  fontSize: 25, color: light ? null : Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
