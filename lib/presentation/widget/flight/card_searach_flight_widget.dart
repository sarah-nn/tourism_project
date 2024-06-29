import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';

class WidgetSearchFlight extends StatelessWidget {
  const WidgetSearchFlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.secondColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("name plane : ABC"),
              const Text("name airpot : dimashq"),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'CDG',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text("syria"),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'FLR',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text("Dubai"),
                    ],
                  )
                ],
              ),
              Center(
                child: Image.asset(
                  AppImage.dottedRoute,
                  width: double.infinity,
                  color: AppColor.primaryColor,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Depart',
                        style: TextStyle(
                            color: Color(0xFF6DC2E7),
                            fontWeight: FontWeight.bold),
                      ),
                      Text('11 April'),
                      Text('11:45 AM',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Arrive',
                        style: TextStyle(
                            color: Color(0xFF6DC2E7),
                            fontWeight: FontWeight.bold),
                      ),
                      Text('11 April'),
                      Text('2:45 PM',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              const Row(
                children: [
                  Text("The cost :"),
                  Text(
                    '1,400',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
