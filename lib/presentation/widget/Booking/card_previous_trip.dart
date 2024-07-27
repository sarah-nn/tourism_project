import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';

class CardPreviousTrip extends StatelessWidget {
  const CardPreviousTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.none,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      shadowColor: const Color.fromARGB(255, 153, 203, 243),
      color: AppColor.secondColor,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.5, color: AppColor.primaryColor)),
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Paris Evel',
                  style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 19),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Start : Fri 10 Aug  11:15 Am \nEnd: Sun 23 Aug 7:00 Am',
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),
                    Text(
                      '  France , Paris',
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  'show more details ...',
                  softWrap: true,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor),
                ),
              ],
            )),
      ),
    );
  }
}
