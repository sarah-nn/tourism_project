class RoomModel {
  Data? data;

  RoomModel({this.data});

  RoomModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Capacity2? capacity2;
  Capacity2? capacity4;
  Capacity2? capacity6;

  Data({this.capacity2, this.capacity4, this.capacity6});

  Data.fromJson(Map<String, dynamic> json) {
    capacity2 = json['capacity_2'] != null
        ? new Capacity2.fromJson(json['capacity_2'])
        : null;
    capacity4 = json['capacity_4'] != null
        ? new Capacity2.fromJson(json['capacity_4'])
        : null;
    capacity6 = json['capacity_6'] != null
        ? new Capacity2.fromJson(json['capacity_6'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.capacity2 != null) {
      data['capacity_2'] = this.capacity2!.toJson();
    }
    if (this.capacity4 != null) {
      data['capacity_4'] = this.capacity4!.toJson();
    }
    if (this.capacity6 != null) {
      data['capacity_6'] = this.capacity6!.toJson();
    }
    return data;
  }
}

class Capacity2 {
  int? count;
  String? price;

  Capacity2({this.count, this.price});

  Capacity2.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['price'] = this.price;
    return data;
  }
}
