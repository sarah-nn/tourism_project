import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';

// ignore: must_be_immutable
class LocationAndCategory extends StatelessWidget {
  final String country;
  final String area;
  var category;
  LocationAndCategory(
      {super.key,
      required this.country,
      required this.area,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Expanded(
            child: Container(child: locationRow("$country , $area")),
          ),
          // SizedBox(width: 40),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                "per person",
                style: TextStyle(fontSize: 17, color: Colors.black54),
              ),
            ),
          )
          // Icon(
          //   Icons.location_on_outlined,
          //   color: AppColor.primaryColor,
          // ),
          // Text(
          //   "$country, $area ",
          //   style: TextStyle(fontSize: 17, color: AppColor.primaryColor),
          // ),
          // const SizedBox(width: 153),
          // const Text(
          //   "Per Person",
          // )
        ],
      ),
      const SizedBox(height: 25),
      Container(
        padding: const EdgeInsets.only(right: 30, left: 10, top: 3, bottom: 3),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 244, 211),
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          "Cat. $category",
          style: MyTextStyle.normal.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: const Color.fromARGB(255, 177, 150, 72)),
        ),
      )
    ]);
  }
}

Widget locationRow(String location) {
  return Container(
      padding: EdgeInsets.only(top: 7),
      child: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            color: AppColor.primaryColor,
            size: 21,
          ),
          Text(
            location,
            style: TextStyle(fontSize: 17, color: Colors.black54),
          ),
        ],
      ));
}
