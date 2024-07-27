class ShowDetailsBookHotelModel {
  ShowDetailsBookHotelModel({
    required this.dynamicTrip,
    required this.sourceTrip,
    required this.destinationTrip,
    required this.hotel,
    required this.rooms,
  });

  final DynamicTrip? dynamicTrip;
  final dynamic sourceTrip;
  final DestinationTrip? destinationTrip;
  final DestinationTrip? hotel;
  final List<Room> rooms;

  factory ShowDetailsBookHotelModel.fromJson(Map<String, dynamic> json) {
    return ShowDetailsBookHotelModel(
      dynamicTrip: json["dynamic_trip"] == null
          ? null
          : DynamicTrip.fromJson(json["dynamic_trip"]),
      sourceTrip: json["source_trip"],
      destinationTrip: json["destination_trip"] == null
          ? null
          : DestinationTrip.fromJson(json["destination_trip"]),
      hotel: json["hotel"] == null
          ? null
          : DestinationTrip.fromJson(json["hotel"]),
      rooms: json["rooms"] == null
          ? []
          : List<Room>.from(json["rooms"]!.map((x) => Room.fromJson(x))),
    );
  }
}

class DestinationTrip {
  DestinationTrip({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  factory DestinationTrip.fromJson(Map<String, dynamic> json) {
    return DestinationTrip(
      id: json["id"],
      name: json["name"],
    );
  }
}

class DynamicTrip {
  DynamicTrip({
    required this.id,
    required this.sourceTripId,
    required this.destinationTripId,
    required this.tripName,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.tripNote,
    required this.roomsCount,
  });

  final int? id;
  final dynamic sourceTripId;
  final int? destinationTripId;
  final String? tripName;
  final String? price;
  final String? startDate;
  final String? endDate;
  final dynamic tripNote;
  final int? roomsCount;

  factory DynamicTrip.fromJson(Map<String, dynamic> json) {
    return DynamicTrip(
      id: json["id"],
      sourceTripId: json["source_trip_id"],
      destinationTripId: json["destination_trip_id"],
      tripName: json["trip_name"],
      price: json["price"],
      startDate: json["start_date"],
      endDate: json["end_date"],
      tripNote: json["trip_note"],
      roomsCount: json["rooms_count"],
    );
  }
}

class Room {
  Room({
    required this.id,
    required this.capacity,
    required this.price,
  });

  final int? id;
  final int? capacity;
  final String? price;

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json["id"],
      capacity: json["capacity"],
      price: json["price"],
    );
  }
}
