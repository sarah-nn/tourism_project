import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/details_book.dart/show_details_book_plane_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/details_book_plane_model.dart';
import 'package:tourism_project/data/models/show_details_book_plane_model.dart';
import 'package:tourism_project/presentation/widget/Booking/text_info.dart';
import 'package:tourism_project/presentation/widget/Booking/text_name.dart';
import 'package:tourism_project/presentation/widget/animation_text/hero_text.dart';

class CardPlanePrevious extends StatefulWidget {
  CardPlanePrevious({required this.finishedTripsPlane, super.key});
  final FinishedTripsPlane finishedTripsPlane;

  @override
  State<CardPlanePrevious> createState() => _CardPlanePreviousState();
}

class _CardPlanePreviousState extends State<CardPlanePrevious> {
  ShowDetailsBookPlaneModel? showDetailsBookPlaneModel;
  late ShowDetailsBookPlaneCubit myBloc;
  bool isExpanded = false;

  void toggleExpande() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  void initState() {
    super.initState();
    myBloc = BlocProvider.of<ShowDetailsBookPlaneCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowDetailsBookPlaneCubit, ShowDetailsBookPlaneState>(
        listener: (context, state) {
      if (state is ShowDetailsBookPlaneSuccess) {
        showDetailsBookPlaneModel = (state).showDetailsBookPlaneModel;
      }
      if (state is ShowDetailsBookPlaneFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("state.fauil")));
      }
    }, builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Card(
              shadowColor: Colors.grey,
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColor.secondColor,
                          const Color.fromARGB(255, 234, 241, 248),
                          Colors.white,
                          Color.fromARGB(255, 239, 235, 240),
                        ]),
                    border: Border.all(width: 1, color: AppColor.primaryColor),
                    borderRadius: BorderRadius.circular(25)),
                height: isExpanded ? null : null,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        TextInfoBook(
                            baseText: 'start date',
                            secoundText: widget.finishedTripsPlane.startDate),
                        const SizedBox(height: 10),
                        TextInfoBook(
                            baseText: 'end date',
                            secoundText: widget.finishedTripsPlane.endDate),
                        !isExpanded
                            ? const SizedBox(height: 20)
                            : const SizedBox(height: 10),
                        !isExpanded
                            ? GestureDetector(
                                onTap: () {
                                  toggleExpande();
                                  myBloc.getAllShowDetailsBookPlane(
                                      widget.finishedTripsPlane.id.toString());
                                },
                                child: Text(
                                  'view more details...',
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ))
                            : Container(),
                        if (isExpanded)
                          state is ShowDetailsBookPlaneSuccess ||
                                  state is DeleteBookPlaneSuccess ||
                                  state is DeleteBookPlaneFailure ||
                                  state is EditBookPlaneSuccess ||
                                  state is EditBookPlaneFailure
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ScaleTextOrIcon(
                                          icon: false,
                                          style: const TextStyle(
                                              fontSize: 23,
                                              fontFamily: 'normal',
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 151, 61, 91)),
                                          text:
                                              '${showDetailsBookPlaneModel?.sourceTrip.name}',
                                          icons: null,
                                        ),
                                        Image.asset(
                                          'assets/images/1.png',
                                          color: AppColor.primaryColor,
                                          scale: 1.6,
                                          // color: AppColor.primaryColor,
                                        ),
                                        ScaleTextOrIcon(
                                          icon: false,
                                          style: const TextStyle(
                                              fontSize: 23,
                                              fontFamily: 'normal',
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 151, 61, 91)),
                                          text:
                                              "${showDetailsBookPlaneModel?.destinationTrip.name}",
                                          icons: null,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextInfoBook(
                                        baseText: 'name airport source',
                                        secoundText:
                                            '${showDetailsBookPlaneModel?.goingTrip.airportSource.name}'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextInfoBook(
                                        baseText: 'name airport destination',
                                        secoundText:
                                            '${showDetailsBookPlaneModel?.goingTrip.airportDestination.name}'),
                                    const SizedBox(height: 10),
                                    TextInfoBook(
                                        baseText: 'Number of Person',
                                        secoundText:
                                            '${showDetailsBookPlaneModel?.dynamicTrip.numberOfPeople.toString()}'),
                                    const SizedBox(height: 10),
                                    TextInfoBookPriceAndNote(
                                      baseText: 'Total price',
                                      secoundText:
                                          '${showDetailsBookPlaneModel?.dynamicTrip.price}\$',
                                      sizeSecound: 20,
                                      backgroundColorSecound:
                                          const Color.fromARGB(
                                              255, 243, 218, 222),
                                    ),
                                    const SizedBox(height: 10),
                                    TextInfoBookPriceAndNote(
                                      baseText: 'Note',
                                      secoundText:
                                          '${showDetailsBookPlaneModel?.dynamicTrip.tripNote}',
                                      sizeSecound: 15,
                                      backgroundColorSecound:
                                          const Color.fromARGB(
                                              255, 205, 227, 248),
                                    ),
                                    const SizedBox(
                                      height: 23,
                                    ),
                                    isExpanded
                                        ? GestureDetector(
                                            onTap: () {
                                              toggleExpande();
                                            },
                                            child: Text(
                                              'view less details',
                                              style: TextStyle(
                                                  color: AppColor.primaryColor,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                        : Container()
                                  ],
                                )
                              : const Center(
                                  child: CircularProgressIndicator(),
                                )
                        else
                          Container(),
                        const SizedBox(
                          height: 15,
                        ),
                        const Divider(
                          thickness: 0.6,
                          color: Color.fromARGB(255, 168, 166, 166),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ]),
                ),
              ),
            ),
            //===============================  name book  ============================================

            TextNameBook(
              name: widget.finishedTripsPlane.tripName,
            )
          ],
        ),
      );
    });
  }
}
