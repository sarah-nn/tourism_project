import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/places/place_desc_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/data/models/place_desc_model.dart';
import 'package:tourism_project/presentation/widget/place_desc/place_desc_overview.dart';
import 'package:tourism_project/presentation/widget/place_desc/place_desc_text.dart';
import 'package:tourism_project/presentation/widget/place_desc/place_images.dart';
import 'package:tourism_project/presentation/widget/place_desc/place_location_cat.dart';
import 'package:tourism_project/presentation/widget/place_desc/place_name_price.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceDescPage extends StatefulWidget {
  final String placeId;
  const PlaceDescPage({super.key, required this.placeId});

  @override
  State<PlaceDescPage> createState() => _TestPageState();
}

class _TestPageState extends State<PlaceDescPage> {
  Future<void> _launchMap(String lat, String lon) async {
    final String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$lon';

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }

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
    }, builder: (context, state) {
      return SafeArea(
          child: Scaffold(
        body: Stack(
          children: [
            //! this is not exactly responsse
            Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImage.tajMahal), fit: BoxFit.cover)),
            ),
            buttonArrow(context),
            DraggableScrollableSheet(
                initialChildSize: 0.62,
                maxChildSize: 1.0,
                minChildSize: 0.62,
                builder: (context, scrollController) {
                  return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                      ),
                      child: SingleChildScrollView(
                          controller: scrollController,
                          child: state is PlaceDescSuccess
                              ? scroll(state)
                              : Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height /
                                          3),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )));
                })
          ],
        ),
      ));
    });
  }

  buttonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  scroll(state) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          child: NameAndPrice(
              placeName: state.placeDescModel.name!,
              price: state.placeDescModel.placePrice!),
        ),
        SizedBox(
          child: LocationAndCategory(
              country: state.placeDescModel.area!.country!.name!,
              //  state
              //     .placeDescModel.area.country.name,
              // area: state.placeDescModel.area.name,
              area: state.placeDescModel.area!.name!,
              category: state.placeDescModel.categories!
                  .map((e) => e.name.toString())),
        ),
        const SizedBox(height: 50),
        SizedBox(
          child: DescriptionAndOverview(
            placeId: state.placeDescModel.id.toString(),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          child: PlaceDescText(
            maxWords: 22,
            text: state.placeDescModel.text!,
          ),
        ),
        const SizedBox(height: 23),
        const Gallery(),
        const SizedBox(height: 30),
        GestureDetector(
          onTap: () {
            final String latitude = 33.511900.toString();
            final String longitude = 36.306700.toString();
            _launchMap(latitude, longitude);
          },
          child: Container(
            height: 37,
            alignment: Alignment.center,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black54)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "View On Map",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                SizedBox(width: 12),
                Icon(
                  Icons.map_outlined,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
