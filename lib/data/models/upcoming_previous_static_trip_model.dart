class UpcomingAndPreviousStatikModel {
  UpcomingAndPreviousStatikModel({
    required this.data,
  });
  late final Data data;

  UpcomingAndPreviousStatikModel.fromJson(Map<String, dynamic> json) {
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
    required this.futureTrips,
    required this.finishedTrips,
  });
  late final List<FutureTrips> futureTrips;
  late final List<FinishedTrips> finishedTrips;

  Data.fromJson(Map<String, dynamic> json) {
    futureTrips = List.from(json['future_trips'])
        .map((e) => FutureTrips.fromJson(e))
        .toList();
    finishedTrips = List.from(json['finished_trips'])
        .map((e) => FinishedTrips.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['future_trips'] = futureTrips.map((e) => e.toJson()).toList();
    _data['finished_trips'] = finishedTrips.map((e) => e.toJson()).toList();
    return _data;
  }
}

class FutureTrips {
  FutureTrips({
    required this.id,
    required this.userId,
    required this.staticTripId,
    required this.numberOfFriend,
    required this.bookPrice,
    required this.staticTrip,
    //  required this.room
  });

  late final int id;
  late final int userId;
  late final int staticTripId;
  late final int numberOfFriend;
  late final String bookPrice;
  late final StaticTrip staticTrip;
  // late final List<Room> room;

  FutureTrips.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    staticTripId = json['static_trip_id'];
    numberOfFriend = json['number_of_friend'];
    bookPrice = json['book_price'];
    staticTrip = StaticTrip.fromJson(json['static_trip']);
    // if (json['rooms'] != null && json['rooms'] is List) {
    //   room = List<Room>.from(json['rooms'].map((room) => Room.fromJson(room)));
    // } else {
    //   room = [];
    // }
    // room = List<Room>.from(json['rooms'].map((room) => Room.fromJson(room)));
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['static_trip_id'] = staticTripId;
    _data['number_of_friend'] = numberOfFriend;
    _data['book_price'] = bookPrice;
    _data['static_trip'] = staticTrip.toJson();
    // _data['rooms'] = room;
    // _data['rooms'] = room.map((room) => room.toJson()).toList();

    return _data;
  }
}

class StaticTrip {
  StaticTrip(
      {required this.id,
      required this.tripName,
      required this.tripCapacity,
      required this.startDate,
      required this.endDate,
      required this.stars,
      required this.tripNote});

  late final int id;
  late final String tripName;
  late final int tripCapacity;
  late final String startDate;
  late final String endDate;
  late final String stars;
  late final String tripNote;

  StaticTrip.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripName = json['trip_name'];
    tripCapacity = json['trip_capacity'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    stars = json['stars'];
    tripNote = json['trip_note'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['trip_name'] = tripName;
    _data['trip_capacity'] = tripCapacity;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['stars'] = stars;
    _data['trip_note'] = tripNote;

    return _data;
  }
}

// class Room {
//   Room({
//     required this.id,
//     required this.capacity,
//   });
//   late final int id;
//   late final int capacity;

//   Room.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     capacity = json['capacity'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['capacity'] = capacity;
//     return _data;
//   }
// }

class FinishedTrips {
  FinishedTrips({
    required this.id,
    required this.userId,
    required this.staticTripId,
    required this.numberOfFriend,
    required this.bookPrice,
    required this.staticTrip,
    // required this.room
  });

  late final int id;
  late final int userId;
  late final int staticTripId;
  late final int numberOfFriend;
  late final String bookPrice;
  late final StaticTrip staticTrip;
  // late final List<Room> room;

  FinishedTrips.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    staticTripId = json['static_trip_id'];
    numberOfFriend = json['number_of_friend'];
    bookPrice = json['book_price'];
    staticTrip = StaticTrip.fromJson(json['static_trip']);
    // room = List<Room>.from(json['rooms']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['static_trip_id'] = staticTripId;
    _data['number_of_friend'] = numberOfFriend;
    _data['book_price'] = bookPrice;
    _data['static_trip'] = staticTrip.toJson();
    // _data['rooms'] = room;

    return _data;
  }
}
