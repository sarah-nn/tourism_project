import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/business_logic/dynamicTrip/update_trip/update_trip_cubit.dart';
import 'package:tourism_project/business_logic/flight/searchFlight_cubit.dart';
import 'package:tourism_project/business_logic/hotel/searchHotel_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/dynamic_booklist_model.dart';
import 'package:tourism_project/presentation/screens/trip/dynamic_edit_booking_page.dart';

class DynamicCardBook extends StatelessWidget {
  const DynamicCardBook(
      {super.key,
      required this.model,
      required this.index,
      required this.isPre});
  final DynamicListBookingModel model;
  final int index;
  final bool isPre;

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Card(
        shadowColor: const Color.fromARGB(255, 181, 217, 246),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Container(
          decoration: BoxDecoration(
              color: AppColor.secondColor.withAlpha(190),
              border: Border.all(width: 1, color: AppColor.primaryColor),
              borderRadius: BorderRadius.circular(25)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text(
                        'Start date : ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(model.startDate),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'End date : ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(model.endDate),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    thickness: 0.6,
                    color: Color.fromARGB(255, 168, 166, 166),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      !isPre
                          ? GestureDetector(
                              onTap: () {
                                GoRouter.of(context).push(
                                    '/bookingDynamicDetails/${model.id.toString()}');
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.description_outlined,
                                    color: AppColor.primaryColor,
                                  ),
                                  Text(
                                    !isPre ? ' View' : ' view',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                            )
                          : Container(),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MultiBlocProvider(
                                    providers: [
                                      BlocProvider(
                                        create: (context) => DynamicTripCubit(),
                                      ),
                                      BlocProvider(
                                        create: (context) => SearchHotelCubit(),
                                      ),
                                      BlocProvider(
                                        create: (context) =>
                                            SearchFlightCubit(),
                                      ),
                                      BlocProvider(
                                        create: (context) => UpdateTripCubit(),
                                      ),
                                    ],
                                    child: DynamicTripBookingEditPage(
                                        tripId: model.id.toString()),
                                  )));
                          //goRoute(context, AppRoutes.updateDynamic);
                          // GoRouter.of(context)
                          //     .push('/updateDynamic/${model.id}');
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: AppColor.primaryColor,
                            ),
                            Text(
                              !isPre ? ' Edit ' : ' Edit Book',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        thickness: 3.2,
                        width: 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          print("delte");
                          context
                              .read<DynamicTripCubit>()
                              .deleteDynamicTrip(model.id.toString());
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.delete,
                                color: Color.fromARGB(255, 245, 142, 135)),
                            Text(
                              !isPre ? 'Cancel' : ' Cancel Book',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                  fontSize: 16.5),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ]),
          ),
        ),
      ),
      Positioned(
          top: -15,
          left: 20,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 0.7, color: AppColor.primaryColor),
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 191, 223, 251),
                  Color.fromARGB(255, 216, 246, 250),
                  Color.fromARGB(255, 232, 233, 249),
                ]),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Text(
                model.tripName,
                style: TextStyle(
                    color: AppColor.fifeColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
            ),
          ))
    ]);
  }
}

// Future<void> selectData(
  //   BuildContext context,
  // ) async {
  //   final ThemeData customTheme = ThemeData(
  //     primaryColor: AppColor.primaryColor,
  //     colorScheme: ColorScheme.light(
  //       primary: AppColor.primaryColor,
  //     ),
  //     textTheme: const TextTheme(
  //       headlineMedium: TextStyle(
  //         fontSize: 24.0,
  //         fontWeight: FontWeight.bold,
  //         fontFamily: "Philosopher",
  //       ),
  //     ),
  //     dialogTheme: DialogTheme(
  //       elevation: 10,
  //       backgroundColor: AppColor.secondColor,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(40.0),
  //       ),
  //     ),
  //   );

  //   final DateTime? picker = await showDatePicker(
  //     initialDate: DateTime.parse(widget.detailsBookHotelModel.endDate),
  //     firstDate: DateTime.parse(widget.detailsBookHotelModel.endDate),
  //     lastDate: DateTime(2024, 12, 31),
  //     context: context,
  //     initialDatePickerMode: DatePickerMode.day,
  //     builder: (BuildContext context, Widget? child) {
  //       return Theme(data: customTheme, child: child!);
  //     },
  //   );

  //   if (picker != null) {
  //     final String formattedDate =
  //         '${picker.year.toString()}-${picker.month.toString().padLeft(2, '0')}-${picker.day.toString().padLeft(2, '0')}';
  //     setState(() {
  //       endDate = formattedDate;
  //       // User.dateStatrtHotel = startDate;
  //     });
  //   }
  // }

