// class DetailsBookPlaneModel {
//   final int id;
//   final int sourceTripId;
//   final int destinationTripId;
//   String tripName;
//   final String price;
//   int numberOfPeople;
//   final String startDate;
//   final String endDate;
//   final String tripNote;

//   DetailsBookPlaneModel(
//       {
//         required this.id,
//       required this.sourceTripId,
//       required this.destinationTripId,
//       required this.tripName,
//       required this.price,
//       required this.numberOfPeople,
//       required this.startDate,
//       required this.endDate,
//       required this.tripNote
//       });

//   factory DetailsBookPlaneModel.fromJson(Map<String, dynamic> json) {
//     return DetailsBookPlaneModel(
//       id: json['id'],
//       sourceTripId: json['source_trip_id'],
//       destinationTripId: json['destination_trip_id'],
//       tripName: json['trip_name'],
//       price: json['price'],
//       numberOfPeople: json['number_of_people'],
//       startDate: json['start_date'],
//       endDate: json['end_date'],
//       tripNote: json['trip_note'],
//     );
//   }
// }

class DetailsBookPlaneModel {
  DetailsBookPlaneModel({required this.data});
  late final Data data;

  DetailsBookPlaneModel.fromJson(Map<String, dynamic> json) {
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
    required this.futureTripsPlane,
    required this.finishedTripsPlane,
  });
  late final List<FutureTripsPlane> futureTripsPlane;
  late final List<FinishedTripsPlane> finishedTripsPlane;

  Data.fromJson(Map<String, dynamic> json) {
    futureTripsPlane = List.from(json['future_trip'])
        .map((e) => FutureTripsPlane.fromJson(e))
        .toList();
    finishedTripsPlane = List.from(json['finished_trip'])
        .map((e) => FinishedTripsPlane.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['future_trip'] = futureTripsPlane.map((e) => e.toJson()).toList();
    _data['finished_trip'] = finishedTripsPlane.map((e) => e.toJson()).toList();
    return _data;
  }
}

class FutureTripsPlane {
  FutureTripsPlane(
      {required this.id,
      required this.sourceTripId,
      required this.destinationTripId,
      required this.tripName,
      required this.price,
      required this.numberOfPeople,
      required this.startDate,
      required this.endDate,
      required this.tripNote});

  late final int id;
  late final int sourceTripId;
  late final int destinationTripId;
  late String tripName;
  late final String price;
  late int numberOfPeople;
  late final String startDate;
  late final String endDate;
  late final String tripNote;

  FutureTripsPlane.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    destinationTripId = json['destination_trip_id'];
    sourceTripId = json['source_trip_id'];
    tripName = json['trip_name'];
    price = json['price'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    tripNote = json['trip_note'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['destination_trip_id'] = destinationTripId;
    _data['source_trip_id'] = sourceTripId;

    _data['trip_name'] = tripName;
    _data['price'] = price;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['trip_note'] = tripNote;

    return _data;
  }
}

class FinishedTripsPlane {
  FinishedTripsPlane(
      {required this.id,
      required this.sourceTripId,
      required this.destinationTripId,
      required this.tripName,
      required this.price,
      required this.numberOfPeople,
      required this.startDate,
      required this.endDate,
      required this.tripNote});

  late final int id;
  late final int sourceTripId;
  late final int destinationTripId;
  late String tripName;
  late final String price;
  late int numberOfPeople;
  late final String startDate;
  late final String endDate;
  late final String tripNote;

  FinishedTripsPlane.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    destinationTripId = json['destination_trip_id'];
    sourceTripId = json['source_trip_id'];
    tripName = json['trip_name'];
    price = json['price'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    tripNote = json['trip_note'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['destination_trip_id'] = destinationTripId;
    _data['source_trip_id'] = sourceTripId;

    _data['trip_name'] = tripName;
    _data['price'] = price;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['trip_note'] = tripNote;

    return _data;
  }
}
