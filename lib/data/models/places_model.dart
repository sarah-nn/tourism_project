class Place {
  final int id;
  final String name;
  final double placePrice;
  final String text;
  final List<Category> categories;
  final Area area;

  Place({
    required this.id,
    required this.name,
    required this.placePrice,
    required this.text,
    required this.categories,
    required this.area,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    final categories = List<Category>.from(
        json['categories'].map((category) => Category.fromJson(category)));
    final area = Area.fromJson(json['area']);
    return Place(
      id: json['id'],
      name: json['name'],
      placePrice: double.parse(json['place_price']),
      text: json['text'],
      categories: categories,
      area: area,
    );
  }
}

class Category {
  final int id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Area {
  final int id;
  final String name;
  final Country country;

  Area({required this.id, required this.name, required this.country});

  factory Area.fromJson(Map<String, dynamic> json) {
    final country = Country.fromJson(json['country']);
    return Area(
      id: json['id'],
      name: json['name'],
      country: country,
    );
  }
}

class Country {
  final int id;
  final String name;

  Country({required this.id, required this.name});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['name'],
    );
  }
}
