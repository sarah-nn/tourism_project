class AreasModel {
  final int id;
  final String name;
  final List<Areas> areas;

  AreasModel({
    required this.id,
    required this.name,
    required this.areas,
  });

  factory AreasModel.fromJson(Map<String, dynamic> json) {
    final areas = List<Areas>.from(
        json['areas'].map((category) => Areas.fromJson(category)));
    return AreasModel(
      id: json['id'],
      name: json['name'],
      areas: areas,
    );
  }
}

class Areas {
  final int id;
  final String name;

  Areas({required this.id, required this.name});

  factory Areas.fromJson(Map<String, dynamic> json) {
    return Areas(
      id: json['id'],
      name: json['name'],
    );
  }
}
