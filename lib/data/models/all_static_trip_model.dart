class AllStaticTripModel {
  int? id;
  String? tripName;
  String? price;
  int? numberOfPeople;
  int? tripCapacity;
  String? startDate;
  String? endDate;
  String? stars;
  String? tripNote;

  AllStaticTripModel(
      {this.id,
      this.tripName,
      this.price,
      this.numberOfPeople,
      this.tripCapacity,
      this.startDate,
      this.endDate,
      this.stars,
      this.tripNote});

  AllStaticTripModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripName = json['trip_name'];
    price = json['price'];
    numberOfPeople = json['number_of_people'];
    tripCapacity = json['trip_capacity'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    stars = json['stars'];
    tripNote = json['trip_note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trip_name'] = this.tripName;
    data['price'] = this.price;
    data['number_of_people'] = this.numberOfPeople;
    data['trip_capacity'] = this.tripCapacity;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['stars'] = this.stars;
    data['trip_note'] = this.tripNote;
    return data;
  }
}
