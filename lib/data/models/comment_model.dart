class Comment {
  final int id;
  final int placeId;
  final int userId;
  final String comment;
  final String createdAt;
  final User user;

  Comment({
    required this.id,
    required this.placeId,
    required this.userId,
    required this.comment,
    required this.createdAt,
    required this.user,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      placeId: json['place_id'],
      userId: json['user_id'],
      comment: json['comment'],
      createdAt: json['created_at'],
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final int id;
  final String name;
  final String? image;

  User({
    required this.id,
    required this.name,
    this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
