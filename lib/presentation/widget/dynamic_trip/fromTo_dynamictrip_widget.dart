import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/country/country_cubit.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/country_model.dart';

class FromToDynamicTrip extends StatefulWidget {
  const FromToDynamicTrip({super.key});

  @override
  State<FromToDynamicTrip> createState() => _FromToDynamicTripState();
}

class _FromToDynamicTripState extends State<FromToDynamicTrip> {
  List<CountryModel> mylist = [];
  CountryModel? countryModel1;
  CountryModel? countryModel2;

  @override
  void initState() {
    super.initState();
    context.read<CountryCubit>().getAllCountrey();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountryCubit, CountryState>(
      listener: (context, state) {
        if (state is CountrySuccess) {
          mylist = (state).countryList;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.IconAdd, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: DropdownButton<CountryModel>(
                    value: countryModel1,
                    hint: const Text("Choose Source Country"),
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    underline: const SizedBox(),
                    style: TextStyle(color: AppColor.primaryColor),
                    onChanged: (newVal) {
                      setState(() {
                        countryModel1 = newVal;
                        BlocProvider.of<DynamicTripCubit>(context)
                            .sourceTripId = newVal!.id.toString();
                        // gsource = "${newVal!.id.toString()} and ${newVal.name}";
                      });
                    },
                    items: mylist.map((country) {
                      return DropdownMenuItem<CountryModel>(
                          value: country,
                          child: Text(
                            country.name,
                            style: TextStyle(fontSize: 21),
                          ));
                    }).toList()),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 50,
              padding: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.IconAdd, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: DropdownButton<CountryModel>(
                    value: countryModel2,
                    hint: const Text("Choose Dist Country"),
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    underline: const SizedBox(),
                    style: TextStyle(color: AppColor.primaryColor),
                    onChanged: (newVal) {
                      setState(() {
                        countryModel2 = newVal;
                        BlocProvider.of<DynamicTripCubit>(context)
                            .destinationTripId = newVal!.id.toString();
                        // gSourceId = newVal!.id.toString();
                        // gdistinationId = newVal.id.toString();
                        // print(gSourceId);
                      });
                    },
                    items: mylist.map((country) {
                      return DropdownMenuItem<CountryModel>(
                          value: country,
                          child: Text(
                            country.name,
                            style: TextStyle(fontSize: 21),
                          ));
                    }).toList()),
              ),
            ),
          ],
        );
      },
    );
  }
}
