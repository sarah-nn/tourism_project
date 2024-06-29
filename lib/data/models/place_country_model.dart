class PlaceCountryModel {
  final int id;
  final String name;
  final String placePrice;
  final String text;
  final int areaId;
  final List<Category> categories;

  PlaceCountryModel({
    required this.id,
    required this.name,
    required this.placePrice,
    required this.text,
    required this.areaId,
    required this.categories,
  });

  factory PlaceCountryModel.fromJson(Map<String, dynamic> json) {
    return PlaceCountryModel(
      id: json['id'],
      name: json['name'],
      placePrice: json['place_price'],
      text: json['text'],
      areaId: json['area_id'],
      categories: (json['categories'] as List)
          .map((category) => Category.fromJson(category))
          .toList(),
    );
  }
}

class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }
}
