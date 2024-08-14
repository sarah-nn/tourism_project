import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';

// ignore: must_be_immutable
class TextInfoBook extends StatelessWidget {
  TextInfoBook({required this.baseText, required this.secoundText, super.key});
  String baseText;
  String secoundText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.arrow_right,
          color: AppColor.primaryColor,
          size: 27,
        ),
        Text(
          '$baseText : ',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: AppColor.fifeColor),
        ),
        Text(
          secoundText,
          style: const TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class TextInfoBookPriceAndNote extends StatelessWidget {
  TextInfoBookPriceAndNote(
      {required this.sizeSecound,
      required this.backgroundColorSecound,
      required this.baseText,
      required this.secoundText,
      super.key});
  String baseText;
  String secoundText;
  Color backgroundColorSecound;
  double sizeSecound;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.arrow_right,
          color: AppColor.primaryColor,
          size: 27,
        ),
        Text(
          '$baseText : ',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: AppColor.fifeColor),
        ),
        Text(
          secoundText,
          style: TextStyle(
              backgroundColor: backgroundColorSecound, fontSize: sizeSecound),
        ),
      ],
    );
  }
}
