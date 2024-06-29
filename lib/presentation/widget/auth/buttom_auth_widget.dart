import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';

class CustomButtomAuth extends StatelessWidget {
  final void Function() onPressed;
  final String? textButtom;

  const CustomButtomAuth(
      {super.key, required this.onPressed, required this.textButtom});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      width: double.maxFinite,
      child: MaterialButton(
          onPressed: onPressed,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          textColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 13),
          color: AppColor.primaryColor,
          child: Text(
            textButtom!,
            style: TextStyle(fontSize: 20),
          )),
    );
  }
}
