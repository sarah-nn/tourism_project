import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/presentation/widget/Booking/details_price_booking_static/style_text_card_details_price.dart';

// ignore: must_be_immutable
class CardRoomPrice extends StatelessWidget {
  CardRoomPrice(
      {super.key,
      required this.numRoom,
      required this.priceRooms,
      required this.totalPriceRoom});
  int numRoom;
  double priceRooms;
  double totalPriceRoom;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      shadowColor: const Color.fromARGB(255, 247, 241, 207),
      color: const Color.fromARGB(255, 244, 242, 231),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextAddress(
            addressText: 'Room',
          ),
          const SizedBox(height: 5),
          // TextDetailsPrice(
          //   details: 'number rooms needed',
          //   price: numRoom,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'number rooms needed :',
                style: TextStyle(
                  color: AppColor.fifeColor,
                ),
              ),
              Text(
                '$numRoom',
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),

          const SizedBox(height: 5),
          TextDetailsPrice(
            details: 'price rooms in one day',
            price: priceRooms,
          ),
          const SizedBox(height: 5),
          TextTotalPrice(nameTotal: 'Rooms', price: totalPriceRoom),
          const SizedBox(height: 10),
          TextIconAndDetailsPrice(
            details: 'number day * price room in one day',
          )
        ]),
      ),
    );
  }
}
