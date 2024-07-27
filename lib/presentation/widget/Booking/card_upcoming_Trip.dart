import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tourism_project/core/utils/app_color.dart';

class CardUpcomingTrip extends StatelessWidget {
  const CardUpcomingTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.none,
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        shadowColor: Colors.grey,
        color: AppColor.secondColor,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
                const Row(
                  children: [
                    Text(
                      'Start : ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                    ),
                    Text(
                      ' Fri 10 Aug  11:15 Am ',
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      'End : ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54),
                    ),
                    Text(
                      ' sun 22 Aug  11:15 Am ',
                    ),
                  ],
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
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  thickness: 0.6,
                  color: Color.fromARGB(255, 168, 166, 166),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.people, color: Colors.grey),
                            Text('  4 person '),
                          ],
                        ),
                        Text(
                          'Edit',
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    const VerticalDivider(
                      thickness: 3.2,
                      width: 2,
                    ),
                    Column(
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Iconsax.moneys,
                              color: Colors.grey,
                            ),
                            Text('  1000\$  '),
                          ],
                        ),
                        Text(
                          'details price',
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.delete,
                      color: Colors.grey,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor.withAlpha(20),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1, color: AppColor.primaryColor)),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Cancel Book',
                          style: TextStyle(
                              color: Color.fromARGB(255, 211, 83, 74),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
