class Dynamicflight {
  Data? data;

  Dynamicflight({this.data});

  Dynamicflight.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  List<GoingTripDynamic>? goingTrip;
  List<ReturnTripDynamic>? returnTrip;

  Data({this.goingTrip, this.returnTrip});

  Data.fromJson(Map<String, dynamic> json) {
    goingTrip = json["going_trip"] == null
        ? null
        : (json["going_trip"] as List)
            .map((e) => GoingTripDynamic.fromJson(e))
            .toList();
    returnTrip = json["return_trip"] == null
        ? null
        : (json["return_trip"] as List)
            .map((e) => ReturnTripDynamic.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (goingTrip != null) {
      _data["going_trip"] = goingTrip?.map((e) => e.toJson()).toList();
    }
    if (returnTrip != null) {
      _data["return_trip"] = returnTrip?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class ReturnTripDynamic {
  int? id;
  int? planeId;
  int? airportSourceId;
  int? airportDestinationId;
  int? countrySourceId;
  int? countryDestinationId;
  String? currentPrice;
  int? availableSeats;
  String? flightDuration;
  String? flightDate;
  String? landingDate;
  Plane1? plane;
  CountrySource1? countrySource;
  CountryDestination1? countryDestination;
  AirportSource1? airportSource;
  AirportDestination1? airportDestination;

  ReturnTripDynamic(
      {this.id,
      this.planeId,
      this.airportSourceId,
      this.airportDestinationId,
      this.countrySourceId,
      this.countryDestinationId,
      this.currentPrice,
      this.availableSeats,
      this.flightDuration,
      this.flightDate,
      this.landingDate,
      this.plane,
      this.countrySource,
      this.countryDestination,
      this.airportSource,
      this.airportDestination});

  ReturnTripDynamic.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    planeId = json["plane_id"];
    airportSourceId = json["airport_source_id"];
    airportDestinationId = json["airport_destination_id"];
    countrySourceId = json["country_source_id"];
    countryDestinationId = json["country_destination_id"];
    currentPrice = json["current_price"];
    availableSeats = json["available_seats"];
    flightDuration = json["flight_duration"];
    flightDate = json["flight_date"];
    landingDate = json["landing_date"];
    plane = json["plane"] == null ? null : Plane1.fromJson(json["plane"]);
    countrySource = json["country_source"] == null
        ? null
        : CountrySource1.fromJson(json["country_source"]);
    countryDestination = json["country_destination"] == null
        ? null
        : CountryDestination1.fromJson(json["country_destination"]);
    airportSource = json["airport_source"] == null
        ? null
        : AirportSource1.fromJson(json["airport_source"]);
    airportDestination = json["airport_destination"] == null
        ? null
        : AirportDestination1.fromJson(json["airport_destination"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["plane_id"] = planeId;
    _data["airport_source_id"] = airportSourceId;
    _data["airport_destination_id"] = airportDestinationId;
    _data["country_source_id"] = countrySourceId;
    _data["country_destination_id"] = countryDestinationId;
    _data["current_price"] = currentPrice;
    _data["available_seats"] = availableSeats;
    _data["flight_duration"] = flightDuration;
    _data["flight_date"] = flightDate;
    _data["landing_date"] = landingDate;
    if (plane != null) {
      _data["plane"] = plane?.toJson();
    }
    if (countrySource != null) {
      _data["country_source"] = countrySource?.toJson();
    }
    if (countryDestination != null) {
      _data["country_destination"] = countryDestination?.toJson();
    }
    if (airportSource != null) {
      _data["airport_source"] = airportSource?.toJson();
    }
    if (airportDestination != null) {
      _data["airport_destination"] = airportDestination?.toJson();
    }
    return _data;
  }
}

class AirportDestination1 {
  int? id;
  String? name;

  AirportDestination1({this.id, this.name});

  AirportDestination1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }
}

class AirportSource1 {
  int? id;
  String? name;

  AirportSource1({this.id, this.name});

  AirportSource1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }
}

class CountryDestination1 {
  int? id;
  String? name;

  CountryDestination1({this.id, this.name});

  CountryDestination1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }
}

class CountrySource1 {
  int? id;
  String? name;

  CountrySource1({this.id, this.name});

  CountrySource1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }
}

class Plane1 {
  int? id;
  String? name;
  List<dynamic>? images;

  Plane1({this.id, this.name, this.images});

  Plane1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    images = json["images"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    if (images != null) {
      _data["images"] = images;
    }
    return _data;
  }
}

class GoingTripDynamic {
  int? id;
  int? planeId;
  int? airportSourceId;
  int? airportDestinationId;
  int? countrySourceId;
  int? countryDestinationId;
  String? currentPrice;
  int? availableSeats;
  String? flightDuration;
  String? flightDate;
  String? landingDate;
  Plane? plane;
  CountrySource? countrySource;
  CountryDestination? countryDestination;
  AirportSource? airportSource;
  AirportDestination? airportDestination;

  GoingTripDynamic(
      {this.id,
      this.planeId,
      this.airportSourceId,
      this.airportDestinationId,
      this.countrySourceId,
      this.countryDestinationId,
      this.currentPrice,
      this.availableSeats,
      this.flightDuration,
      this.flightDate,
      this.landingDate,
      this.plane,
      this.countrySource,
      this.countryDestination,
      this.airportSource,
      this.airportDestination});

  GoingTripDynamic.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    planeId = json["plane_id"];
    airportSourceId = json["airport_source_id"];
    airportDestinationId = json["airport_destination_id"];
    countrySourceId = json["country_source_id"];
    countryDestinationId = json["country_destination_id"];
    currentPrice = json["current_price"];
    availableSeats = json["available_seats"];
    flightDuration = json["flight_duration"];
    flightDate = json["flight_date"];
    landingDate = json["landing_date"];
    plane = json["plane"] == null ? null : Plane.fromJson(json["plane"]);
    countrySource = json["country_source"] == null
        ? null
        : CountrySource.fromJson(json["country_source"]);
    countryDestination = json["country_destination"] == null
        ? null
        : CountryDestination.fromJson(json["country_destination"]);
    airportSource = json["airport_source"] == null
        ? null
        : AirportSource.fromJson(json["airport_source"]);
    airportDestination = json["airport_destination"] == null
        ? null
        : AirportDestination.fromJson(json["airport_destination"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["plane_id"] = planeId;
    _data["airport_source_id"] = airportSourceId;
    _data["airport_destination_id"] = airportDestinationId;
    _data["country_source_id"] = countrySourceId;
    _data["country_destination_id"] = countryDestinationId;
    _data["current_price"] = currentPrice;
    _data["available_seats"] = availableSeats;
    _data["flight_duration"] = flightDuration;
    _data["flight_date"] = flightDate;
    _data["landing_date"] = landingDate;
    if (plane != null) {
      _data["plane"] = plane?.toJson();
    }
    if (countrySource != null) {
      _data["country_source"] = countrySource?.toJson();
    }
    if (countryDestination != null) {
      _data["country_destination"] = countryDestination?.toJson();
    }
    if (airportSource != null) {
      _data["airport_source"] = airportSource?.toJson();
    }
    if (airportDestination != null) {
      _data["airport_destination"] = airportDestination?.toJson();
    }
    return _data;
  }
}

class AirportDestination {
  int? id;
  String? name;

  AirportDestination({this.id, this.name});

  AirportDestination.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }
}

class AirportSource {
  int? id;
  String? name;

  AirportSource({this.id, this.name});

  AirportSource.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }
}

class CountryDestination {
  int? id;
  String? name;

  CountryDestination({this.id, this.name});

  CountryDestination.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }
}

class CountrySource {
  int? id;
  String? name;

  CountrySource({this.id, this.name});

  CountrySource.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
  }
}

class Plane {
  int? id;
  String? name;
  List<dynamic>? images;

  Plane({this.id, this.name, this.images});

  Plane.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    images = json["images"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    if (images != null) {
      _data["images"] = images;
    }
    return _data;
  }
}
