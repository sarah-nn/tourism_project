import 'package:flutter/material.dart';
import 'package:tourism_project/presentation/widget/Booking/details_price_booking_static/style_text_card_details_price.dart';

class CardPricePlaces extends StatelessWidget {
  CardPricePlaces(
      {super.key, required this.pricePlaces, required this.totalPrice});
  double pricePlaces;
  double totalPrice;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      shadowColor: const Color.fromARGB(255, 179, 218, 249),
      color: const Color.fromARGB(255, 232, 241, 248),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextAddress(
            addressText: 'Places',
          ),
          const SizedBox(height: 5),
          TextDetailsPrice(
            details: 'Ticket price Places for one person',
            price: pricePlaces,
          ),
          const SizedBox(height: 5),
          TextTotalPrice(nameTotal: 'Places', price: totalPrice),
          const SizedBox(height: 10),
          TextIconAndDetailsPrice(
            details: 'Ticket price Places for one person * \nnum persone',
          )
        ]),
      ),
    );
  }
}
