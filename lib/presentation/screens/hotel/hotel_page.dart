import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/business_logic/country/country_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/info_user.dart';
import 'package:tourism_project/data/models/country_model.dart';
import 'package:tourism_project/presentation/screens/hotel/Card_Show_Country.dart';
import 'package:tourism_project/presentation/widget/hotel/custom_elevated_buttom.dart';
import 'package:tourism_project/presentation/widget/hotel/listtile_complete.dart';

class HotelPage extends StatefulWidget {
  HotelPage({super.key});

  @override
  State<HotelPage> createState() => _HotelPageState();
}

class _HotelPageState extends State<HotelPage> {
  late List<CountryModel> allCountry;
  String Country = 'Enter The Country';
  int CountryId = 0;
  @override
  void initState() {
    super.initState();
    context.read<CountryCubit>().getAllCountrey();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountryCubit, CountryState>(listener: (context, state) {
      if (state is CountrySuccess) {
        allCountry = (state).countryList;
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text("state.success")));
        print('success');
      }
      if (state is CountryFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("state.fauil")));
      }
    }, builder: (context, state) {
      return Scaffold(
        //  backgroundColor: AppColor.secondColor,
        body: Column(children: [
          Expanded(
              flex: 6,
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(70),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                    ),
                    child: Image.asset(
                      AppImage.hotel,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 40,
                  left: 35,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Book Your \n Hotel',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Philosopher',
                            fontSize: 35),
                      ),
                    ],
                  ),
                ),
              ])),
          Padding(
            padding: const EdgeInsets.all(40),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Text(
                  //   "If you want to search for a hotel to book within a cetain country .",
                  //   style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       height: 1.5,
                  //       fontSize: 16,
                  //       color: Color(0xff112D4E)
                  //       //Color.fromARGB(255, 65, 64, 64)
                  //       ),
                  //  ),
                  const Text(
                    " Destination : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  WidgetListTileComplete(
                      enableIcon: false,
                      enableIconButton: true,
                      enableCenterText: false,
                      text: Country,
                      selected: false,
                      onTap: () {
                        // context.read<CountryCubit>().getAllCountrey();
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
                              return Container(
                                  height: 300,
                                  child: state is CountrySuccess
                                      ? Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: GridView.builder(
                                            itemCount: allCountry.length,
                                            itemBuilder:
                                                (BuildContext context, index) {
                                              return CardWidgetCountry(
                                                country: allCountry[index],
                                                onTap: () {
                                                  CountryId =
                                                      allCountry[index].id;
                                                  setState(() {
                                                    Country =
                                                        allCountry[index].name;
                                                    User.countryShow = Country;
                                                  });
                                                  Navigator.pop(context);
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
                                          child: CircularProgressIndicator(),
                                        ));
                            });
                      }),
                  const SizedBox(height: 20),
                  WidgetElevatedButton(
                    onTap: () {
                      if (CountryId == 0) {
                        showAlertDialog(context, 'Please chose country !');
                      } else {
                        GoRouter.of(context)
                            .push('/SearchHotelPage/${CountryId}');
                      }
                    },
                    text: 'Search Hotel',
                    height: 55,
                  )
                ],
              ),
            ),
          )
        ]),
      );
    });
  }
}
