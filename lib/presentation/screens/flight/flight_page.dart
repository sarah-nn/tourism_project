import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/presentation/screens/flight/search_flight_page.dart';
import 'package:tourism_project/presentation/widget/hotel/listtile_complete.dart';

class FlightPage extends StatefulWidget {
  FlightPage({super.key});

  @override
  State<FlightPage> createState() => _FlightPageState();
}

class _FlightPageState extends State<FlightPage> {
  bool roundTrip = true;
  String selectedData = '';
  String Depart_date_Round = 'Select Date';
  String Retur_date_Round = 'Select Date';
  bool A = true;
  bool B = true;
  static String Depart_date_oneway = 'Select Date';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /* Image Flight  */
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  height: 300,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                    ),
                  ),
                  child: Image.asset(
                    AppImage.flight,
                    fit: BoxFit.fill,
                  ),
                ),
                const Positioned(
                  top: 150,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Book Your',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      ),
                      Text(
                        'Flight',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Column(
                children: [
                  /* One-way and Round-way*/
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: WidgetListTileComplete(
                              enableCenterText: true,
                              enableIcon: false,
                              selected: roundTrip,
                              text: 'Round Trip',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              onTap: () {
                                setState(() {
                                  roundTrip = true;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: WidgetListTileComplete(
                              enableCenterText: true,
                              enableIcon: false,
                              selected: !roundTrip,
                              text: 'oneway',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              onTap: () {
                                setState(() {
                                  roundTrip = false;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'From',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              WidgetListTileComplete(
                                enableCenterText: false,
                                enableIcon: true,
                                selected: false,
                                icon: Iconsax.airplane,
                                text: 'enter the city',
                                onTap: () {},
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'To',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              WidgetListTileComplete(
                                enableCenterText: false,
                                enableIcon: true,
                                selected: false,
                                icon: Iconsax.airplane,
                                text: 'enter the city',
                                onTap: () {},
                              ),
                              const SizedBox(height: 20),
                              roundTrip
                                  ? Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Depart',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              WidgetListTileComplete(
                                                enableCenterText: false,
                                                enableIcon: true,
                                                selected: false,
                                                icon: Icons.date_range,
                                                text: '$Depart_date_Round',
                                                onTap: () {
                                                  selectData(context);
                                                  A = false;
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Return",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              WidgetListTileComplete(
                                                enableCenterText: false,
                                                enableIcon: true,
                                                selected: false,
                                                icon: Icons.date_range,
                                                text: '$Retur_date_Round',
                                                onTap: () {
                                                  selectData(context);
                                                  A = true;
                                                },
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Depart',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        WidgetListTileComplete(
                                          enableCenterText: false,
                                          enableIcon: true,
                                          selected: false,
                                          icon: Icons.date_range,
                                          text: '$Depart_date_oneway',
                                          onTap: () {
                                            selectData(context);
                                            B = true;
                                          },
                                        ),
                                      ],
                                    ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Passenger',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        WidgetListTileComplete(
                                          enableCenterText: false,
                                          enableIcon: false,
                                          selected: false,
                                          text: '2',
                                          onTap: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Class',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        WidgetListTileComplete(
                                          enableCenterText: false,
                                          enableIcon: false,
                                          selected: false,
                                          text: 'First',
                                          onTap: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Container(
                                width: double.infinity,
                                height: 55,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (BuildContext context) {
                                      return SearchFlightPage();
                                    }));
                                  },
                                  child: const Text(
                                    'Search Flight',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    primary: AppColor.primaryColor,

                                    elevation: 10,
                                    //fixedSize: Size(double.infinity, 50),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> selectData(BuildContext context) async {
    final DateTime? picker = await showDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2024, 12, 31),
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      builder: (BuildContext context, Widget? child) {
        return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: AppColor.primaryColor,
              dialogBackgroundColor: AppColor.secondColor.withOpacity(0.9),
            ),
            child: child!);
      },
    );
    if (picker != null && picker != selectedData && A && roundTrip) {
      setState(() {
        selectedData =
            '${picker.day.toString()}/${picker.month.toString()}/${picker.year.toString()}';
        Retur_date_Round = selectedData;
      });
    } else if (picker != null && picker != selectedData && !A && roundTrip) {
      setState(() {
        selectedData =
            '${picker.day.toString()}/${picker.month.toString()}/${picker.year.toString()}';
        Depart_date_Round = selectedData;
      });
    } else if (picker != null && picker != selectedData && B) {
      setState(() {
        selectedData =
            '${picker.day.toString()}/${picker.month.toString()}/${picker.year.toString()}';
        Depart_date_oneway = selectedData;
      });
    }
  }
}
