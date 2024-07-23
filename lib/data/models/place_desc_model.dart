// class PlaceDescModel {
//   final int id;
//   final String name;
//   final String placePrice;
//   final String text;
//   final int areaId;
//   final int visible;
//   final List<CommentModel> comments;
//   final List<ImageModel> images;
//   final List<CategoryModel> categories;
//   final AreaModel area;

//   PlaceDescModel({
//     required this.id,
//     required this.name,
//     required this.placePrice,
//     required this.text,
//     required this.areaId,
//     required this.visible,
//     required this.comments,
//     required this.images,
//     required this.categories,
//     required this.area,
//   });

//   factory PlaceDescModel.fromJson(Map<String, dynamic> json) {
//     final commentsJson = json['comments'] as List<dynamic>;
//     final comments = commentsJson
//         .map((commentJson) => CommentModel.fromJson(commentJson))
//         .toList();

//     final imagesJson = json['images'] as List<dynamic>;
//     final images =
//         imagesJson.map((imageJson) => ImageModel.fromJson(imageJson)).toList();

//     final categoriesJson = json['categories'] as List<dynamic>;
//     final categories = categoriesJson
//         .map((categoryJson) => CategoryModel.fromJson(categoryJson))
//         .toList();

//     final areaJson = json['area'];
//     final area = AreaModel.fromJson(areaJson);

//     return PlaceDescModel(
//       id: json['id'],
//       name: json['name'],
//       placePrice: json['place_price'],
//       text: json['text'],
//       areaId: json['area_id'],
//       visible: json['visible'],
//       comments: comments,
//       images: images,
//       categories: categories,
//       area: area,
//     );
//   }
// }

// class CommentModel {
//   final int id;
//   final int placeId;
//   final int userId;
//   final String comment;
//   final DateTime createdAt;
//   final UserModel user;

//   CommentModel({
//     required this.id,
//     required this.placeId,
//     required this.userId,
//     required this.comment,
//     required this.createdAt,
//     required this.user,
//   });

//   factory CommentModel.fromJson(Map<String, dynamic> json) {
//     return CommentModel(
//       id: json['id'],
//       placeId: json['place_id'],
//       userId: json['user_id'],
//       comment: json['comment'],
//       createdAt: DateTime.parse(json['created_at']),
//       user: UserModel.fromJson(json['user']),
//     );
//   }
// }

// class UserModel {
//   final int id;
//   final String name;
//   final String? image;

//   UserModel({
//     required this.id,
//     required this.name,
//     this.image,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json['id'],
//       name: json['name'],
//       image: json['image'],
//     );
//   }
// }

// class ImageModel {
//   final int id;
//   final String url;

//   ImageModel({
//     required this.id,
//     required this.url,
//   });

//   factory ImageModel.fromJson(Map<String, dynamic> json) {
//     return ImageModel(
//       id: json['id'],
//       url: json['url'],
//     );
//   }
// }

// class CategoryModel {
//   final int id;
//   final String name;

//   CategoryModel({
//     required this.id,
//     required this.name,
//   });

//   factory CategoryModel.fromJson(Map<String, dynamic> json) {
//     return CategoryModel(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
// }

// class AreaModel {
//   final int id;
//   final String name;
//   final int countryId;
//   final CountryModel country;

//   AreaModel({
//     required this.id,
//     required this.name,
//     required this.countryId,
//     required this.country,
//   });

//   factory AreaModel.fromJson(Map<String, dynamic> json) {
//     final countryJson = json['country'];
//     final country = CountryModel.fromJson(countryJson);

//     return AreaModel(
//       id: json['id'],
//       name: json['name'],
//       countryId: json['country_id'],
//       country: country,
//     );
//   }
// }

// class CountryModel {
//   final int id;
//   final String name;

//   CountryModel({
//     required this.id,
//     required this.name,
//   });

//   factory CountryModel.fromJson(Map<String, dynamic> json) {
//     return CountryModel(
//       id: json['id'],
//       name: json['name'],
//     );
//   }
// }

class PlaceDescModel {
  int? id;
  String? name;
  String? placePrice;
  String? text;
  int? areaId;
  int? visible;
  List<dynamic>? comments;
  List<Images>? images;
  List<Categories>? categories;
  Area? area;

  PlaceDescModel(
      {this.id,
      this.name,
      this.placePrice,
      this.text,
      this.areaId,
      this.visible,
      this.comments,
      this.images,
      this.categories,
      this.area});

  PlaceDescModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    placePrice = json["place_price"];
    text = json["text"];
    areaId = json["area_id"];
    visible = json["visible"];
    comments = json["comments"] ?? [];
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
    if (comments != null) {
      _data["comments"] = comments;
    }
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
