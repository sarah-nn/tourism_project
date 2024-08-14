class TopVisitedModel {
  int? id;
  String? name;
  String? placePrice;
  String? text;
  int? areaId;
  int? visible;
  List<Images>? images;
  List<Categories>? categories;
  Area? area;

  TopVisitedModel(
      {this.id,
      this.name,
      this.placePrice,
      this.text,
      this.areaId,
      this.visible,
      this.images,
      this.categories,
      this.area});

  TopVisitedModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    placePrice = json["place_price"];
    text = json["text"];
    areaId = json["area_id"];
    visible = json["visible"];
    images = json["images"] == null
        ? null
        : (json["images"] as List).map((e) => Images.fromJson(e)).toList();
    categories = json["categories"] == null
        ? null
        : (json["categories"] as List)
            .map((e) => Categories.fromJson(e))
            .toList();
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
    if (categories != null) {
      _data["categories"] = categories?.map((e) => e.toJson()).toList();
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
  int? countryId;
  Country? country;

  Area({this.id, this.name, this.countryId, this.country});

  Area.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    countryId = json["country_id"];
    country =
        json["country"] == null ? null : Country.fromJson(json["country"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["country_id"] = countryId;
    if (country != null) {
      _data["country"] = country?.toJson();
    }
    return _data;
  }
}

class Country {
  int? id;
  String? name;

  Country({this.id, this.name});

  Country.fromJson(Map<String, dynamic> json) {
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

class Categories {
  int? id;
  String? name;

  Categories({this.id, this.name});

  Categories.fromJson(Map<String, dynamic> json) {
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
