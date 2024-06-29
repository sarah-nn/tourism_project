import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  const CustomButtonOnBoarding(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 30),
        width: 310,
        height: 57,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 18.5),
            )));
  }
}
