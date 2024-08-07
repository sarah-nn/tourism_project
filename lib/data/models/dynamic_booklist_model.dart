class DynamicListBookingModel {
  final int id;
  final int userId;
  final int sourceTripId;
  final int destinationTripId;
  final String tripName;
  final String price;
  final String? newPrice;
  final int numberOfPeople;
  final int? tripCapacity;
  final String startDate;
  final String endDate;
  final String stars;
  final String? tripNote;
  final String type;
  final String createdAt;
  final String updatedAt;
  final int roomsCount;

  DynamicListBookingModel({
    required this.id,
    required this.userId,
    required this.sourceTripId,
    required this.destinationTripId,
    required this.tripName,
    required this.price,
    this.newPrice,
    required this.numberOfPeople,
    this.tripCapacity,
    required this.startDate,
    required this.endDate,
    required this.stars,
    this.tripNote,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
    required this.roomsCount,
  });

  factory DynamicListBookingModel.fromJson(Map<String, dynamic> json) {
    return DynamicListBookingModel(
      id: json['id'],
      userId: json['user_id'],
      sourceTripId: json['source_trip_id'],
      destinationTripId: json['destination_trip_id'],
      tripName: json['trip_name'],
      price: json['price'],
      newPrice: json['new_price'],
      numberOfPeople: json['number_of_people'],
      tripCapacity: json['trip_capacity'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      stars: json['stars'],
      tripNote: json['trip_note'],
      type: json['type'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      roomsCount: json['rooms_count'],
    );
  }
}
