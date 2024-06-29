import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/country/country_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/country_model.dart';

class FromToDynamicTrip extends StatefulWidget {
  const FromToDynamicTrip({super.key});

  @override
  State<FromToDynamicTrip> createState() => _FromToDynamicTripState();
}

class _FromToDynamicTripState extends State<FromToDynamicTrip> {
  String dropdownValue = "one";
  List<CountryModel> mylist = [];
  CountryModel? countryModel;
  //List<String> listt = ["ds", "fefsdf", "dfdv", "dklmd"];
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
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              child: DropdownButton<CountryModel>(
                  value: countryModel,
                  hint: Text("it is hint"),
                  //  disabledHint: Text("it s disable hint"),
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  underline: SizedBox(),
                  style: TextStyle(color: AppColor.primaryColor),
                  onChanged: (newVal) {
                    setState(() {
                      countryModel = newVal;
                      gsource = "${newVal!.id.toString()} and ${newVal.name}";
                      print(countryModel);
                    });
                  },
                  items: mylist.map((country) {
                    return DropdownMenuItem<CountryModel>(
                        value: country, child: Text(country.name));
                  }).toList()
                  // [
                  //   DropdownMenuItem<String>(value: "one", child: Text("one")),
                  //   DropdownMenuItem<String>(value: "two", child: Text("two")),
                  //   DropdownMenuItem<String>(
                  //       value: "three", child: Text("three"))
                  // ]
                  // mylist.map((e) {
                  //   return DropdownMenuItem<CountryModel>(
                  //     value: e,
                  //     child: Text(e),
                  //   );
                  // }).toList()

                  ),
            ),
            const SizedBox(height: 15),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15)),
              child: DropdownButton<CountryModel>(
                  value: countryModel,
                  hint: Text("it is hint"),
                  //  disabledHint: Text("it s disable hint"),
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  underline: SizedBox(),
                  style: TextStyle(color: AppColor.primaryColor),
                  onChanged: (newVal) {
                    setState(() {
                      countryModel = newVal;
                      gsource = "${newVal!.id.toString()} and ${newVal.name}";
                      print(countryModel);
                    });
                  },
                  items: mylist.map((country) {
                    return DropdownMenuItem<CountryModel>(
                        value: country, child: Text(country.name));
                  }).toList()),
            ),
          ],
        );
      },
    );
  }
}
