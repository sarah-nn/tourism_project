class PlaceDependOnCategoryModel {
  int id;
  String name;
  String place_price;
  String text;
  int area_id;
  List<ImageModel> images;
  Area area;

  PlaceDependOnCategoryModel({
    required this.id,
    required this.name,
    required this.place_price,
    required this.text,
    required this.area_id,
    required this.images,
    required this.area,
  });

  factory PlaceDependOnCategoryModel.fromJson(Map<String, dynamic> json) {
    return PlaceDependOnCategoryModel(
      id: json['id'],
      name: json['name'],
      place_price: json['place_price'],
      text: json['text'],
      area_id: json['area_id'],
      images: (json['images'] as List)
          .map((imageJson) => ImageModel.fromJson(imageJson))
          .toList(),
      area: Area.fromJson(json['area']),
    );
  }
}

class Area {
  int id;
  String name;
  int country_id;
  Country country;

  Area({
    required this.id,
    required this.name,
    required this.country_id,
    required this.country,
  });

  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(
      id: json['id'],
      name: json['name'],
      country_id: json['country_id'],
      country: Country.fromJson(json['country']),
    );
  }
}

class Country {
  int id;
  String name;

  Country({
    required this.id,
    required this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ImageModel {
  int id;
  String url;

  ImageModel({
    required this.id,
    required this.url,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      url: json['url'],
    );
  }
}
