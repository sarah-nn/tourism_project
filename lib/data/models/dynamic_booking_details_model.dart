class Data {
  final int id;
  final int sourceTripId;
  final int destinationTripId;
  final String tripName;
  final String price;
  final int numberOfPeople;
  final String startDate;
  final String endDate;
  final int roomsCount;

  Data({
    required this.id,
    required this.sourceTripId,
    required this.destinationTripId,
    required this.tripName,
    required this.price,
    required this.numberOfPeople,
    required this.startDate,
    required this.endDate,
    required this.roomsCount,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      sourceTripId: json['source_trip_id'],
      destinationTripId: json['destination_trip_id'],
      tripName: json['trip_name'],
      price: json['price'],
      numberOfPeople: json['number_of_people'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      roomsCount: json['rooms_count'],
    );
  }
}
