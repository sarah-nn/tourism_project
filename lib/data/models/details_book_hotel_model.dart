// class DetailsBookHotelModel {
// final int id;
// final int destinationTripId;
// String tripName;
// final String price;
// final String startDate;
// String endDate;
// final int roomsCount;

//   DetailsBookHotelModel(
//       {required this.destinationTripId,
//       required this.id,
//       required this.tripName,
//       required this.price,
//       required this.startDate,
//       required this.endDate,
//       required this.roomsCount});

//   factory DetailsBookHotelModel.fromJson(Map<String, dynamic> json) {
//     return DetailsBookHotelModel(
//       id: json['id'],
//       destinationTripId: json['destination_trip_id'],
//       tripName: json['trip_name'],
//       price: json['price'],
//       startDate: json['start_date'],
//       endDate: json['end_date'],
//       roomsCount: json['rooms_count'],
//     );
//   }

// }

class DetailsBookHotelModel {
  DetailsBookHotelModel({required this.data});
  late final Data data;

  DetailsBookHotelModel.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.futureTripsHotel,
    required this.finishedTripsHotel,
  });
  late final List<FutureTripsHotel> futureTripsHotel;
  late final List<FinishedTripsHotel> finishedTripsHotel;

  Data.fromJson(Map<String, dynamic> json) {
    futureTripsHotel = List.from(json['future_trip'])
        .map((e) => FutureTripsHotel.fromJson(e))
        .toList();
    finishedTripsHotel = List.from(json['finished_trip'])
        .map((e) => FinishedTripsHotel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['future_trip'] = futureTripsHotel.map((e) => e.toJson()).toList();
    _data['finished_trip'] = finishedTripsHotel.map((e) => e.toJson()).toList();
    return _data;
  }
}

class FutureTripsHotel {
  FutureTripsHotel(
      {required this.id,
      required this.destinationTripId,
      required this.tripName,
      required this.price,
      required this.startDate,
      required this.endDate,
      required this.roomsCount});

  late final int id;
  late final int destinationTripId;
  late String tripName;
  late final String price;
  late final String startDate;
  late String endDate;
  late final int roomsCount;

  FutureTripsHotel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    destinationTripId = json['destination_trip_id'];
    tripName = json['trip_name'];
    price = json['price'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    roomsCount = json['rooms_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['destination_trip_id'] = destinationTripId;
    _data['trip_name'] = tripName;
    _data['price'] = price;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['rooms_count'] = roomsCount;

    return _data;
  }
}

class FinishedTripsHotel {
  FinishedTripsHotel(
      {required this.id,
      required this.destinationTripId,
      required this.tripName,
      required this.price,
      required this.startDate,
      required this.endDate,
      required this.roomsCount});

  late final int id;
  late final int destinationTripId;
  late String tripName;
  late final String price;
  late final String startDate;
  late String endDate;
  late final int roomsCount;

  FinishedTripsHotel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    destinationTripId = json['destination_trip_id'];
    tripName = json['trip_name'];
    price = json['price'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    roomsCount = json['rooms_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['destination_trip_id'] = destinationTripId;
    _data['trip_name'] = tripName;
    _data['price'] = price;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['rooms_count'] = roomsCount;

    return _data;
  }
}
