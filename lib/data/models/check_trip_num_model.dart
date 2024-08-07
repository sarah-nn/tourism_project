class CheckNum {
  final int tripId;
  final int numberOfFriend;
  final int roomsNeeded;
  final int days;
  final double roomPrice;
  final double ticketPriceForGoingTrip;
  final double ticketPriceForReturnTrip;
  final double totalPrice;
  final double? priceAfterDiscount;
  final double ticket_price_for_places;

  CheckNum(
      {required this.tripId,
      required this.numberOfFriend,
      required this.roomsNeeded,
      required this.days,
      required this.roomPrice,
      required this.ticketPriceForGoingTrip,
      required this.ticketPriceForReturnTrip,
      required this.totalPrice,
      this.priceAfterDiscount,
      required this.ticket_price_for_places});

  factory CheckNum.fromJson(Map<String, dynamic> json) {
    return CheckNum(
      tripId: json['trip_id'],
      numberOfFriend: json['number_of_friend'],
      roomsNeeded: json['rooms_needed'],
      days: json['days'],
      roomPrice: json['room_price'].toDouble(),
      ticketPriceForGoingTrip: json['ticket_price_for_going_trip'].toDouble(),
      ticketPriceForReturnTrip: json['ticket_price_for_return_trip'].toDouble(),
      totalPrice: json['total_price'].toDouble(),
      ticket_price_for_places: json['ticket_price_for_places'].toDouble(),
      priceAfterDiscount: json['price_after_discount'] != null
          ? json['price_after_discount'].toDouble()
          : null,
    );
  }
}
