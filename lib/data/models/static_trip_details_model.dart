class StaticDetailsModel {
  StaticTrip? staticTrip;
  List<Activities>? activities;
  SourceTrip? sourceTrip;
  DestinationTrip? destinationTrip;
  List<Places>? places;
  GoingTrip? goingTrip;
  ReturnTrip? returnTrip;
  Hotel? hotel;

  StaticDetailsModel(
      {this.staticTrip,
      this.activities,
      this.sourceTrip,
      this.destinationTrip,
      this.places,
      this.goingTrip,
      this.returnTrip,
      this.hotel});

  StaticDetailsModel.fromJson(Map<String, dynamic> json) {
    staticTrip = json["static_trip"] == null
        ? null
        : StaticTrip.fromJson(json["static_trip"]);
    activities = json["activities"] == null
        ? null
        : (json["activities"] as List)
            .map((e) => Activities.fromJson(e))
            .toList();
    sourceTrip = json["source_trip"] == null
        ? null
        : SourceTrip.fromJson(json["source_trip"]);
    destinationTrip = json["destination_trip"] == null
        ? null
        : DestinationTrip.fromJson(json["destination_trip"]);
    places = json["places"] == null
        ? null
        : (json["places"] as List).map((e) => Places.fromJson(e)).toList();
    goingTrip = json["going_trip"] == null
        ? null
        : GoingTrip.fromJson(json["going_trip"]);
    returnTrip = json["return_trip"] == null
        ? null
        : ReturnTrip.fromJson(json["return_trip"]);
    hotel = json["hotel"] == null ? null : Hotel.fromJson(json["hotel"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (staticTrip != null) {
      _data["static_trip"] = staticTrip?.toJson();
    }
    if (activities != null) {
      _data["activities"] = activities?.map((e) => e.toJson()).toList();
    }
    if (sourceTrip != null) {
      _data["source_trip"] = sourceTrip?.toJson();
    }
    if (destinationTrip != null) {
      _data["destination_trip"] = destinationTrip?.toJson();
    }
    if (places != null) {
      _data["places"] = places?.map((e) => e.toJson()).toList();
    }
    if (goingTrip != null) {
      _data["going_trip"] = goingTrip?.toJson();
    }
    if (returnTrip != null) {
      _data["return_trip"] = returnTrip?.toJson();
    }
    if (hotel != null) {
      _data["hotel"] = hotel?.toJson();
    }
    return _data;
  }
}

class Hotel {
  int? id;
  String? name;

  Hotel({this.id, this.name});

  Hotel.fromJson(Map<String, dynamic> json) {
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

class ReturnTrip {
  ReturnPlane? returnPlane;
  AirportSource1? airportSource;
  AirportDestination1? airportDestination;

  ReturnTrip({this.returnPlane, this.airportSource, this.airportDestination});

  ReturnTrip.fromJson(Map<String, dynamic> json) {
    returnPlane = json["return_plane"] == null
        ? null
        : ReturnPlane.fromJson(json["return_plane"]);
    airportSource = json["airport_source"] == null
        ? null
        : AirportSource1.fromJson(json["airport_source"]);
    airportDestination = json["airport_destination"] == null
        ? null
        : AirportDestination1.fromJson(json["airport_destination"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (returnPlane != null) {
      _data["return_plane"] = returnPlane?.toJson();
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

class ReturnPlane {
  int? id;
  String? name;

  ReturnPlane({this.id, this.name});

  ReturnPlane.fromJson(Map<String, dynamic> json) {
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

class GoingTrip {
  GoingPlane? goingPlane;
  AirportSource? airportSource;
  AirportDestination? airportDestination;

  GoingTrip({this.goingPlane, this.airportSource, this.airportDestination});

  GoingTrip.fromJson(Map<String, dynamic> json) {
    goingPlane = json["going_plane"] == null
        ? null
        : GoingPlane.fromJson(json["going_plane"]);
    airportSource = json["airport_source"] == null
        ? null
        : AirportSource.fromJson(json["airport_source"]);
    airportDestination = json["airport_destination"] == null
        ? null
        : AirportDestination.fromJson(json["airport_destination"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (goingPlane != null) {
      _data["going_plane"] = goingPlane?.toJson();
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

class GoingPlane {
  int? id;
  String? name;

  GoingPlane({this.id, this.name});

  GoingPlane.fromJson(Map<String, dynamic> json) {
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

class Places {
  int? id;
  String? name;
  String? placePrice;
  String? text;
  int? areaId;
  int? visible;
  List<dynamic>? images;
  Area? area;

  Places(
      {this.id,
      this.name,
      this.placePrice,
      this.text,
      this.areaId,
      this.visible,
      this.images,
      this.area});

  Places.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    placePrice = json["place_price"];
    text = json["text"];
    areaId = json["area_id"];
    visible = json["visible"];
    images = json["images"] ?? [];
    area = json["area"] == null ? null : Area.fromJson(json["area"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["place_price"] = placePrice;
    _data["text"] = text;
    _data["area_id"] = areaId;
    _data["visible"] = visible;
    if (images != null) {
      _data["images"] = images;
    }
    if (area != null) {
      _data["area"] = area?.toJson();
    }
    return _data;
  }
}

class Area {
  int? id;
  String? name;

  Area({this.id, this.name});

  Area.fromJson(Map<String, dynamic> json) {
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

class DestinationTrip {
  int? id;
  String? name;

  DestinationTrip({this.id, this.name});

  DestinationTrip.fromJson(Map<String, dynamic> json) {
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

class SourceTrip {
  int? id;
  String? name;

  SourceTrip({this.id, this.name});

  SourceTrip.fromJson(Map<String, dynamic> json) {
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

class Activities {
  int? id;
  String? name;

  Activities({this.id, this.name});

  Activities.fromJson(Map<String, dynamic> json) {
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

class StaticTrip {
  int? id;
  int? sourceTripId;
  int? destinationTripId;
  String? tripName;
  String? price;
  int? numberOfPeople;
  int? tripCapacity;
  String? startDate;
  String? endDate;
  String? stars;
  String? tripNote;
  String? type;
  int? roomsCount;

  StaticTrip(
      {this.id,
      this.sourceTripId,
      this.destinationTripId,
      this.tripName,
      this.price,
      this.numberOfPeople,
      this.tripCapacity,
      this.startDate,
      this.endDate,
      this.stars,
      this.tripNote,
      this.type,
      this.roomsCount});

  StaticTrip.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    sourceTripId = json["source_trip_id"];
    destinationTripId = json["destination_trip_id"];
    tripName = json["trip_name"];
    price = json["price"];
    numberOfPeople = json["number_of_people"];
    tripCapacity = json["trip_capacity"];
    startDate = json["start_date"];
    endDate = json["end_date"];
    stars = json["stars"];
    tripNote = json["trip_note"];
    type = json["type"];
    roomsCount = json["rooms_count"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["source_trip_id"] = sourceTripId;
    _data["destination_trip_id"] = destinationTripId;
    _data["trip_name"] = tripName;
    _data["price"] = price;
    _data["number_of_people"] = numberOfPeople;
    _data["trip_capacity"] = tripCapacity;
    _data["start_date"] = startDate;
    _data["end_date"] = endDate;
    _data["stars"] = stars;
    _data["trip_note"] = tripNote;
    _data["type"] = type;
    _data["rooms_count"] = roomsCount;
    return _data;
  }
}
