import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_project/business_logic/details_book.dart/details_book_hotel_cubit.dart';
import 'package:tourism_project/business_logic/details_book.dart/show_details_book_hotel_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/data/models/details_book_hotel_model.dart';
import 'package:tourism_project/presentation/widget/Booking/card_hote_book_previous.dart';
import 'package:tourism_project/presentation/widget/Booking/card_hotel_book_upcoming.dart';
import 'package:tourism_project/presentation/widget/Booking/text_address_edit_page.dart';
import 'package:tourism_project/presentation/widget/animation_text/hero_text.dart';

class HotelBookPage extends StatefulWidget {
  const HotelBookPage({super.key});

  @override
  State<HotelBookPage> createState() => _HotelBookPageState();
}

class _HotelBookPageState extends State<HotelBookPage> {
  bool upcoming = true;
  bool previous = false;

  bool isExpanded = false;

  late DetailsBookHotelModel detailsBookHotelModel;
  @override
  void initState() {
    super.initState();
    context.read<DetailsBookHotelCubit>().getAllDetailsBookHotel();
  }

  void toggleExpande() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void _handleDelete(int id) {
    setState(() {
      detailsBookHotelModel.data.futureTripsHotel
          .removeWhere((hotel) => hotel.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsBookHotelCubit, DetailsBookHotelState>(
        listener: (context, state) {
      if (state is DetailsBookHotelSuccess) {
        detailsBookHotelModel = (state).detailsBookHotel;
      }
      if (state is DetailsBookHotelFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("state.fauil")));
      }
    }, builder: (context, state) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AddressEditAnPage(
                  text: 'Your Hotel',
                  color: Colors.black,
                  fontSize: 33,
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          upcoming = !upcoming;
                          previous = !previous;
                        });
                      },
                      child: Text(
                        upcoming ? 'PREVIOUS' : 'UPCOMING',
                        style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    Icon(
                      upcoming ? Icons.arrow_upward : Icons.arrow_downward,
                      color: AppColor.primaryColor,
                    )
                  ],
                )
              ],
            ),
            Expanded(
                child: state is DetailsBookHotelSuccess
                    ? upcoming
                        ? detailsBookHotelModel.data.futureTripsHotel.isEmpty
                            ? Center(
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Not found any Booking',
                                    style: TextStyle(
                                        fontFamily: 'normal',
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                  ),
                                  const SizedBox(height: 15),
                                  TextButton(
                                      onPressed: () {
                                        GoRouter.of(context)
                                            .push(AppRoutes.hotelPage);
                                      },
                                      child: ScaleTextOrIcon(
                                        icon: false,
                                        text: 'Booking now !',
                                        style: TextStyle(
                                          fontFamily: 'Pacifico',
                                          fontSize: 24,
                                          color: AppColor.primaryColor,
                                        ),
                                        icons: null,
                                      )),
                                  const SizedBox(height: 10)
                                ],
                              ))
                            : ListView.builder(
                                itemCount: detailsBookHotelModel
                                    .data.futureTripsHotel.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(top: 35),
                                      child: BlocProvider(
                                          create: (context) =>
                                              ShowDetailsBookHotelCubit(),
                                          child: CardHotelBook(
                                            futureTripsHotel:
                                                detailsBookHotelModel.data
                                                    .futureTripsHotel[index],
                                            onDelete: () => _handleDelete(
                                                detailsBookHotelModel
                                                    .data
                                                    .futureTripsHotel[index]
                                                    .id),
                                          )));
                                },
                              )
                        : detailsBookHotelModel
                                .data.finishedTripsHotel.isNotEmpty
                            ? ListView.builder(
                                itemBuilder: (BuildContext context, int index) {
                                return CardHotelPrevious(
                                    finishedTripsHotel: detailsBookHotelModel
                                        .data.finishedTripsHotel[index]);
                              })
                            : const Center(
                                child: Text(
                                  "No previous bookings found",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                      fontFamily: 'normal',
                                      fontSize: 23),
                                ),
                              )
                    : Center(
                        child: Container(
                            height: 200,
                            width: 200,
                            child: Lottie.asset(AppImage.loading)))),
          ]),
        ),
      );
    });
  }
}
