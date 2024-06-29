class UserInfoModel {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? image;
  int? position;
  String? createdAt;
  String? updatedAt;

  UserInfoModel(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.image,
      this.position,
      this.createdAt,
      this.updatedAt});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    image = json['image'];
    position = json['position'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['image'] = image;
    data['position'] = position;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
