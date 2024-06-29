import 'package:flutter/material.dart';

class HotelSheetWidget extends StatefulWidget {
  HotelSheetWidget({super.key, required this.index});
  final int index;

  @override
  State<HotelSheetWidget> createState() => _HotelSheetWidgetState();
}

class _HotelSheetWidgetState extends State<HotelSheetWidget> {
  String selectedName = "hotel name";
  @override
  Widget build(BuildContext context) {
    return Radio(
        value: widget.index,
        groupValue: selectedName,
        onChanged: (val) {
          setState(() {
            selectedName = "mylist[i]";
          });
        });
  }
}
