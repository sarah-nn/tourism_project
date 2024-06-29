import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String textTitle;
  const CustomTextTitleAuth({super.key, required this.textTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: Text(textTitle,
          textAlign: TextAlign.center,
          style: MyTextStyle.headers
              .copyWith(fontWeight: FontWeight.w800, fontSize: 46)),
    );
  }
}
