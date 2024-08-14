import 'package:flutter/widgets.dart';

class AttributeStaticDetails {
  String tripId;
  List<dynamic>? imageList;
  bool enableBook;
  AttributeStaticDetails(
      {required this.tripId,
      @required this.imageList,
      required this.enableBook});
}
