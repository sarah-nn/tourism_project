class PlaceDescModel {
  final int id;
  final String name;
  final String placePrice;
  final String text;
  final int areaId;
  final int visible;
  final List<CommentModel> comments;
  final List<ImageModel> images;
  final List<CategoryModel> categories;
  final AreaModel area;

  PlaceDescModel({
    required this.id,
    required this.name,
    required this.placePrice,
    required this.text,
    required this.areaId,
    required this.visible,
    required this.comments,
    required this.images,
    required this.categories,
    required this.area,
  });

  factory PlaceDescModel.fromJson(Map<String, dynamic> json) {
    final commentsJson = json['comments'] as List<dynamic>;
    final comments = commentsJson
        .map((commentJson) => CommentModel.fromJson(commentJson))
        .toList();

    final imagesJson = json['images'] as List<dynamic>;
    final images =
        imagesJson.map((imageJson) => ImageModel.fromJson(imageJson)).toList();

    final categoriesJson = json['categories'] as List<dynamic>;
    final categories = categoriesJson
        .map((categoryJson) => CategoryModel.fromJson(categoryJson))
        .toList();

    final areaJson = json['area'];
    final area = AreaModel.fromJson(areaJson);

    return PlaceDescModel(
      id: json['id'],
      name: json['name'],
      placePrice: json['place_price'],
      text: json['text'],
      areaId: json['area_id'],
      visible: json['visible'],
      comments: comments,
      images: images,
      categories: categories,
      area: area,
    );
  }
}

class CommentModel {
  final int id;
  final int placeId;
  final int userId;
  final String comment;
  final DateTime createdAt;
  final UserModel user;

  CommentModel({
    required this.id,
    required this.placeId,
    required this.userId,
    required this.comment,
    required this.createdAt,
    required this.user,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      placeId: json['place_id'],
      userId: json['user_id'],
      comment: json['comment'],
      createdAt: DateTime.parse(json['created_at']),
      user: UserModel.fromJson(json['user']),
    );
  }
}

class UserModel {
  final int id;
  final String name;
  final String? image;

  UserModel({
    required this.id,
    required this.name,
    this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

class ImageModel {
  final int id;
  final String url;

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

class CategoryModel {
  final int id;
  final String name;

  CategoryModel({
    required this.id,
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

class AreaModel {
  final int id;
  final String name;
  final int countryId;
  final CountryModel country;

  AreaModel({
    required this.id,
    required this.name,
    required this.countryId,
    required this.country,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    final countryJson = json['country'];
    final country = CountryModel.fromJson(countryJson);

    return AreaModel(
      id: json['id'],
      name: json['name'],
      countryId: json['country_id'],
      country: country,
    );
  }
}

class CountryModel {
  final int id;
  final String name;

  CountryModel({
    required this.id,
    required this.name,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
