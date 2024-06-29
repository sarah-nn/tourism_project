// ignore: file_names
import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';

// ignore: must_be_immutable
class WidgetElevatedButton extends StatelessWidget {
  WidgetElevatedButton(
      {required this.height,
      required this.onTap,
      required this.text,
      super.key});
  String text;
  void Function() onTap;
  double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          backgroundColor: AppColor.primaryColor,
          elevation: 10,
        ),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
