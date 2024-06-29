import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';

class NumberOfTourist extends StatelessWidget {
  const NumberOfTourist({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "who did you Travel with ?",
            style: MyTextStyle.normal.copyWith(fontSize: 25),
          ),
        ),
        SizedBox(height: 30),
        Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: AppColor.thirdColor,
                  borderRadius: BorderRadius.circular(18)),
            ),
            SizedBox(width: 20),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: AppColor.thirdColor,
                  borderRadius: BorderRadius.circular(18)),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: AppColor.thirdColor,
                  borderRadius: BorderRadius.circular(18)),
            ),
            SizedBox(width: 20),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: AppColor.thirdColor,
                  borderRadius: BorderRadius.circular(18)),
            ),
          ],
        ),
      ],
    ));
  }
}
