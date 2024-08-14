import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tourism_project/business_logic/country/country_cubit.dart';
import 'package:tourism_project/business_logic/flight/searchFlight_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/utils/info_user.dart';
import 'package:tourism_project/data/models/country_model.dart';
import 'package:tourism_project/presentation/screens/hotel/Card_Show_Country.dart';
import 'package:tourism_project/presentation/widget/hotel/custom_elevated_buttom.dart';
import 'package:tourism_project/presentation/widget/hotel/listtile_complete.dart';

class FlightPage extends StatefulWidget {
  FlightPage({super.key});

  @override
  State<FlightPage> createState() => _FlightPageState();
}

class _FlightPageState extends State<FlightPage> {
  late List<CountryModel> allCountry;
  String CountrySource = 'Enter The Country';
  int CountryIdSource = 0;
  String CountryDestination = 'Enter The Country';
  int CountryIdDestination = 0;
  static bool roundTrip = true;
  String selectedData = '';
  String depart_date = 'Select Date';
  late SearchFlightCubit myBloc;
  @override
  void initState() {
    super.initState();
    context.read<CountryCubit>().getAllCountrey();
    myBloc = BlocProvider.of<SearchFlightCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchFlightCubit, SearchFlightState>(
        listener: (context, state) {
      if (state is SearchFlightSuccess) {
        GoRouter.of(context).push(AppRoutes.searchFlightPage);
        print('success');
      }
      if (state is SearchFlightFailure) {
        showAlertDialog(context, state.errMessage);
      }
    }, builder: (context, state) {
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
                        bottomLeft: Radius.circular(70),
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/flight.png',
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Positioned(
                    bottom: 40,
                    left: 25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Book Your \nFlight',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Philosopher',
                              fontSize: 35),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        '  Select type trip your :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: WidgetListTileComplete(
                              enableIconButton: false,
                              selectedColor: AppColor.primaryColor,
                              enableCenterText: true,
                              enableIcon: false,
                              selected: roundTrip,
                              text: 'Round Trip',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              onTap: () {
                                setState(() {
                                  roundTrip = true;
                                  User.round = true;
                                });
                              },
                              onTapIconButton: () {},
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: WidgetListTileComplete(
                              enableIconButton: false,
                              selectedColor: AppColor.primaryColor,
                              enableCenterText: true,
                              enableIcon: false,
                              selected: !roundTrip,
                              text: 'oneway',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              onTap: () {
                                setState(() {
                                  roundTrip = false;
                                  User.round = false;
                                });
                              },
                              onTapIconButton: () {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '  From :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      BlocConsumer<CountryCubit, CountryState>(
                          listener: (context, state) {
                        if (state is CountrySuccess) {
                          allCountry = (state).countryList;
                        }
                      }, builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WidgetListTileComplete(
                              enableIconButton: false,
                              enableCenterText: false,
                              enableIcon: true,
                              selected: false,
                              icon: Iconsax.airplane,
                              text: CountrySource,
                              onTap: () {
                                showModalBottomSheet(
                                    // backgroundColor: AppColor.secondColor,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ),
                                    ),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                          height: 300,
                                          child: state is CountrySuccess
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  child: GridView.builder(
                                                    itemCount:
                                                        allCountry.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            index) {
                                                      return CardWidgetCountry(
                                                        country:
                                                            allCountry[index],
                                                        onTap: () {
                                                          CountryIdSource =
                                                              allCountry[index]
                                                                  .id;
                                                          User.countrySourceIdflight =
                                                              allCountry[index]
                                                                  .id;

                                                          setState(() {
                                                            CountrySource =
                                                                allCountry[
                                                                        index]
                                                                    .name;
                                                          });
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      );
                                                    },
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      childAspectRatio: 2.5,
                                                      crossAxisSpacing: 20,
                                                    ),
                                                  ),
                                                )
                                              : const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ));
                                    });
                              },
                              selectedColor: null, onTapIconButton: () {},
                              //   );
                              // },
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              '  To :',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            WidgetListTileComplete(
                              enableIconButton: false,
                              enableCenterText: false,
                              enableIcon: true,
                              selected: false,
                              icon: Iconsax.airplane,
                              text: CountryDestination,
                              onTap: () {
                                showModalBottomSheet(
                                    // backgroundColor: AppColor.secondColor,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ),
                                    ),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                          height: 300,
                                          child: state is CountrySuccess
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  child: GridView.builder(
                                                    itemCount:
                                                        allCountry.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            index) {
                                                      return CardWidgetCountry(
                                                        country:
                                                            allCountry[index],
                                                        onTap: () {
                                                          CountryIdDestination =
                                                              allCountry[index]
                                                                  .id;
                                                          User.countryDestinationIdflight =
                                                              allCountry[index]
                                                                  .id;

                                                          setState(() {
                                                            CountryDestination =
                                                                allCountry[
                                                                        index]
                                                                    .name;
                                                            // User.countryShow = Country;
                                                          });
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      );
                                                    },
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      childAspectRatio: 2.5,
                                                      crossAxisSpacing: 20,
                                                    ),
                                                  ),
                                                )
                                              : const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ));
                                    });
                              },
                              selectedColor: null,
                              onTapIconButton: () {},
                            ),
                          ],
                        );
                      }),
                      const SizedBox(height: 20),
                      const Text(
                        '  Depart :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      WidgetListTileComplete(
                        enableIconButton: false,
                        enableCenterText: false,
                        enableIcon: true,
                        selected: false,
                        icon: Icons.date_range,
                        text: depart_date,
                        onTap: () {
                          selectData(context);
                        },
                        selectedColor: null,
                        onTapIconButton: () {},
                      ),
                      const SizedBox(height: 40),
                      WidgetElevatedButton(
                        height: 55,
                        text: 'Search Flight',
                        onTap: () {
                          roundTrip
                              ? myBloc.getallPlaneTripGoingAndReturn(
                                  country_source_id: CountryIdSource.toString(),
                                  country_destination_id:
                                      CountryIdDestination.toString(),
                                  flight_date: depart_date)
                              : myBloc.getallPlaneTripGoing(
                                  country_source_id: CountryIdSource.toString(),
                                  country_destination_id:
                                      CountryIdDestination.toString(),
                                  flight_date: depart_date);
                        },
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Future<void> selectData(BuildContext context) async {
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
    if (picker != null && picker != selectedData) {
      setState(() {
        selectedData =
            '${picker.year.toString()}-${picker.month.toString().padLeft(2, '0')}-${picker.day.toString().padLeft(2, '0')}';

        depart_date = selectedData;
        User.departFlight = selectedData;
      });
    }
  }
}
