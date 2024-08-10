class FavoriteModel {
  final int id;
  final int placeId;
  final Places place;
  FavoriteModel({required this.id, required this.placeId, required this.place});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    final place = Places.fromJson(json['place']);
    return FavoriteModel(
      id: json['id'],
      placeId: json['place_id'],
      place: place,
    );
  }
}

class Places {
  final int id;
  final String namePlace;
  final Area area;
  List<Images> images;

  Places(
      {required this.id,
      required this.namePlace,
      required this.area,
      required this.images});

  factory Places.fromJson(Map<String, dynamic> json) {
    final area = Area.fromJson(json['area']);
    final images =
        (json["images"] as List).map((e) => Images.fromJson(e)).toList();
    return Places(
        id: json['id'], namePlace: json['name'], area: area, images: images);
  }
}

class Area {
  final int id;
  final String name;
  final int countryId;
  final Country country;

  Area(
      {required this.id,
      required this.name,
      required this.countryId,
      required this.country});

  factory Area.fromJson(Map<String, dynamic> json) {
    final country = Country.fromJson(json['country']);

    return Area(
        id: json["id"],
        name: json["name"],
        countryId: json["country_id"],
        country: country);
  }
}

class Country {
  final int id;
  final String name;

  Country({required this.id, required this.name});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json["id"],
      name: json["name"],
    );
  }
}

class Images {
  final int id;
  final int placeId;
  final String image;

  Images({required this.id, required this.placeId, required this.image});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
        id: json["id"], placeId: json["place_id"], image: json["image"]);
  }
}
