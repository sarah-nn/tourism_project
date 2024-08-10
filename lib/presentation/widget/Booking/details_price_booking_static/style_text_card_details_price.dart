import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';

// ignore: must_be_immutable
class TextAddress extends StatelessWidget {
  TextAddress({super.key, required this.addressText});
  String addressText;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$addressText :',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: AppColor.primaryColor,
          fontFamily: 'Poppins'),
    );
  }
}

// ignore: must_be_immutable
class TextDetailsPrice extends StatelessWidget {
  TextDetailsPrice({super.key, required this.details, this.price});
  String details;
  double? price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$details :',
          style: TextStyle(
            color: AppColor.fifeColor,
          ),
        ),
        Text(
          '$price\$',
          style: const TextStyle(fontSize: 18),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class TextTotalPrice extends StatelessWidget {
  TextTotalPrice({super.key, required this.nameTotal, this.price});
  String nameTotal;
  double? price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Total Price $nameTotal :',
            style: TextStyle(
                color: AppColor.fifeColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline)),
        Text('$price\$',
            style: const TextStyle(fontSize: 19, color: Colors.red))
      ],
    );
  }
}

// ignore: must_be_immutable
class TextIconAndDetailsPrice extends StatelessWidget {
  TextIconAndDetailsPrice({super.key, required this.details});
  String details;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.subdirectory_arrow_right,
          color: Colors.black38,
        ),
        Text(
          details,
          style: const TextStyle(color: Colors.black38),
        )
      ],
    );
  }
}
