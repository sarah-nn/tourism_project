class DontMissModel {
  final int id;
  final String tripName;
  final String price;
  final int numPepole;
  final String startDate;
  final String endDate;
  final String stars;
  final int idDestination;

  DontMissModel(
      {required this.endDate,
      required this.id,
      required this.numPepole,
      required this.price,
      required this.stars,
      required this.startDate,
      required this.tripName,
      required this.idDestination});

  factory DontMissModel.fromJson(Map<String, dynamic> json) {
    return DontMissModel(
      id: json['id'],
      tripName: json['trip_name'],
      price: json['price'],
      numPepole: json['number_of_people'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      stars: json['stars'],
      idDestination: json['destination_trip_id'],
    );
  }
}
