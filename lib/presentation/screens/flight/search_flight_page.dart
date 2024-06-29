import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/presentation/widget/flight/card_searach_flight_widget.dart';

class SearchFlightPage extends StatelessWidget {
  const SearchFlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        title: Text('Select Flight'),
        elevation: 0,
        // title:const Text(
        //   'Select flight',
        // ),
      ),
      backgroundColor: AppColor.primaryColor,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Stack(children: [
                Image.asset(
                  AppImage.map,
                  color: Color(0xffb6daee),
                ),
              ]),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        "10 Flight Avilable",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return WidgetSearchFlight();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
