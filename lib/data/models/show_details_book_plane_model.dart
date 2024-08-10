class ShowDetailsBookPlaneModel {
  final DynamicTrip dynamicTrip;
  final SourceTrip sourceTrip;
  final DestinationTrip destinationTrip;
  final GoingTrip goingTrip;
  ShowDetailsBookPlaneModel(
      {required this.destinationTrip,
      required this.dynamicTrip,
      required this.goingTrip,
      required this.sourceTrip});

  factory ShowDetailsBookPlaneModel.fromJson(Map<String, dynamic> json) {
    final dynamicTrip = DynamicTrip.fromJson(json['dynamic_trip']);
    final sourceTrip = SourceTrip.fromJson(json['source_trip']);
    final destinationTrip = DestinationTrip.fromJson(json['destination_trip']);

    final goingTrip = GoingTrip.fromJson(json['going_trip']);

    return ShowDetailsBookPlaneModel(
      dynamicTrip: dynamicTrip,
      sourceTrip: sourceTrip,
      destinationTrip: destinationTrip,
      goingTrip: goingTrip,
    );
  }
}

class DynamicTrip {
  final int id;
  final int sourceTripId;
  final int destinationTripId;
  final String tripName;
  final String price;
  final int numberOfPeople;
  final String startDate;
  final String endDate;
  final String tripNote;

  DynamicTrip(
      {required this.id,
      required this.sourceTripId,
      required this.destinationTripId,
      required this.tripName,
      required this.price,
      required this.numberOfPeople,
      required this.startDate,
      required this.endDate,
      required this.tripNote});

  factory DynamicTrip.fromJson(Map<String, dynamic> json) {
    return DynamicTrip(
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

class SourceTrip {
  final int id;
  final String name;

  SourceTrip({required this.id, required this.name});

  factory SourceTrip.fromJson(Map<String, dynamic> json) {
    return SourceTrip(id: json['id'], name: json['name']);
  }
}

class DestinationTrip {
  final int id;
  final String name;

  DestinationTrip({required this.id, required this.name});

  factory DestinationTrip.fromJson(Map<String, dynamic> json) {
    return DestinationTrip(id: json['id'], name: json['name']);
  }
}

class GoingTrip {
  final AirportSource airportSource;
  final AirportDestination airportDestination;

  GoingTrip({required this.airportDestination, required this.airportSource});

  factory GoingTrip.fromJson(Map<String, dynamic> json) {
    final airportSource = AirportSource.fromJson(json['airport_source']);
    final airportDestination =
        AirportDestination.fromJson(json['airport_destination']);

    return GoingTrip(
      airportSource: airportSource,
      airportDestination: airportDestination,
    );
  }
}

class AirportSource {
  final int id;
  final String name;

  AirportSource({required this.id, required this.name});

  factory AirportSource.fromJson(Map<String, dynamic> json) {
    return AirportSource(id: json['id'], name: json['name']);
  }
}

class AirportDestination {
  final int id;
  final String name;

  AirportDestination({required this.id, required this.name});

  factory AirportDestination.fromJson(Map<String, dynamic> json) {
    return AirportDestination(id: json['id'], name: json['name']);
  }
}











// {
//     "dynamic_trip": {
//         "id": 6,
//         "source_trip_id": 1,
//         "destination_trip_id": 2,
//         "trip_name": "hi",
//         "price": "400.00",
//         "number_of_people": 2,
//         "start_date": "2024-05-30",
//         "end_date": "2024-06-01",
//         "trip_note": "without"
//     },
//     "source_trip": {
//         "id": 1,
//         "name": "Syria"
//     },
//     "destination_trip": {
//         "id": 2,
//         "name": "France"
//     },
//     "going_trip": {
//         "airport_source": {
//             "id": 1,
//             "name": "Syria A"
//         },
//         "airport_destination": {
//             "id": 2,
//             "name": "France A"
//         }
//     },
//     "return_trip": []
// }