class DetailsBookPlaneModel {
  final int id;
  final int sourceTripId;
  final int destinationTripId;
  String tripName;
  final String price;
  int numberOfPeople;
  final String startDate;
  final String endDate;
  final String tripNote;

  DetailsBookPlaneModel(
      {required this.id,
      required this.sourceTripId,
      required this.destinationTripId,
      required this.tripName,
      required this.price,
      required this.numberOfPeople,
      required this.startDate,
      required this.endDate,
      required this.tripNote});

  factory DetailsBookPlaneModel.fromJson(Map<String, dynamic> json) {
    return DetailsBookPlaneModel(
      id: json['id'],
      sourceTripId: json['source_trip_id'],
      destinationTripId: json['destination_trip_id'],
      tripName: json['trip_name'],
      price: json['price'],
      numberOfPeople: json['number_of_people'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      tripNote: json['trip_note'],
    );
  }
}
