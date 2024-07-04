// class GoingPlaneTrip {
//   List<Data>? data;

//   GoingPlaneTrip({this.data});

//   GoingPlaneTrip.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Data {
//   int? id;
//   int? planeId;
//   int? airportSourceId;
//   int? airportDestinationId;
//   int? countrySourceId;
//   int? countryDestinationId;
//   String? currentPrice;
//   int? availableSeats;
//   String? flightDate;
//   String? landingDate;
//   Plane? plane;
//   CountrySource? countrySource;
//   CountrySource? countryDestination;
//   CountrySource? airportSource;
//   CountrySource? airportDestination;

//   Data(
//       {this.id,
//       this.planeId,
//       this.airportSourceId,
//       this.airportDestinationId,
//       this.countrySourceId,
//       this.countryDestinationId,
//       this.currentPrice,
//       this.availableSeats,
//       this.flightDate,
//       this.landingDate,
//       this.plane,
//       this.countrySource,
//       this.countryDestination,
//       this.airportSource,
//       this.airportDestination});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     planeId = json['plane_id'];
//     airportSourceId = json['airport_source_id'];
//     airportDestinationId = json['airport_destination_id'];
//     countrySourceId = json['country_source_id'];
//     countryDestinationId = json['country_destination_id'];
//     currentPrice = json['current_price'];
//     availableSeats = json['available_seats'];
//     flightDate = json['flight_date'];
//     landingDate = json['landing_date'];
//     plane = json['plane'] != null ? new Plane.fromJson(json['plane']) : null;
//     countrySource = json['country_source'] != null
//         ? new CountrySource.fromJson(json['country_source'])
//         : null;
//     countryDestination = json['country_destination'] != null
//         ? new CountrySource.fromJson(json['country_destination'])
//         : null;
//     airportSource = json['airport_source'] != null
//         ? new CountrySource.fromJson(json['airport_source'])
//         : null;
//     airportDestination = json['airport_destination'] != null
//         ? new CountrySource.fromJson(json['airport_destination'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['plane_id'] = this.planeId;
//     data['airport_source_id'] = this.airportSourceId;
//     data['airport_destination_id'] = this.airportDestinationId;
//     data['country_source_id'] = this.countrySourceId;
//     data['country_destination_id'] = this.countryDestinationId;
//     data['current_price'] = this.currentPrice;
//     data['available_seats'] = this.availableSeats;
//     data['flight_date'] = this.flightDate;
//     data['landing_date'] = this.landingDate;
//     if (this.plane != null) {
//       data['plane'] = this.plane!.toJson();
//     }
//     if (this.countrySource != null) {
//       data['country_source'] = this.countrySource!.toJson();
//     }
//     if (this.countryDestination != null) {
//       data['country_destination'] = this.countryDestination!.toJson();
//     }
//     if (this.airportSource != null) {
//       data['airport_source'] = this.airportSource!.toJson();
//     }
//     if (this.airportDestination != null) {
//       data['airport_destination'] = this.airportDestination!.toJson();
//     }
//     return data;
//   }
// }

// class Plane {
//   Plane({
//     required this.id,
//     required this.name,
//     required this.images,
//   });
//   late final int id;
//   late final String name;
//   late final List<dynamic> images;

//   Plane.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     images = List.castFrom<dynamic, dynamic>(json['images']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['images'] = images;
//     return _data;
//   }
// }

// class CountrySource {
//   int? id;
//   String? name;

//   CountrySource({this.id, this.name});

//   CountrySource.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }

// class GoingPlaneTrip {
//   GoingPlaneTrip({
//     required this.data,
//   });

//   final List<Datum> data;

//   factory GoingPlaneTrip.fromJson(Map<String, dynamic> json) {
//     return GoingPlaneTrip(
//       data: json["data"] == null
//           ? []
//           : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
//     );
//   }
// }

// class Datum {
//   Datum({
//     required this.id,
//     required this.planeId,
//     required this.airportSourceId,
//     required this.airportDestinationId,
//     required this.countrySourceId,
//     required this.countryDestinationId,
//     required this.currentPrice,
//     required this.availableSeats,
//     required this.flightDate,
//     required this.landingDate,
//     required this.plane,
//     required this.countrySource,
//     required this.countryDestination,
//     required this.airportSource,
//     required this.airportDestination,
//   });

//   final int? id;
//   final int? planeId;
//   final int? airportSourceId;
//   final int? airportDestinationId;
//   final int? countrySourceId;
//   final int? countryDestinationId;
//   final String? currentPrice;
//   final int? availableSeats;
//   final DateTime? flightDate;
//   final DateTime? landingDate;
//   final Plane? plane;
//   final AirportDestination? countrySource;
//   final AirportDestination? countryDestination;
//   final AirportDestination? airportSource;
//   final AirportDestination? airportDestination;

//   factory Datum.fromJson(Map<String, dynamic> json) {
//     return Datum(
//       id: json["id"],
//       planeId: json["plane_id"],
//       airportSourceId: json["airport_source_id"],
//       airportDestinationId: json["airport_destination_id"],
//       countrySourceId: json["country_source_id"],
//       countryDestinationId: json["country_destination_id"],
//       currentPrice: json["current_price"],
//       availableSeats: json["available_seats"],
//       flightDate: DateTime.tryParse(json["flight_date"] ?? ""),
//       landingDate: DateTime.tryParse(json["landing_date"] ?? ""),
//       plane: json["plane"] == null ? null : Plane.fromJson(json["plane"]),
//       countrySource: json["country_source"] == null
//           ? null
//           : AirportDestination.fromJson(json["country_source"]),
//       countryDestination: json["country_destination"] == null
//           ? null
//           : AirportDestination.fromJson(json["country_destination"]),
//       airportSource: json["airport_source"] == null
//           ? null
//           : AirportDestination.fromJson(json["airport_source"]),
//       airportDestination: json["airport_destination"] == null
//           ? null
//           : AirportDestination.fromJson(json["airport_destination"]),
//     );
//   }
// }

// class AirportDestination {
//   AirportDestination({
//     required this.id,
//     required this.name,
//   });

//   final int? id;
//   final String? name;

//   factory AirportDestination.fromJson(Map<String, dynamic> json) {
//     return AirportDestination(
//       id: json["id"],
//       name: json["name"],
//     );
//   }
// }

// class Plane {
//   Plane({
//     required this.id,
//     required this.name,
//     required this.images,
//   });

//   final int? id;
//   final String? name;
//   final List<dynamic> images;

//   factory Plane.fromJson(Map<String, dynamic> json) {
//     return Plane(
//       id: json["id"],
//       name: json["name"],
//       images: json["images"] == null
//           ? []
//           : List<dynamic>.from(json["images"]!.map((x) => x)),
//     );
//   }
// }

class GoingPlaneTrip {
  final int id;
  final int planeId;
  final int airportSourceId;
  final int airportDestinationId;
  final int countrySourceId;
  final int countryDestinationId;
  final String currentPrice;
  final int availableSeats;
  final String flightDate;
  final String landingDate;
  final Plane plane;
  final CountrySource countrySource;
  final CountryDestination countryDestination;
  final AirportSource airportSource;
  final AirportDestination airportDestination;

  GoingPlaneTrip({
    required this.id,
    required this.planeId,
    required this.airportSourceId,
    required this.airportDestinationId,
    required this.countrySourceId,
    required this.countryDestinationId,
    required this.currentPrice,
    required this.availableSeats,
    required this.flightDate,
    required this.landingDate,
    required this.plane,
    required this.countrySource,
    required this.countryDestination,
    required this.airportSource,
    required this.airportDestination,
  });

  factory GoingPlaneTrip.fromJson(Map<String, dynamic> json) {
    final plane = Plane.fromJson(json['plane']);
    final countrySource = CountrySource.fromJson(json['country_source']);
    final countryDestination =
        CountryDestination.fromJson(json['country_destination']);
    final airportSource = AirportSource.fromJson(json['airport_source']);
    final airportDestination =
        AirportDestination.fromJson(json['airport_destination']);

    return GoingPlaneTrip(
        id: json["id"],
        planeId: json["plane_id"],
        airportSourceId: json["airport_source_id"],
        airportDestinationId: json["airport_destination_id"],
        countrySourceId: json["country_source_id"],
        countryDestinationId: json["country_destination_id"],
        currentPrice: json["current_price"],
        availableSeats: json["available_seats"],
        flightDate: json['flight_date'],
        landingDate: json['landing_date'],
        plane: plane,
        countrySource: countrySource,
        countryDestination: countryDestination,
        airportSource: airportSource,
        airportDestination: airportDestination);
  }
}

class Plane {
  Plane({
    required this.id,
    required this.name,
    required this.images,
  });

  final int id;
  final String name;
  final List<String> images;

  factory Plane.fromJson(Map<String, dynamic> json) {
    return Plane(
      id: json["id"],
      name: json["name"],
      images: (json['images'] as List<dynamic>).cast<String>(),
    );
  }
}

class CountrySource {
  CountrySource({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory CountrySource.fromJson(Map<String, dynamic> json) {
    return CountrySource(
      id: json["id"],
      name: json["name"],
    );
  }
}

class CountryDestination {
  CountryDestination({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory CountryDestination.fromJson(Map<String, dynamic> json) {
    return CountryDestination(
      id: json["id"],
      name: json["name"],
    );
  }
}

class AirportSource {
  AirportSource({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  factory AirportSource.fromJson(Map<String, dynamic> json) {
    return AirportSource(
      id: json["id"],
      name: json["name"],
    );
  }
}

class AirportDestination {
  AirportDestination({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  factory AirportDestination.fromJson(Map<String, dynamic> json) {
    return AirportDestination(
      id: json["id"],
      name: json["name"],
    );
  }
}




// class HotelModel {
//   final int id;
//   final String name;
//   final String stars;
//   final int number_rooms;
//   final List<String> images;
//   final Area area;

//   HotelModel(
//       {required this.name,
//       required this.id,
//       required this.images,
//       required this.number_rooms,
//       required this.stars,
//       required this.area});

//   factory HotelModel.fromJson(Map<String, dynamic> json) {
//     final area = Area.fromJson(json['area']);
//     return HotelModel(
//       id: json['id'],
//       name: json['name'],
//       stars: json['stars'],
//       number_rooms: json['number_rooms'],
//       images: (json['images'] as List<dynamic>).cast<String>(),
//       area: area,
//     );
//   }
// }

// class Area {
//   final int id;
//   final String name;
//   final int country_id;

//   Area({required this.id, required this.name, required this.country_id});

//   factory Area.fromJson(Map<String, dynamic> json) {
//     return Area(
//       id: json['id'],
//       name: json['name'],
//       country_id: json['country_id'],
//     );
//   }
// }
