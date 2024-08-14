import 'package:flutter/material.dart';
import 'package:tourism_project/data/models/dynamic_booking_details_model.dart';

class CheckPayCard extends StatelessWidget {
  const CheckPayCard(
      {super.key,
      required this.mymodel,
      required this.noGoing,
      required this.noRetutn,
      required this.goingPrice,
      required this.returnPrice,
      required this.c1,
      required this.c2,
      required this.c4,
      required this.c6});
  final DataModel? mymodel;
  final bool noGoing;
  final bool noRetutn;
  final double goingPrice;
  final double returnPrice;
  final double c1;
  final double c2;
  final double c4;
  final double c6;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        color: Color.fromARGB(255, 248, 255, 240),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  "Check Payment",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(width: 20),
                Icon(Icons.payment)
              ],
            ),
            const SizedBox(height: 10),
            priceRow(
                "Price for (${mymodel!.places!.length.toString()}) places :",
                placePrice()),
            !noGoing
                ? //Text("${(totalPrice * 2).toString()}")
                priceRow("going plane :",
                    "${(goingPrice * mymodel!.dynamicTrip!.numberOfPeople!)}")
                : Container(),
            !noRetutn
                ? priceRow("return plane :",
                    "${(returnPrice * mymodel!.dynamicTrip!.numberOfPeople!)}")
                : Container(),
            priceRow("total rooms : ", "${roomPrice(c1, c2, c4, c6)}"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Price",
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
                Text(
                  "\$ ${mymodel!.dynamicTrip!.price}",
                  style: const TextStyle(color: Colors.red, fontSize: 17),
                )
              ],
            )
          ],
        ),
      ),
    );
    // Card(
    //   elevation: 2,
    //   child: Container(
    // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    //     decoration: BoxDecoration(
    //         color: Color.fromARGB(255, 243, 255, 228),
    //         border: Border.all(color: Color.fromARGB(255, 197, 197, 197))),
    //  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    // child: Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     const Row(
    //       children: [
    //         Text(
    //           "Check Payment",
    //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    //         ),
    //         SizedBox(width: 20),
    //         Icon(Icons.payment)
    //       ],
    //     ),
    //     const SizedBox(height: 10),
    //     priceRow(
    //         "Price for (${mymodel!.places!.length.toString()}) places :",
    //         placePrice()),
    //     !noGoing
    //         ? //Text("${(totalPrice * 2).toString()}")
    //         priceRow("going plane :",
    //             "${(goingPrice * mymodel!.dynamicTrip!.numberOfPeople!)}")
    //         : Container(),
    //     !noRetutn
    //         ? priceRow("return plane :",
    //             "${(returnPrice * mymodel!.dynamicTrip!.numberOfPeople!)}")
    //         : Container(),
    //     priceRow("total rooms : ", "${roomPrice(c2, c4, c6)}"),
    //     const SizedBox(height: 10),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         const Text(
    //           "Total Price",
    //           style: TextStyle(color: Colors.red, fontSize: 18),
    //         ),
    //         Text(
    //           "\$ ${mymodel!.dynamicTrip!.price}",
    //           style: const TextStyle(color: Colors.red, fontSize: 17),
    //         )
    //       ],
    //     )
    //   ],
    // ),
    //   ),
    // );
  }

  double placePrice() {
    double totalPlacePrice = mymodel!.places!
        .fold(0, (sum, place) => sum + double.parse(place.placePrice!));
    return totalPlacePrice;
  }

  double roomPrice(c1, c2, c4, c6) {
    DateTime start = DateTime.parse(mymodel!.dynamicTrip!.startDate!);
    DateTime end = DateTime.parse(mymodel!.dynamicTrip!.endDate!);
    int days = start.difference(end).inDays;
    double c1price = c1 * days;
    double c2price = c2 * days;
    double c4price = c4 * days;
    double c6price = c6 * days;
    return (c1price + c2price + c4price + c6price).abs();
  }

  Widget priceRow(value, price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18),
        ),
        Text(
          "\$ $price",
          style: const TextStyle(fontSize: 17, height: 1.4),
        )
      ],
    );
  }
}
