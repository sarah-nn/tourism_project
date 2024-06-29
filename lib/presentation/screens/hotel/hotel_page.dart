import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/presentation/screens/hotel/search_hotel_page.dart';
import 'package:tourism_project/presentation/widget/hotel/custom_elevated_buttom.dart';
import 'package:tourism_project/presentation/widget/hotel/listtile_complete.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            flex: 5,
            child: Stack(children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(90),
                  ),
                ),
                child: Image.asset(
                  AppImage.hotel,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const Positioned(
                top: 410,
                left: 22,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Book Your',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 29),
                    ),
                    Text(
                      'Hotel',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 29),
                    ),
                  ],
                ),
              ),
            ])),
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    " Destination : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  WidgetListTileComplete(
                    enableIcon: false,
                    enableCenterText: false,
                    text: "enter the area ",
                    selected: false,
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  WidgetElevatedButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const SearchHotelPage();
                          },
                        ),
                      );
                    },
                    text: 'Search Hotel',
                    height: 55,
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
