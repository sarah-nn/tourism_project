import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tourism_project/business_logic/static_trip/book_static_trip/book_static_trip_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/data/models/check_trip_num_model.dart';

class CheckStaticBookWidget extends StatefulWidget {
  const CheckStaticBookWidget({
    super.key,
    required this.cubit,
    required this.tripId,
  });
  final BookStaticTripCubit cubit;
  final String tripId;
  @override
  State<CheckStaticBookWidget> createState() => _CheckStaticBookWidgetState();
}

class _CheckStaticBookWidgetState extends State<CheckStaticBookWidget> {
  List<String> headlines = [
    'Rooms needed :',
    'Price details for ',
    'room price :',
    'going_plane Ticket :',
    'return_plane Ticket :',
    'price after Discount :'
  ];
  bool isCheck = false;
  bool imm = true;
  int _counter = 1;
  int discount = 0;
  CheckNum? model;
  bool finish = false;
  late Future<CheckNum> checkModel;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookStaticTripCubit, BookStaticTripState>(
      listener: (context, state) {
        if (state is CheckNumSuccess) {
          model = (state).checkNum;
        }
        if (state is BookSuccess) {
          showBookingDoneDialog(context, AppRoutes.staticTripdetails, "id");
          setState(() {
            finish = true;
          });
        }
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              determineNum(),
              const SizedBox(height: 10),
              isCheck
                  ? state is CheckNumSuccess
                      ? bookingStaticTrip()
                      : state is BookFail
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Card(
                                color: Color.fromARGB(255, 243, 243, 243),
                                elevation: 3,
                                child: Container(
                                  padding: const EdgeInsets.all(30),
                                  alignment: Alignment.center,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Row(
                                        children: [
                                          Icon(
                                            Iconsax.warning_2_copy,
                                            color: Colors.red,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "  Booking Fail with message :",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        "${state.errMessage}",
                                        style:
                                            TextStyle(height: 2, fontSize: 18),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Center(
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  !finish ? "Wait a moment ..." : "Done ..",
                                  style: TextStyle(
                                      fontSize: 16.5,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            )
                  : Container()
            ],
          ),
        );
      },
    );
  }

  Widget bookingStaticTrip() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          color: Color.fromARGB(255, 114, 114, 114),
          thickness: 1,
        ),
        Text(
          "Details :",
          style: MyTextStyle.bright.copyWith(
              color: AppColor.primaryColor,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              fontSize: 25),
        ),
        Card(
          elevation: 5,
          color: Color.fromARGB(255, 240, 240, 240),
          child: Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    "${model?.days}-Day Trip with $_counter people ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                ),
                customRow(headlines[0], "( ${model?.roomsNeeded} )"),
                customRow(headlines[1], ""),
                customRow(headlines[2], "\$ ${model?.roomPrice}"),
                customRow(headlines[3], "\$ ${model?.ticketPriceForGoingTrip}"),
                customRow(
                    headlines[4], "\$ ${model?.ticketPriceForReturnTrip}"),
                model?.priceAfterDiscount == null
                    ? Container()
                    : customRow(
                        headlines[5], "\$ ${model?.priceAfterDiscount}"),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "Total Price :   ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 230, 50, 37),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        "\$ ${model?.totalPrice}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 230, 50, 37),
                        ),
                      ),
                    )
                  ],
                ),
                // model?.priceAfterDiscount == null
                //     ? Container()
                //     :
                Container(
                  padding: EdgeInsets.all(8),
                  child: MaterialButton(
                    onPressed: () {
                      print(discount);
                      setState(() {
                        model?.priceAfterDiscount != null ? discount = 1 : null;
                      });
                    },
                    color: AppColor.secondColor,
                    shape: Border.all(
                        color: AppColor.primaryColor.withOpacity(0.4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        model?.priceAfterDiscount != null
                            ? Text("Use Points To Pay")
                            : Text("Don't Have Enough Points"),
                        Icon(
                          Icons.payments_outlined,
                          color: Colors.black54,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.all(8),
          child: MaterialButton(
              onPressed: () {
                widget.cubit.bookStaticTrip(
                    widget.tripId,
                    _counter.toString(),
                    model!.roomsNeeded.toString(),
                    model!.totalPrice.toString(),
                    model!.priceAfterDiscount.toString(),
                    discount.toString());
                //!finish ? context.pop(context) : null;
              },
              color: AppColor.primaryColor,
              child: const Text(
                "Confirm Book",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
        )
      ],
    );
  }

  Widget customRow(String first, String second) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            first,
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Text(
              second,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  Widget determineNum() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Check Booking",
          style: MyTextStyle.bright.copyWith(
              color: AppColor.primaryColor,
              decoration: TextDecoration.underline),
        ),
        const SizedBox(height: 7),
        RichText(
          text: TextSpan(
            text: "How many ",
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 19.0,
                fontWeight: FontWeight.w500,
                height: 1.5),
            children: <TextSpan>[
              TextSpan(
                  text: "Number of People ",
                  style: TextStyle(color: AppColor.primaryColor)),
              const TextSpan(
                text: "You Want to Travel with ? ",
              ),
            ],
          ),
        ),
        Container(
          //   decoration: BoxDecoration(border: Border.all()),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  IconButton(
                      onPressed: () {
                        _incrementCounter();
                      },
                      icon: const Icon(
                        Iconsax.add_circle_copy,
                        size: 30,
                      )),
                  SizedBox(width: 5),
                  Text(
                    "$_counter",
                    style: MyTextStyle.Pacifico.copyWith(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.normal,
                        fontSize: 32),
                  ),
                  SizedBox(width: 5),
                  IconButton(
                      onPressed: () {
                        _decrementCounter();
                      },
                      icon: const Icon(
                        Iconsax.minus_cirlce_copy,
                        size: 30,
                      ))
                ]),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.secondColor,
                    border: Border.all(color: AppColor.primaryColor)),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        isCheck = true;
                      });
                      widget.cubit
                          .checkTrip(_counter.toString(), widget.tripId);
                    },
                    icon: Icon(
                      Icons.done_sharp,
                      color: AppColor.primaryColor,
                      size: 40,
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
