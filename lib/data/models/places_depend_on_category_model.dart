class PlaceDependOnCategoryModel {
  int? id;
  String? name;
  String? placePrice;
  String? text;
  int? visible;
  int? areaId;
  List<Images>? images;
  Area? area;

  PlaceDependOnCategoryModel(
      {this.id,
      this.name,
      this.placePrice,
      this.text,
      this.visible,
      this.areaId,
      this.images,
      this.area});

  PlaceDependOnCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    placePrice = json["place_price"];
    text = json["text"];
    visible = json["visible"];
    areaId = json["area_id"];
    images = json["images"] == null
        ? null
        : (json["images"] as List).map((e) => Images.fromJson(e)).toList();
    area = json["area"] == null ? null : Area.fromJson(json["area"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["place_price"] = placePrice;
    _data["text"] = text;
    _data["visible"] = visible;
    _data["area_id"] = areaId;
    if (images != null) {
      _data["images"] = images?.map((e) => e.toJson()).toList();
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
