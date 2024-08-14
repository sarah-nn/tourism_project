import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_project/business_logic/static_trip/static_trip_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/data/models/static_trip_details_model.dart';
import 'package:tourism_project/presentation/widget/static_trip/details/custom_onelineContainer.dart';
import 'package:tourism_project/presentation/widget/static_trip/details/custom_twolineContainer.dart';
import 'package:tourism_project/presentation/widget/static_trip/details/price_book_buttom_widget.dart';
import 'package:tourism_project/presentation/widget/static_trip/details/static_activities_widget.dart';
import 'package:tourism_project/presentation/widget/static_trip/details/static_flight_widget.dart';
import 'package:tourism_project/presentation/widget/static_trip/details/static_hotel_widget.dart';
import 'package:tourism_project/presentation/widget/static_trip/details/static_place_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class StaticTripDetailsPage extends StatefulWidget {
  final String tripId;
  final List<dynamic>? imageList;
  const StaticTripDetailsPage({
    super.key,
    required this.tripId,
    @required this.imageList,
  });

  @override
  State<StaticTripDetailsPage> createState() => _StaticTripDetailsPageState();
}

class _StaticTripDetailsPageState extends State<StaticTripDetailsPage> {
  final String telegramUsername = '+CaFDyE2sTd45YmU0';
  void _launchTelegram() async {
    var url = 'https://t.me/+CaFDyE2sTd45YmU0';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  StaticDetailsModel? tripModel;
  @override
  void initState() {
    super.initState();
    context.read<StaticTripCubit>().getStaticTripDetails(widget.tripId);
    if (widget.imageList == null) {
      print("🤣🤣🤣🤣🤣🤣");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StaticTripCubit, StaticTripState>(
      listener: (context, state) {
        if (state is StaticTripDetails) {
          tripModel = (state).staticModel;
          print(tripModel!.goingTrip);
          print(tripModel!.returnTrip);
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
                            widget.imageList != null
                                ? CarouselSlider(
                                    disableGesture: true,
                                    items: [
                                      ...List.generate(
                                          widget.imageList!.length,
                                          (index) => imageSlider(widget
                                              .imageList![index]['image']))
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
                                  )
                                : Container(),
                            const SizedBox(height: 10),
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
                            Container(
                              height: 65,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: AppColor.primaryColor)),
                                  backgroundColor:
                                      Color.fromARGB(255, 197, 222, 241),
                                ),
                                onPressed: _launchTelegram,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Join our trip Group',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 26, 73, 112),
                                          fontSize: 17),
                                    ),
                                    Container(
                                      height: 55,
                                      width: 55,
                                      child: Image.asset(AppIcon.telegramIcon),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: PriceAndBookButtom(
                            price:
                                "\$ ${tripModel!.staticTrip!.price.toString()}",
                            tripId: tripModel!.staticTrip!.id.toString(),
                          ))
                    ],
                  )
                : Center(
                    child: Container(
                        height: 200,
                        width: 200,
                        child: Lottie.asset(AppImage.loading))));
      },
    );
  }
}

Widget imageSlider(String customImage) {
  return Container(
    width: 400,
    decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(EndPoint.imageBaseUrl + customImage),
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
