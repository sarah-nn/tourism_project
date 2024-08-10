import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_project/business_logic/details_book.dart/delete_edit_static_trip_cubit.dart';
import 'package:tourism_project/business_logic/details_book.dart/details_book_static_trip_cubit.dart';
import 'package:tourism_project/business_logic/static_trip/book_static_trip/book_static_trip_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/data/models/upcoming_previous_static_trip_model.dart';
import 'package:tourism_project/presentation/widget/Booking/card_previous_trip.dart';
import 'package:tourism_project/presentation/widget/Booking/card_upcoming_Trip.dart';
import 'package:tourism_project/presentation/widget/Booking/text_address_edit_page.dart';
import 'package:tourism_project/presentation/widget/Booking/upcoming_previous.dart';

class TripBookPage extends StatefulWidget {
  const TripBookPage({super.key});

  @override
  State<TripBookPage> createState() => _TripBookPageState();
}

class _TripBookPageState extends State<TripBookPage> {
  bool upcoming = true;
  bool previous = false;
  late UpcomingAndPreviousStatikModel upcomingAndPreviousStatikModel;
  @override
  void initState() {
    super.initState();

    context
        .read<DetailsBookStaticTripCubit>()
        .getBookStaticTripUpcomingAndPrevious();
  }

  void _handleDelete(int id) {
    setState(() {
      upcomingAndPreviousStatikModel.data.futureTrips
          .removeWhere((static) => static.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsBookStaticTripCubit, DetailsBookStaticTripState>(
        listener: (context, state) {
      if (state is DetailsBookStaticTripSuccess) {
        upcomingAndPreviousStatikModel =
            (state).upcomingAndPreviousStatikModel!;
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(const SnackBar(content: Text("state.success")));
      }
      if (state is DetailsBookStaticTripFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("state.fauil")));
      }
    }, builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddressEditAnPage(
              fontSize: 35,
              text: 'Your Trip',
              color: Colors.black,
            ),
            const SizedBox(height: 20),
            UpcomingAndPreviousButton(
              onTapUpcoming: () {
                setState(() {
                  upcoming = true;
                  previous = false;
                });
              },
              colorButtonUpcoming:
                  upcoming ? AppColor.primaryColor : Colors.transparent,
              colorTextUpcoming: upcoming ? Colors.white : Colors.black45,
              onTapPrevious: () {
                setState(() {
                  upcoming = false;
                  previous = true;
                });
              },
              colorButtonPrevious:
                  previous ? AppColor.primaryColor : Colors.transparent,
              colorTextPrevious: previous ? Colors.white : Colors.black45,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: state is DetailsBookStaticTripSuccess
                  ? upcoming
                      ? upcomingAndPreviousStatikModel
                              .data.futureTrips.isNotEmpty
                          ? ListView.builder(
                              itemCount: upcomingAndPreviousStatikModel
                                  .data.futureTrips.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: MultiBlocProvider(
                                    providers: [
                                      BlocProvider(
                                          create: (context) =>
                                              DeleteEditBookStaticCubit()),
                                      BlocProvider(
                                          create: (context) =>
                                              BookStaticTripCubit()),
                                    ],
                                    child: CardUpcomingTrip(
                                      futureTrips:
                                          upcomingAndPreviousStatikModel
                                              .data.futureTrips[index],
                                      onDelete: () => _handleDelete(
                                          upcomingAndPreviousStatikModel
                                              .data.futureTrips[index].id),
                                    ),
                                  ),
                                );
                              },
                            )
                          : const Center(
                              child: Text(
                              'not found',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'normal',
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold),
                            ))
                      : upcomingAndPreviousStatikModel
                              .data.finishedTrips.isNotEmpty
                          ? ListView.builder(
                              itemCount: upcomingAndPreviousStatikModel
                                  .data.finishedTrips.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: BlocProvider(
                                    create: (context) =>
                                        DeleteEditBookStaticCubit(),
                                    child: CardPreviousTrip(
                                      finishedTrips:
                                          upcomingAndPreviousStatikModel
                                              .data.finishedTrips[index],
                                    ),
                                  ),
                                );
                              },
                            )
                          : const Center(child: Text('not found'))
                  : Center(
                      child: Container(
                          height: 200,
                          width: 200,
                          child: Lottie.asset(AppImage.loading))),
            )
          ],
        ),
      );
    });
  }
}
