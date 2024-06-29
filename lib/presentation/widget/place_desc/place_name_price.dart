import 'package:flutter/widgets.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';

class NameAndPrice extends StatelessWidget {
  final String placeName;
  final String price;
  const NameAndPrice({super.key, required this.placeName, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          placeName,
          style: MyTextStyle.poppins.copyWith(fontSize: 26),
        ),
        Text(
          "\$ $price",
          style: MyTextStyle.normal.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: AppColor.primaryColor),
        ),
      ],
    );
  }
}
