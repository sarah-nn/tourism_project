import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/static_trip/static_trip_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/data/models/static_trip_details_model.dart';
import 'package:tourism_project/presentation/widget/static_trip/details/custom_onelineContainer.dart';
import 'package:tourism_project/presentation/widget/static_trip/details/custom_twolineContainer.dart';
import 'package:tourism_project/presentation/widget/static_trip/details/price_book_buttom_widget.dart';
import 'package:tourism_project/presentation/widget/static_trip/details/static_activities_widget.dart';
import 'package:tourism_project/presentation/widget/static_trip/details/static_flight_widget.dart';
import 'package:tourism_project/presentation/widget/static_trip/details/static_hotel_widget.dart';
import 'package:tourism_project/presentation/widget/static_trip/details/static_place_widget.dart';

class StaticTripDetailsPage extends StatefulWidget {
  final String tripId;
  const StaticTripDetailsPage({super.key, required this.tripId});

  @override
  State<StaticTripDetailsPage> createState() => _StaticTripDetailsPageState();
}

class _StaticTripDetailsPageState extends State<StaticTripDetailsPage> {
  StaticDetailsModel? tripModel;
  @override
  void initState() {
    super.initState();
    context.read<StaticTripCubit>().getStaticTripDetails(widget.tripId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StaticTripCubit, StaticTripState>(
      listener: (context, state) {
        if (state is StaticTripDetails) {
          tripModel = (state).staticModel;
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: appBar(context),
            body: state is StaticTripDetails
                ? Column(
                    children: [
                      Expanded(
                        flex: 17,
                        child: ListView(
                          children: [
                            const SizedBox(height: 25),
                            CarouselSlider(
                              disableGesture: true,
                              items: [
                                imageSlider(AppImage.onboarding1),
                                imageSlider(AppImage.nearMe),
                                imageSlider(AppImage.two),
                                imageSlider(AppImage.tajMahal)
                              ],
                              options: CarouselOptions(
                                enableInfiniteScroll: false,
                                reverse: true,
                                height: 240,
                                aspectRatio: 16 / 8,
                                viewportFraction: 0.6,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.3,
                              ),
                            ),
                            const SizedBox(height: 30),
                            OneLineContainer(
                                title: "Trip name",
                                content: tripModel!.staticTrip!.tripName!),
                            TwoLineContainer(
                                title1: "Source",
                                content1:
                                    "start from ${tripModel!.sourceTrip!.name}",
                                title2: "Destination",
                                content2:
                                    "end in ${tripModel!.destinationTrip!.name}"),
                            StaticFlightWidget(myTripModel: tripModel!),
                            StaticHotelWidget(tripModel: tripModel!),
                            TwoLineContainer(
                                title1: "Start date",
                                content1: tripModel!.staticTrip!.startDate!,
                                title2: "End date",
                                content2: tripModel!.staticTrip!.endDate!),
                            OneLineContainer(
                                title: "Max number of tourist",
                                content:
                                    "${tripModel!.staticTrip!.numberOfPeople!} person"),
                            StaticActivityWidget(tripModel: tripModel!),
                            StaticPlaceWidget(tripModel: tripModel!),
                            OneLineContainer(
                                title: "Trip notes",
                                content: tripModel!.staticTrip!.tripNote!),
                          ],
                        ),
                      ),
                      const Expanded(
                          flex: 2, child: PriceAndBookButtom(price: "\$ 569.0"))
                    ],
                  )
                : const Center(child: CircularProgressIndicator()));
      },
    );
  }
}

Widget imageSlider(String customImage) {
  return Container(
    width: 400,
    decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(customImage),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20)),
  );
}

PreferredSizeWidget appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      "Trip Details",
      style: MyTextStyle.bright.copyWith(
          fontSize: 38,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5),
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back, size: 30, color: Colors.black),
    ),
    elevation: 0,
  );
}
