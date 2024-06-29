import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/places/place_desc_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/data/models/place_desc_model.dart';
import 'package:tourism_project/presentation/widget/place_desc/place_action.dart';
import 'package:tourism_project/presentation/widget/place_desc/place_desc_overview.dart';
import 'package:tourism_project/presentation/widget/place_desc/place_desc_text.dart';
import 'package:tourism_project/presentation/widget/place_desc/place_image.dart';
import 'package:tourism_project/presentation/widget/place_desc/place_images.dart';
import 'package:tourism_project/presentation/widget/place_desc/place_location_cat.dart';
import 'package:tourism_project/presentation/widget/place_desc/place_name_price.dart';

class PlaceDescPage extends StatefulWidget {
  final String placeId;
  const PlaceDescPage({super.key, required this.placeId});

  @override
  State<PlaceDescPage> createState() => _TestPageState();
}

class _TestPageState extends State<PlaceDescPage> {
  late PlaceDescModel placeDescModel;

  @override
  void initState() {
    super.initState();
    context.read<PlaceDescCubit>().getAllPlace(widget.placeId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlaceDescCubit, PlaceDescState>(
      listener: (context, state) {
        if (state is PlaceDescSuccess) {
          print("success to get place description");
        }
        if (state is PlaceDescFailure) {
          showAlertDialog(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            children: [
              const Positioned(child: PlaceImage()),
              const Positioned(top: 55, left: 20, child: PlaceAction()),
              Positioned(
                  top: 290,
                  child: state is PlaceDescSuccess
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: NameAndPrice(
                                        placeName: state.placeDescModel.name,
                                        price: state.placeDescModel.placePrice),
                                  ),
                                  SizedBox(
                                    child: LocationAndCategory(
                                        country: state
                                            .placeDescModel.area.country.name,
                                        area: state.placeDescModel.area.name,
                                        category: state
                                            .placeDescModel.categories
                                            .map((e) => e.name.toString())),
                                  ),
                                  const SizedBox(height: 50),
                                  SizedBox(
                                    child: DescriptionAndOverview(
                                      placeId:
                                          state.placeDescModel.id.toString(),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    child: PlaceDescText(
                                      maxWords: 22,
                                      text: state.placeDescModel.text,
                                    ),
                                  ),
                                  const SizedBox(height: 23),
                                  const Gallery(),
                                  const SizedBox(height: 50),
                                  Container(
                                    height: 100,
                                    color: Colors.white,
                                  ),
                                  Container(
                                    height: 200,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : Container()),
            ],
          ),
        ));
      },
    );
  }
}
