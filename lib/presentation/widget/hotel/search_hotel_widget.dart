// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tourism_project/business_logic/hotel/roomAndBook_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/core/utils/info_user.dart';
import 'package:tourism_project/data/models/search_hotel_model.dart';
import 'package:tourism_project/presentation/widget/hotel/custom_elevated_buttom.dart';

// ignore: must_be_immutable
class WidgetSearchHotel extends StatefulWidget {
  WidgetSearchHotel({required this.hotel, super.key});
  HotelModel hotel;
  @override
  State<WidgetSearchHotel> createState() => _WidgetSearchHotelState();
}

class _WidgetSearchHotelState extends State<WidgetSearchHotel> {
  String selectedData = '';
  String startDate = 'chose date start';
  String endDate = 'chose date end';

  late RoomCubit myBloc;

  bool start = true;
  @override
  void initState() {
    super.initState();
    myBloc = BlocProvider.of<RoomCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RoomCubit, RoomState>(listener: (context, state) {
      if (state is RoomSuccess) {
        GoRouter.of(context).push('/InfoBookingHotelPage/${widget.hotel.id}',
            extra: SearchHotelArgs(
                hotelId: widget.hotel.id.toString(),
                countryId: widget.hotel.area.country_id.toString(),
                statrDate: startDate,
                endDate: endDate));
      }
      if (state is RoomFailure) {
        showAlertDialog(context, state.errMessage);
      }
    }, builder: (context, state) {
      return InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                backgroundColor:
                    const Color.fromARGB(252, 175, 228, 245).withAlpha(70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: light
                              ? AppColor.secondColor
                              : AppColor.secoundColorDark.withAlpha(200),
                          border: Border.all(
                              width: 2,
                              color: light
                                  ? AppColor.primaryColor
                                  : Colors.white54),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        height: 350,
                        child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "If you want to book in this hotel (${widget.hotel.name}) \n please select the period that suits you",
                                style: TextStyle(
                                    fontFamily: "normal",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: light
                                        ? AppColor.fifeColor
                                        : Colors.white70),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        AppColor.primaryColor.withAlpha(150),
                                    radius: 20,
                                    child:
                                        const Icon(Icons.date_range_outlined),
                                  ),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () async {
                                      await selectData(context,
                                          isStartDate: true);
                                      setState(() {}); // Trigger UI update
                                    },
                                    child: Text(
                                      startDate.isEmpty
                                          ? 'Choose Date Start'
                                          : startDate,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'Philosopher',
                                          color: light ? null : Colors.white54),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        AppColor.primaryColor.withAlpha(150),
                                    radius: 20,
                                    child:
                                        const Icon(Icons.date_range_outlined),
                                  ),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () async {
                                      await selectData(context,
                                          isStartDate: false);
                                      setState(() {}); // Trigger UI update
                                    },
                                    child: Text(
                                      endDate.isEmpty
                                          ? 'Choose Date End'
                                          : endDate,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'Philosopher',
                                          color: light ? null : Colors.white54),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: WidgetElevatedButton(
                                  height: 40,
                                  onTap: () {
                                    myBloc.getRooms(
                                      start: startDate,
                                      end: endDate,
                                      hotelId: widget.hotel.id.toString(),
                                    );
                                  },
                                  text: 'Next',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Card(
            elevation: 25,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Container(
              height: 190,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(width: 0.8, color: AppColor.primaryColor),
                color: light ? AppColor.secondColor : AppColor.secoundColorDark,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Image.asset(
                        AppImage.hotel,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.hotel.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Iconsax.location,
                              color: AppColor.primaryColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${User.countryShow} , ${widget.hotel.area.name}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 144, 142, 142)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            ...List.generate(
                                widget.hotel.stars.length,
                                (index) => const Icon(
                                      Icons.star,
                                      color: Color.fromARGB(255, 235, 177, 3),
                                      size: 19,
                                    )),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

//   Future<String> selectData(BuildContext context) async {
//     final ThemeData customTheme = ThemeData(
//       primaryColor: light ? AppColor.primaryColor : AppColor.primaryColorDark,
//       colorScheme: ColorScheme.light(
//         primary: light ? AppColor.primaryColor : AppColor.primaryColorDark,
//         // background: light ? AppColor.secondColor : AppColor.primaryColorDark
//       ),
//       textTheme: const TextTheme(
//         headlineMedium: TextStyle(
//             fontSize: 24.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: "Philosopher"),
//       ),
//       dialogTheme: DialogTheme(
//         elevation: 10,
//         backgroundColor: AppColor.secondColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(40.0),
//         ),
//       ),
//     );

//     final DateTime? picker = await showDatePicker(
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2024, 12, 31),
//       context: context,
//       initialDatePickerMode: DatePickerMode.day,
//       builder: (BuildContext context, Widget? child) {
//         return Theme(data: customTheme, child: child!);
//       },
//     );
//     // ignore: unrelated_type_equality_checks
//     if (picker != null && picker != selectedData && start) {
//       selectedData =
//           '${picker.year.toString()}-${picker.month.toString()}-${picker.day.toString()}';
//       setState(() {
//         startDate = selectedData;
//         User.dateStatrtHotel = startDate;
//       });
//       // ignore: unrelated_type_equality_checks
//     } else if (picker != null && picker != selectedData && !start) {
//       setState(() {
//         selectedData =
//             '${picker.year.toString()}-${picker.month.toString()}-${picker.day.toString()}';
//         endDate = selectedData;
//         User.dateEndHotel = endDate;
//       });
//     }
//     return selectedData;
//   }
  Future<void> selectData(
    BuildContext context, {
    required bool isStartDate,
  }) async {
    final ThemeData customTheme = ThemeData(
      primaryColor: AppColor.primaryColor,
      colorScheme: ColorScheme.light(
        primary: AppColor.primaryColor,
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          fontFamily: "Philosopher",
        ),
      ),
      dialogTheme: DialogTheme(
        elevation: 10,
        backgroundColor: AppColor.secondColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
    );

    final DateTime? picker = await showDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2024, 12, 31),
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      builder: (BuildContext context, Widget? child) {
        return Theme(data: customTheme, child: child!);
      },
    );

    if (picker != null) {
      final String formattedDate =
          '${picker.year.toString()}-${picker.month.toString().padLeft(2, '0')}-${picker.day.toString().padLeft(2, '0')}';
      setState(() {
        if (isStartDate) {
          startDate = formattedDate;
          // User.dateStatrtHotel = startDate;
        } else {
          endDate = formattedDate;
          // User.dateEndHotel = endDate;
        }
      });
    }
  }
}

class SearchHotelArgs {
  String hotelId;
  String statrDate;
  String endDate;
  String countryId;
  SearchHotelArgs(
      {required this.hotelId,
      required this.statrDate,
      required this.endDate,
      required this.countryId});
}
