class CategoryPlacesCountry {
  final int id;
  final String name;

  CategoryPlacesCountry({required this.id, required this.name});

  factory CategoryPlacesCountry.fromJson(Map<String, dynamic> json) {
    return CategoryPlacesCountry(
      id: json['id'],
      name: json['name'],
    );
  }
}

class PlacesModelCountry {
  final int id;
  final String name;
  final String placePrice;
  final String text;
  final int visible;
  final int areaId;
  final List<dynamic> images;
  final List<CategoryPlacesCountry> categories;

  PlacesModelCountry({
    required this.id,
    required this.name,
    required this.placePrice,
    required this.text,
    required this.visible,
    required this.areaId,
    required this.images,
    required this.categories,
  });

  factory PlacesModelCountry.fromJson(Map<String, dynamic> json) {
    var list = json['categories'] as List;
    List<CategoryPlacesCountry> categoryList =
        list.map((i) => CategoryPlacesCountry.fromJson(i)).toList();

    return PlacesModelCountry(
      id: json['id'],
      name: json['name'],
      placePrice: json['place_price'],
      text: json['text'],
      visible: json['visible'],
      areaId: json['area_id'],
      images: json['images'],
      categories: categoryList,
    );
  }
}

class AreaPlace {
  final int id;
  final String name;
  final int countryId;
  final List<PlacesModelCountry> places;

  AreaPlace({
    required this.id,
    required this.name,
    required this.countryId,
    required this.places,
  });

  factory AreaPlace.fromJson(Map<String, dynamic> json) {
    var list = json['places'] as List;
    List<PlacesModelCountry> placeList =
        list.map((i) => PlacesModelCountry.fromJson(i)).toList();

    return AreaPlace(
      id: json['id'],
      name: json['name'],
      countryId: json['country_id'],
      places: placeList,
    );
  }
}

class PlaceResponse {
  final List<AreaPlace> areaPlaces;

  PlaceResponse({required this.areaPlaces});

  factory PlaceResponse.fromJson(Map<String, dynamic> json) {
    var list = json['area_places'] as List? ?? [];
    List<AreaPlace> areaPlaceList =
        list.map((i) => AreaPlace.fromJson(i)).toList();

    return PlaceResponse(areaPlaces: areaPlaceList);
  }
}
