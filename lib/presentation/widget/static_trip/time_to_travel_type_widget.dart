import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';

class TimeToTravelTyping extends StatelessWidget {
  const TimeToTravelTyping({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Text(
                "It's Time",
                style: MyTextStyle.normal
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                " to Have your Nice",
                style: MyTextStyle.normal.copyWith(fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Trip with only .... ",
                style: MyTextStyle.normal.copyWith(fontSize: 20),
              ),
              Text(
                "One Click !",
                style: MyTextStyle.normal.copyWith(
                  fontSize: 22,
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
