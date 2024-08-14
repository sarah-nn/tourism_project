import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_project/business_logic/details_book.dart/details_book_plane_cubit.dart';
import 'package:tourism_project/business_logic/details_book.dart/show_details_book_plane_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/data/models/details_book_plane_model.dart';
import 'package:tourism_project/presentation/widget/Booking/card_plane_book.dart';
import 'package:tourism_project/presentation/widget/Booking/card_plane_book_previous.dart';
import 'package:tourism_project/presentation/widget/Booking/text_address_edit_page.dart';
import 'package:tourism_project/presentation/widget/animation_text/hero_text.dart';

class PlaneBookPage extends StatefulWidget {
  const PlaneBookPage({super.key});

  @override
  State<PlaneBookPage> createState() => _PlaneBookPageState();
}

class _PlaneBookPageState extends State<PlaneBookPage> {
  bool upcoming = true;
  bool previous = false;

  bool isExpanded = false;

  late DetailsBookPlaneModel detailsBookPlaneModel;
  @override
  void initState() {
    super.initState();
    context.read<DetailsBookPlaneCubit>().getAllDetailsBookPlane();
  }

  void toggleExpande() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void _handleDelete(int id) {
    setState(() {
      detailsBookPlaneModel.data.futureTripsPlane
          .removeWhere((plane) => plane.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsBookPlaneCubit, DetailsBookPlaneState>(
        listener: (context, state) {
      if (state is DetailsBookPlaneSuccess) {
        detailsBookPlaneModel = (state).detailsBookPlane;
      }
      if (state is DetailsBookPlaneFailure) {
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
                  text: 'Your Plane',
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
                child: state is DetailsBookPlaneSuccess
                    ? upcoming
                        ? detailsBookPlaneModel.data.futureTripsPlane.isEmpty
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
                                            .push(AppRoutes.flightPage);
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
                                itemCount: detailsBookPlaneModel
                                    .data.futureTripsPlane.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(top: 35),
                                      child: BlocProvider(
                                          create: (context) =>
                                              ShowDetailsBookPlaneCubit(),
                                          child: CardPlaeBook(
                                            futureTripsPlane:
                                                detailsBookPlaneModel.data
                                                    .futureTripsPlane[index],
                                            onDelete: () => _handleDelete(
                                                detailsBookPlaneModel
                                                    .data
                                                    .futureTripsPlane[index]
                                                    .id),
                                          )));
                                },
                              )
                        : detailsBookPlaneModel
                                .data.finishedTripsPlane.isNotEmpty
                            ? ListView.builder(
                                itemBuilder: (BuildContext context, int index) {
                                return CardPlanePrevious(
                                    finishedTripsPlane: detailsBookPlaneModel
                                        .data.finishedTripsPlane[index]);
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
