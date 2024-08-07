class DynamicPlane {
  final int id;
  final String name;
  final String ticketPrice;

  DynamicPlane(
      {required this.id, required this.name, required this.ticketPrice});

  factory DynamicPlane.fromJson(Map<String, dynamic> json) {
    return DynamicPlane(
      id: json['id'],
      name: json['name'],
      ticketPrice: json['ticket_price'],
    );
  }
}

class DynamicAirport {
  final int id;
  final String name;

  DynamicAirport({required this.id, required this.name});

  factory DynamicAirport.fromJson(Map<String, dynamic> json) {
    return DynamicAirport(
      id: json['id'],
      name: json['name'],
    );
  }
}
