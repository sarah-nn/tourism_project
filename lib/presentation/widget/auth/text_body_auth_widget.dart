import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String textBody;
  const CustomTextBodyAuth({super.key, required this.textBody});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(textBody,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18,
              height: 1.5,
              color: Color.fromARGB(255, 34, 34, 34))),
    );
  }
}
