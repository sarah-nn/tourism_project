import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';

// ignore: must_be_immutable
class TextNameBook extends StatelessWidget {
  TextNameBook({required this.name, super.key});
  String name;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: -19,
        left: 20,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 0.7, color: AppColor.primaryColor),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 191, 223, 251),
                Color.fromARGB(255, 216, 246, 250),
                Color.fromARGB(255, 223, 224, 249),
              ]),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Text(
              name,
              style: TextStyle(
                  fontSize: 16,
                  color: AppColor.fifeColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
            ),
          ),
        ));
  }
}
