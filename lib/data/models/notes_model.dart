class NotesModel {
  int? id;
  String? tripName;
  String? tripNote;
  String? type;

  NotesModel({this.id, this.tripName, this.tripNote, this.type});

  NotesModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    tripName = json["trip_name"];
    tripNote = json["trip_note"];
    type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["trip_name"] = tripName;
    _data["trip_note"] = tripNote;
    _data["type"] = type;
    return _data;
  }
}
