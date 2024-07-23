class DynamicTripModel {
  DynamicTrip? dynamicTrip;
  List<Activities>? activities;
  SourceTrip? sourceTrip;
  DestinationTrip? destinationTrip;
  List<Places>? places;
  Hotel? hotel;
  List<Rooms>? rooms;

  DynamicTripModel(
      {this.dynamicTrip,
      this.activities,
      this.sourceTrip,
      this.destinationTrip,
      this.places,
      this.hotel,
      this.rooms});

  DynamicTripModel.fromJson(Map<String, dynamic> json) {
    dynamicTrip = json["dynamic_trip"] == null
        ? null
        : DynamicTrip.fromJson(json["dynamic_trip"]);
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
    hotel = json["hotel"] == null ? null : Hotel.fromJson(json["hotel"]);
    rooms = json["rooms"] == null
        ? null
        : (json["rooms"] as List).map((e) => Rooms.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (dynamicTrip != null) {
      _data["dynamic_trip"] = dynamicTrip?.toJson();
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

    if (hotel != null) {
      _data["hotel"] = hotel?.toJson();
    }
    if (rooms != null) {
      _data["rooms"] = rooms?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Rooms {
  int? id;
  int? capacity;
  String? price;

  Rooms({this.id, this.capacity, this.price});

  Rooms.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    capacity = json["capacity"];
    price = json["price"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["capacity"] = capacity;
    _data["price"] = price;
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

class Places {
  int? id;
  String? name;
  String? placePrice;
  String? text;
  int? areaId;
  int? visible;
  List<Images>? images;
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
    images = json["images"] == null
        ? null
        : (json["images"] as List).map((e) => Images.fromJson(e)).toList();
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
      _data["images"] = images?.map((e) => e.toJson()).toList();
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

class Images {
  int? id;
  int? placeId;
  String? image;

  Images({this.id, this.placeId, this.image});

  Images.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    placeId = json["place_id"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["place_id"] = placeId;
    _data["image"] = image;
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

class DynamicTrip {
  int? id;
  int? sourceTripId;
  int? destinationTripId;
  String? tripName;
  String? price;
  int? numberOfPeople;
  String? startDate;
  String? endDate;
  String? tripNote;
  int? roomsCount;

  DynamicTrip(
      {this.id,
      this.sourceTripId,
      this.destinationTripId,
      this.tripName,
      this.price,
      this.numberOfPeople,
      this.startDate,
      this.endDate,
      this.tripNote,
      this.roomsCount});

  DynamicTrip.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    sourceTripId = json["source_trip_id"];
    destinationTripId = json["destination_trip_id"];
    tripName = json["trip_name"];
    price = json["price"];
    numberOfPeople = json["number_of_people"];
    startDate = json["start_date"];
    endDate = json["end_date"];
    tripNote = json["trip_note"];
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
    _data["start_date"] = startDate;
    _data["end_date"] = endDate;
    _data["trip_note"] = tripNote;
    _data["rooms_count"] = roomsCount;
    return _data;
  }
}
