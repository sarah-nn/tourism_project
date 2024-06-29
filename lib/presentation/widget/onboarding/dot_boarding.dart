import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tourism_project/core/utils/app_color.dart';

class DotOnBoarding extends StatelessWidget {
  const DotOnBoarding({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: ExpandingDotsEffect(
          activeDotColor: AppColor.primaryColor, dotHeight: 12, dotWidth: 15),
    );
  }
}
