class HotelModel {
  final int id;
  final String name;
  final String stars;
  final int number_rooms;
  final List<String> images;
  final Area area;

  HotelModel(
      {required this.name,
      required this.id,
      required this.images,
      required this.number_rooms,
      required this.stars,
      required this.area});

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    final area = Area.fromJson(json['area']);
    return HotelModel(
      id: json['id'],
      name: json['name'],
      stars: json['stars'],
      number_rooms: json['number_rooms'],
      images: (json['images'] as List<dynamic>).cast<String>(),
      area: area,
    );
  }
}

class Area {
  final int id;
  final String name;
  final int country_id;

  Area({required this.id, required this.name, required this.country_id});

  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(
      id: json['id'],
      name: json['name'],
      country_id: json['country_id'],
    );
  }
}
