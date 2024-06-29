import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/business_logic/places/places_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';

class PlacesCountry extends StatefulWidget {
  final String countryId;
  final String countryName;
  const PlacesCountry(
      {super.key, required this.countryId, required this.countryName});

  @override
  _PlacesCountryState createState() => _PlacesCountryState();
}

class _PlacesCountryState extends State<PlacesCountry> {
  List<Map<String, dynamic>> placesCountry = [];

  @override
  void initState() {
    super.initState();
    context.read<PlacesCubit>().placeFromCountry(widget.countryId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlacesCubit, PlacesState>(
      listener: (context, state) {
        if (state is CountryPlacesSuccess) {
          print("country place view success");
        } else if (state is PlacesFailure) {
          print(state.errMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.primaryColor,
              title: Text(
                "Places in ${widget.countryName}",
                style: MyTextStyle.headers
                    .copyWith(fontSize: 28, color: Colors.white),
              ),
            ),
            body: state is CountryPlacesSuccess
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: ListView.builder(
                      itemCount: state.places_country.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: GestureDetector(
                            onTap: () {
                              GoRouter.of(context).push(
                                  '/PlaceDesPage/${state.places_country[index]['id']}');
                            },
                            child: Container(
                              height: 70,
                              decoration:
                                  BoxDecoration(color: Colors.grey[200]),
                              child: Row(
                                children: [
                                  Radio(
                                      value: "",
                                      activeColor: AppColor.primaryColor,
                                      groupValue: "",
                                      onChanged: (index) {}),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    state.places_country[index]['name'],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Center(child: CircularProgressIndicator()));
      },
    );
  }
}
