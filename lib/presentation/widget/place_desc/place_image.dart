import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism_project/core/utils/app_images.dart';

class PlaceImage extends StatelessWidget {
  const PlaceImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 330,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppImage.tajMahal), fit: BoxFit.cover),
      ),
    );
  }
}
