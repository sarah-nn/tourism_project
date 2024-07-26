// class UserInfoModel {
//   int? id;
//   String? name;
//   String? email;
//   String? emailVerifiedAt;
//   String? image;
//   int? position;
//   String? phoneNumber;
//   String? createdAt;
//   String? updatedAt;

//   UserInfoModel(
//       {this.id,
//       this.name,
//       this.email,
//       this.emailVerifiedAt,
//       this.image,
//       this.position,
//       this.phoneNumber,
//       this.createdAt,
//       this.updatedAt});

//   UserInfoModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     emailVerifiedAt = json['email_verified_at'];
//     image = json['image'];
//     position = json['position'];
//     phoneNumber = json['phone_number'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = id;
//     data['name'] = name;
//     data['email'] = email;
//     data['email_verified_at'] = emailVerifiedAt;
//     data['image'] = image;
//     data['position'] = position;
//     data['phone_number'] = phoneNumber;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }

class UserInfoModel {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? image;
  Position? position;

  UserInfoModel(
      {this.id,
      this.name,
      this.email,
      this.phoneNumber,
      this.image,
      this.position});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phoneNumber = json["phone_number"];
    image = json["image"];
    position =
        json["position"] == null ? null : Position.fromJson(json["position"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["phone_number"] = phoneNumber;
    _data["image"] = image;
    if (position != null) {
      _data["position"] = position?.toJson();
    }
    return _data;
  }
}

class Position {
  int? id;
  String? name;

  Position({this.id, this.name});

  Position.fromJson(Map<String, dynamic> json) {
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
