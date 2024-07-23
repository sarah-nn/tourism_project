import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/data/models/static_trip_details_model.dart';

class StaticHotelWidget extends StatelessWidget {
  final StaticDetailsModel tripModel;
  const StaticHotelWidget({super.key, required this.tripModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.staticTripContainer,
          border: Border(
            left: BorderSide(width: 5, color: AppColor.primaryColor),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Hotel Booking Included ",
                  style: MyTextStyle.poppins.copyWith(
                      fontSize: 19,
                      color: const Color.fromARGB(255, 26, 73, 112)),
                ),
                const Icon(
                  Icons.check,
                  color: Color.fromARGB(255, 26, 73, 112),
                )
              ],
            ),
            const SizedBox(height: 8),
            towText(tripModel.hotel!.name!,
                tripModel.staticTrip!.tripCapacity!.toString())
          ],
        ),
      ),
    );
  }

  Widget towText(name, capacity) {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "Name : ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.5),
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Text(
              "Room Capacity : ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.5),
            ),
            Text(
              capacity,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        )
      ],
    );
  }
}
