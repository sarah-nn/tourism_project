import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/business_logic/details_book.dart/delete_edit_static_trip_cubit.dart';
import 'package:tourism_project/business_logic/static_trip/book_static_trip/book_static_trip_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/check_trip_num_model.dart';
import 'package:tourism_project/data/models/show_details_price_static_model.dart';
import 'package:tourism_project/data/models/upcoming_previous_static_trip_model.dart';
import 'package:tourism_project/presentation/widget/Booking/edit_book_static.dart';
import 'package:tourism_project/presentation/widget/Booking/text_info.dart';
import 'package:tourism_project/presentation/widget/Booking/text_name.dart';

// ignore: must_be_immutable
class CardUpcomingTrip extends StatefulWidget {
  CardUpcomingTrip(
      {required this.futureTrips, required this.onDelete, super.key});
  FutureTrips futureTrips;
  final VoidCallback onDelete;

  @override
  State<CardUpcomingTrip> createState() => _CardUpcomingTripState();
}

class _CardUpcomingTripState extends State<CardUpcomingTrip> {
  late DateTime date1;
  late DateTime date2;
  bool comparte = false;
  int difference = 0;
  int editNumPersone = 1;
  late DeleteEditBookStaticCubit myBloc;
  late CheckNum checkNum;
  late ShowDetailsPriceStatic showDetailsPriceStatic;
  late BookStaticTripCubit myCubit;
  bool isExpanded = false;
  bool isCheck = false;
  void toggleExpande() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  void initState() {
    super.initState();

    myBloc = BlocProvider.of<DeleteEditBookStaticCubit>(context);
    myCubit = BlocProvider.of<BookStaticTripCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteEditBookStaticCubit, DeleteEditBookStaticState>(
        listener: (context, state) {
      if (state is DeleteBookStaticSuccess) {
        widget.onDelete();

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(seconds: 2),
          content: Row(
            children: [
              Icon(
                Icons.arrow_right,
                color: AppColor.secondColor,
              ),
              Text(
                state.message,
                style: TextStyle(
                  color: AppColor.secondColor,
                  fontFamily: 'normal',
                ),
              ),
            ],
          ),
          shape: Border.all(
              width: 1.7,
              color: AppColor.secondColor,
              style: BorderStyle.solid),
          elevation: 10,
          backgroundColor: const Color.fromARGB(255, 61, 105, 141),
        ));
      } else if (state is DeleteBookStaticFailure) {
        showAlertDialog(context, state.errMessage);
      }
      if (state is ShowPriceSuccess) {
        showDetailsPriceStatic = state.showDetailsPriceStatic;
        showDetailsPriceBookStatic(
          context,
          numDays: showDetailsPriceStatic.days,
          numFreiends: showDetailsPriceStatic.numberOfFriend,
          roomNedd: showDetailsPriceStatic.roomsNeeded,
          priceRoom: showDetailsPriceStatic.roomPrice,
          ticketgoing: showDetailsPriceStatic.ticketPriceForGoingTrip,
          ticketReturn: showDetailsPriceStatic.ticketPriceForReturnTrip,
          ticketPlaces: showDetailsPriceStatic.ticketPriceForPlaces,
          totalPrice: showDetailsPriceStatic.totalPrice,
        );
      }
      if (state is ShowPriceFail) {
        showAlertDialog(context, state.errMessage);
      }
    }, builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 26),
        child: Stack(clipBehavior: Clip.none, children: [
          Card(
            shadowColor: Colors.grey,
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.secondColor.withAlpha(160),
                border: Border.all(width: 1, color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    TextInfoBook(
                        baseText: 'start trip',
                        secoundText: widget.futureTrips.staticTrip.startDate),
                    const SizedBox(height: 6),
                    TextInfoBook(
                        baseText: 'end trip',
                        secoundText: widget.futureTrips.staticTrip.endDate),
                    const SizedBox(height: 6),
                    TextInfoBook(
                        baseText: 'numer of persone',
                        secoundText:
                            widget.futureTrips.numberOfFriend.toString()),
                    const SizedBox(height: 6),
                    TextInfoBookPriceAndNote(
                      baseText: 'book price',
                      secoundText: '${widget.futureTrips.bookPrice}\$',
                      sizeSecound: 20,
                      backgroundColorSecound:
                          const Color.fromARGB(255, 204, 226, 250),
                    ),
                    TextButton(
                        onPressed: () {
                          myBloc.showPrice(widget.futureTrips.id.toString());
                        },
                        child: const Text(
                          'Show Details Price ?!',
                          style: TextStyle(
                              color: Color.fromARGB(255, 252, 117, 104),
                              fontSize: 16,
                              fontFamily: 'normal',
                              decoration: TextDecoration.underline,
                              decorationThickness: 1.5,
                              decorationColor: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
                    // const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.secondColor,
                          border: Border.all(
                              width: 0.5, color: AppColor.fifeColor)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextInfoBook(
                          baseText: 'Note',
                          secoundText: widget.futureTrips.staticTrip.tripNote,
                        ),
                      ),
                    ),

                    TextButton(
                        onPressed: () {
                          GoRouter.of(context).push(
                              '/StaticTripDetailsPage/${widget.futureTrips.staticTripId}',
                              extra: false);
                        },
                        child: Text(
                          'view more details...',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        )),
                    const Divider(
                      thickness: 0.6,
                      color: Color.fromARGB(255, 168, 166, 166),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    BlocConsumer<BookStaticTripCubit, BookStaticTripState>(
                        listener: (context, state) {
                      if (state is CheckNumSuccess) {
                        checkNum = state.checkNum;
                      }
                      if (state is BookFail) {}
                    }, builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              final staticTripCubit =
                                  context.read<BookStaticTripCubit>();
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  showDragHandle: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25),
                                    ),
                                  ),
                                  context: context,
                                  builder: (context) {
                                    // Pass the cubit instance to the bottom sheet
                                    return BlocProvider.value(
                                      value: staticTripCubit,
                                      child: EditBookStaticTrip(
                                        futureTrips: widget.futureTrips,
                                        cubit: staticTripCubit,
                                        tripId: widget.futureTrips.staticTripId
                                            .toString(),
                                        editTrip:
                                            widget.futureTrips.id.toString(),
                                        // state: errMessage,
                                      ),
                                    );
                                  });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: AppColor.primaryColor,
                                ),
                                const Text(
                                  ' Edit Book',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45),
                                )
                              ],
                            ),
                          ),
                          const VerticalDivider(
                            thickness: 3.2,
                            width: 2,
                          ),
                          GestureDetector(
                            onTap: () {
                              date1 = DateTime.now();
                              date2 = DateTime.parse(
                                  widget.futureTrips.staticTrip.startDate);
                              difference = date2.difference(date1).inHours;
                              if (difference >= 0 && difference <= 48) {
                                comparte = true;
                              } else {
                                comparte = false;
                              }
                              showAlertDialogQuestion(context, () {
                                BlocProvider.of<DeleteEditBookStaticCubit>(
                                        context)
                                    .deleteStaticTrip(
                                        widget.futureTrips.id.toString());
                                Navigator.pop(context);
                              }, () {
                                Navigator.pop(context);
                              }, comparte, 'you want cancel book ?');
                            },
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 245, 142, 135),
                                ),
                                Text(
                                  ' Cancel Book',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45),
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
          TextNameBook(
            name: widget.futureTrips.staticTrip.tripName,
          )
        ]),
      );
    });
  }
}
