class DetailsBookHotelModel {
  final int id;
  final int destinationTripId;
  String tripName;
  final String price;
  final String startDate;
  String endDate;
  final int roomsCount;

  DetailsBookHotelModel(
      {required this.destinationTripId,
      required this.id,
      required this.tripName,
      required this.price,
      required this.startDate,
      required this.endDate,
      required this.roomsCount});

  factory DetailsBookHotelModel.fromJson(Map<String, dynamic> json) {
    return DetailsBookHotelModel(
      id: json['id'],
      destinationTripId: json['destination_trip_id'],
      tripName: json['trip_name'],
      price: json['price'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      roomsCount: json['rooms_count'],
    );
  }
  // DetailsBookHotelModel copyWith({
  //   String? tripName,
  //   String? startDate,
  //   String? endDate,
  // }) {
  //   return DetailsBookHotelModel(
  //     tripName: tripName ?? this.tripName,
  //     startDate: startDate ?? this.startDate,
  //     endDate: endDate ?? this.endDate,
  //     destinationTripId: destinationTripId ?? this.destinationTripId,
  //     id: id ?? this.id,
  //     price: '',
  //     roomsCount: roomsCount ?? this.roomsCount,
  //   );
  // }
}
