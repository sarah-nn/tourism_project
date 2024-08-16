class PaymentModel {
  Data? data;

  PaymentModel({this.data});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  int? id;
  String? email;
  String? money;
  String? payments;
  int? point;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.email,
      this.money,
      this.payments,
      this.point,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    email = json["email"];
    money = json["money"];
    payments = json["payments"];
    point = json["point"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["email"] = email;
    _data["money"] = money;
    _data["payments"] = payments;
    _data["point"] = point;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}
