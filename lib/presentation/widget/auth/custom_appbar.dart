import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';

AppBar customAppBar(String title) {
  return AppBar(
    backgroundColor: AppColor.primaryColor,
    elevation: 0.0,
    title: Padding(
      padding: EdgeInsets.only(left: 10),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 23),
        textAlign: TextAlign.start,
      ),
    ),
  );
}
