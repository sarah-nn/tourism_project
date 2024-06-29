import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              blurRadius: 30,
              color: AppColor.thirdColor.withOpacity(0.55),
              spreadRadius: 20,
            ),
          ]),
      child: Image.asset(
        AppImage.logoAuth2,
        height: 180,
      ),
    );
  }
}
