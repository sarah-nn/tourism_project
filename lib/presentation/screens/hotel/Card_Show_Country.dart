import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/country_model.dart';

// ignore: must_be_immutable
class CardWidgetCountry extends StatelessWidget {
  CardWidgetCountry({required this.country, this.onTap, super.key});
  final CountryModel country;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          decoration: BoxDecoration(
              color: AppColor.secondColor.withAlpha(100),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: AppColor.primaryColor)),
          child: Center(
            child: Text(country.name),
          ),
        ),
      ),
    );
  }
}
