class ShowDetailsPriceStatic {
  final int tripId;
  final int numberOfFriend;
  final int roomsNeeded;
  final int days;
  final double roomPrice;
  final String ticketPriceForGoingTrip;
  final String ticketPriceForReturnTrip;
  final double totalPrice;
  final double? priceAfterDiscount;
  final double ticketPriceForPlaces;
  ShowDetailsPriceStatic(
      {required this.tripId,
      required this.numberOfFriend,
      required this.roomsNeeded,
      required this.days,
      required this.roomPrice,
      required this.ticketPriceForGoingTrip,
      required this.ticketPriceForReturnTrip,
      required this.totalPrice,
      this.priceAfterDiscount,
      required this.ticketPriceForPlaces});
  factory ShowDetailsPriceStatic.fromJson(Map<String, dynamic> json) {
    return ShowDetailsPriceStatic(
      tripId: json['trip_id'],
      numberOfFriend: json['number_of_friend'],
      roomsNeeded: json['rooms_needed'],
      days: json['days'],
      roomPrice: json['room_price'].toDouble(),
      ticketPriceForGoingTrip: json['ticket_price_for_going_trip'],
      ticketPriceForReturnTrip: json['ticket_price_for_return_trip'],
      totalPrice: json['total_price'].toDouble(),
      ticketPriceForPlaces: json['ticket_price_for_places'].toDouble(),
      priceAfterDiscount: json['price_after_discount'] != null
          ? json['price_after_discount'].toDouble()
          : null,
    );
  }
}
