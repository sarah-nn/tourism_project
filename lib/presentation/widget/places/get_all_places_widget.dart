import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/places/places_cubit.dart';
import 'package:tourism_project/data/models/places_model.dart';
import 'package:tourism_project/presentation/widget/places/places_item.dart';

class GetAllPlacesWidget extends StatefulWidget {
  const GetAllPlacesWidget({super.key});

  @override
  State<GetAllPlacesWidget> createState() => _GetAllPlacesWidgetState();
}

class _GetAllPlacesWidgetState extends State<GetAllPlacesWidget> {
  late Future<List<Place>> _getAllPlaces;

  @override
  void initState() {
    _getAllPlaces = BlocProvider.of<PlacesCubit>(context).getAllPlace();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getAllPlaces,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Place> myPlaces = snapshot.data!;
            return ListView.builder(
                itemCount: myPlaces.length,
                itemBuilder: (context, index) {
                  return PlaceItem(place: myPlaces[index]);
                });
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
