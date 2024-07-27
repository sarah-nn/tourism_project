import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/presentation/widget/Booking/card_previous_trip.dart';
import 'package:tourism_project/presentation/widget/Booking/card_upcoming_Trip.dart';

class TripBookPage extends StatefulWidget {
  const TripBookPage({super.key});

  @override
  State<TripBookPage> createState() => _TripBookPageState();
}

class _TripBookPageState extends State<TripBookPage> {
  bool upcoming = true;
  bool previous = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Trip',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    upcoming = true;
                    previous = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        AppColor.secondColor,
                        const Color(0xff6daffa),
                        const Color(0xff9ce3f8),
                      ]),
                      color:
                          upcoming ? AppColor.primaryColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),

                  //  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 23, right: 23, top: 15, bottom: 15),
                    child: Text(
                      'UPCOMING',
                      style: TextStyle(
                          color: upcoming ? Colors.white : Colors.black45,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    upcoming = false;
                    previous = true;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        AppColor.secondColor,
                        const Color(0xff6daffa),
                        const Color(0xff9ce3f8),
                      ]),
                      color:
                          previous ? AppColor.primaryColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  // elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 23, right: 23, top: 15, bottom: 15),
                    child: Text(
                      'PREVIOUS',
                      style: TextStyle(
                          color: previous ? Colors.white : Colors.black45,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: upcoming
                ? ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: CardUpcomingTrip(),
                      );
                    },
                  )
                : ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: CardPreviousTrip(),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
