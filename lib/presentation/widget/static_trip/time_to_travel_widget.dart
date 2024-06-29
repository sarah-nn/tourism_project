import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/presentation/widget/static_trip/time_to_travel_type_widget.dart';

class TimeToTravel extends StatelessWidget {
  const TimeToTravel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        //   padding: const EdgeInsets.only(left: 5),
        height: MediaQuery.of(context).size.height / 9,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Colors.blue, Color.fromARGB(255, 240, 233, 172)]),
            color: AppColor.thirdColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            Image.asset(
              AppImage.time_to_travel_1,
              height: 210,
              fit: BoxFit.cover,
            ),
            TimeToTravelTyping()
          ],
        ),
      ),
    );
  }
}
