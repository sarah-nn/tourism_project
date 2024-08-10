import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';

// ignore: must_be_immutable
class AddressEditAnPage extends StatelessWidget {
  AddressEditAnPage(
      {required this.text,
      required this.color,
      required this.fontSize,
      super.key});
  String text;
  Color color;
  double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: 'BrightDiamondPersonalUseOnl-OV2Ze',
          shadows: const [
            Shadow(
                offset: Offset(3.4, 2.4),
                blurRadius: 4.0,
                color: Color.fromARGB(255, 185, 216, 241))
          ],
          decoration: TextDecoration.underline,
          decorationThickness: 0.5,
          decorationColor: AppColor.primaryColor),
    );
  }
}
