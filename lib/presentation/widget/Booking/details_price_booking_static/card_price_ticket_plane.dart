import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/presentation/widget/Booking/details_price_booking_static/style_text_card_details_price.dart';

// ignore: must_be_immutable
class CardTicketPrice extends StatelessWidget {
  CardTicketPrice(
      {super.key,
      required this.priceTicketGoing,
      required this.priceTicketReturn,
      required this.totalpriceTicket});
  String priceTicketGoing;
  String priceTicketReturn;
  String totalpriceTicket;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 243, 244, 250),
      elevation: 7,
      shadowColor: const Color.fromARGB(255, 157, 171, 250),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextAddress(
            addressText: 'Ticket Plane',
          ),
          const SizedBox(height: 5),
          // TextDetailsPrice(
          //   details: 'Ticket price going for one person',
          //   price: priceTicketGoing,
          // ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ticket price going for one person :',
                style: TextStyle(
                  color: AppColor.fifeColor,
                ),
              ),
              Text(
                '$priceTicketGoing\$',
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ticket price return for one person :',
                style: TextStyle(
                  color: AppColor.fifeColor,
                ),
              ),
              Text(
                '$priceTicketReturn\$',
                style: const TextStyle(fontSize: 18),
              )
            ],
          ),

          const SizedBox(height: 5),
          // TextDetailsPrice(
          //   details: 'Ticket price return for one person',
          //   price: priceTicketReturn,
          // ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Price Tickets :',
                  style: TextStyle(
                      color: AppColor.fifeColor,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline)),
              Text('$totalpriceTicket\$',
                  style: const TextStyle(fontSize: 19, color: Colors.red))
            ],
          ),
          // TextTotalPrice(nameTotal: 'Tickets', price: totalpriceTicket),
          // const SizedBox(height: 10),
          TextIconAndDetailsPrice(
            details:
                '(Ticket price going for one person +\n Ticket price return for one person) *\nnumber persone',
          )
        ]),
      ),
    );
  }
}
