import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/business_logic/details_book.dart/delete_edit_static_trip_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/show_details_price_static_model.dart';
import 'package:tourism_project/data/models/upcoming_previous_static_trip_model.dart';
import 'package:tourism_project/presentation/widget/Booking/text_info.dart';

// ignore: must_be_immutable
class CardPreviousTrip extends StatefulWidget {
  CardPreviousTrip({required this.finishedTrips, super.key});
  FinishedTrips finishedTrips;

  @override
  State<CardPreviousTrip> createState() => _CardPreviousTripState();
}

class _CardPreviousTripState extends State<CardPreviousTrip> {
  late DeleteEditBookStaticCubit myBloc;
  late ShowDetailsPriceStatic showDetailsPriceStatic;

  @override
  void initState() {
    super.initState();

    myBloc = BlocProvider.of<DeleteEditBookStaticCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteEditBookStaticCubit, DeleteEditBookStaticState>(
        listener: (context, state) {
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
        padding: const EdgeInsets.only(top: 10),
        child: Card(
          clipBehavior: Clip.none,
          elevation: 7,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          shadowColor: const Color.fromARGB(255, 153, 203, 243),
          color: Colors.white70,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 0.5, color: AppColor.primaryColor)),
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.finishedTrips.staticTrip.tripName,
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              // fontWeight: FontWeight.bold,
                              fontSize: 26,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${widget.finishedTrips.staticTrip.startDate}   ',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'Philosopher',
                              color: Colors.black54),
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Color.fromARGB(255, 2, 148, 252),
                        ),
                        Text('   ${widget.finishedTrips.staticTrip.endDate}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: 'Philosopher',
                                color: Colors.black54))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextInfoBook(
                        baseText: 'numer of persone',
                        secoundText:
                            widget.finishedTrips.numberOfFriend.toString()),
                    const SizedBox(height: 6),
                    TextInfoBookPriceAndNote(
                      baseText: 'book price',
                      secoundText: '${widget.finishedTrips.bookPrice}\$',
                      sizeSecound: 20,
                      backgroundColorSecound:
                          const Color.fromARGB(255, 243, 202, 216),
                    ),
                    TextButton(
                        onPressed: () {
                          myBloc.showPrice(widget.finishedTrips.id.toString());
                        },
                        child: Text(
                          'Show Details Price ?!',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 16,
                              fontFamily: 'normal',
                              decoration: TextDecoration.underline,
                              decorationThickness: 1.5,
                              decorationColor: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.secondColor,
                          border: Border.all(
                              width: 0.5, color: AppColor.fifeColor)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextInfoBookPriceAndNote(
                          baseText: 'Note',
                          secoundText: widget.finishedTrips.staticTrip.tripNote,
                          sizeSecound: 16,
                          backgroundColorSecound:
                              const Color.fromARGB(255, 247, 248, 225),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                            4,
                            (index) => const Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 247, 194, 5),
                                  size: 23,
                                )),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          GoRouter.of(context).push(
                              '/StaticTripDetailsPage/${widget.finishedTrips.staticTripId}',
                              extra: null);
                        },
                        child: Text(
                          'view more details...',
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                )),
          ),
        ),
      );
    });
  }
}
