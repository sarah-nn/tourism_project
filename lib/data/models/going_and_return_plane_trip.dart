class GoingAndReturnPlaneTrip {
  GoingAndReturnPlaneTrip({
    required this.data,
  });
  late final Data data;

  GoingAndReturnPlaneTrip.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);

//data = (json['data'] != null ? new Data.fromJson(json['data']) : null)!;
  }
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.goingTrip,
    required this.returnTrip,
  });
  late final List<GoingTrip> goingTrip;
  late final List<ReturnTrip> returnTrip;

  Data.fromJson(Map<String, dynamic> json) {
    goingTrip = List.from(json['going_trip'])
        .map((e) => GoingTrip.fromJson(e))
        .toList();
    returnTrip = List.from(json['return_trip'])
        .map((e) => ReturnTrip.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['going_trip'] = goingTrip.map((e) => e.toJson()).toList();
    _data['return_trip'] = returnTrip.map((e) => e.toJson()).toList();
    return _data;
  }
}

class GoingTrip {
  GoingTrip(
      {required this.id,
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
      required this.flight_duration});
  late final int id;
  late final int planeId;
  late final int airportSourceId;
  late final int airportDestinationId;
  late final int countrySourceId;
  late final int countryDestinationId;
  late final String currentPrice;
  late final int availableSeats;
  late final String flightDate;
  late final String landingDate;
  late final String flight_duration;
  late final Plane plane;
  late final CountrySource countrySource;
  late final CountryDestination countryDestination;
  late final AirportSource airportSource;
  late final AirportDestination airportDestination;

  GoingTrip.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planeId = json['plane_id'];
    airportSourceId = json['airport_source_id'];
    airportDestinationId = json['airport_destination_id'];
    countrySourceId = json['country_source_id'];
    countryDestinationId = json['country_destination_id'];
    currentPrice = json['current_price'];
    availableSeats = json['available_seats'];
    flightDate = json['flight_date'];
    landingDate = json['landing_date'];
    flight_duration = json['flight_duration'];
    plane = Plane.fromJson(json['plane']);
    countrySource = CountrySource.fromJson(json['country_source']);
    countryDestination =
        CountryDestination.fromJson(json['country_destination']);
    airportSource = AirportSource.fromJson(json['airport_source']);
    airportDestination =
        AirportDestination.fromJson(json['airport_destination']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['plane_id'] = planeId;
    _data['airport_source_id'] = airportSourceId;
    _data['airport_destination_id'] = airportDestinationId;
    _data['country_source_id'] = countrySourceId;
    _data['country_destination_id'] = countryDestinationId;
    _data['current_price'] = currentPrice;
    _data['available_seats'] = availableSeats;
    _data['flight_date'] = flightDate;
    _data['landing_date'] = landingDate;
    _data['flight_duration'] = flight_duration;
    _data['plane'] = plane.toJson();
    _data['country_source'] = countrySource.toJson();
    _data['country_destination'] = countryDestination.toJson();
    _data['airport_source'] = airportSource.toJson();
    _data['airport_destination'] = airportDestination.toJson();
    return _data;
  }
}

class Plane {
  Plane({
    required this.id,
    required this.name,
    required this.images,
  });
  late final int id;
  late final String name;
  late final List<dynamic> images;

  Plane.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    images = List.castFrom<dynamic, dynamic>(json['images']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['images'] = images;
    return _data;
  }
}

class CountrySource {
  CountrySource({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  CountrySource.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class CountryDestination {
  CountryDestination({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  CountryDestination.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class AirportSource {
  AirportSource({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  AirportSource.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class AirportDestination {
  AirportDestination({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  AirportDestination.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class ReturnTrip {
  ReturnTrip(
      {required this.id,
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
      required this.flight_duration});
  late final int id;
  late final int planeId;
  late final int airportSourceId;
  late final int airportDestinationId;
  late final int countrySourceId;
  late final int countryDestinationId;
  late final String currentPrice;
  late final int availableSeats;
  late final String flightDate;
  late final String landingDate;
  late final String flight_duration;
  late final Plane plane;
  late final CountrySource countrySource;
  late final CountryDestination countryDestination;
  late final AirportSource airportSource;
  late final AirportDestination airportDestination;

  ReturnTrip.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planeId = json['plane_id'];
    airportSourceId = json['airport_source_id'];
    airportDestinationId = json['airport_destination_id'];
    countrySourceId = json['country_source_id'];
    countryDestinationId = json['country_destination_id'];
    currentPrice = json['current_price'];
    availableSeats = json['available_seats'];
    flightDate = json['flight_date'];
    landingDate = json['landing_date'];
    flight_duration = json['flight_duration'];
    plane = Plane.fromJson(json['plane']);
    countrySource = CountrySource.fromJson(json['country_source']);
    countryDestination =
        CountryDestination.fromJson(json['country_destination']);
    airportSource = AirportSource.fromJson(json['airport_source']);
    airportDestination =
        AirportDestination.fromJson(json['airport_destination']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['plane_id'] = planeId;
    _data['airport_source_id'] = airportSourceId;
    _data['airport_destination_id'] = airportDestinationId;
    _data['country_source_id'] = countrySourceId;
    _data['country_destination_id'] = countryDestinationId;
    _data['current_price'] = currentPrice;
    _data['available_seats'] = availableSeats;
    _data['flight_date'] = flightDate;
    _data['landing_date'] = landingDate;
    _data['flight_duration'] = flight_duration;
    _data['plane'] = plane.toJson();
    _data['country_source'] = countrySource.toJson();
    _data['country_destination'] = countryDestination.toJson();
    _data['airport_source'] = airportSource.toJson();
    _data['airport_destination'] = airportDestination.toJson();
    return _data;
  }
}
