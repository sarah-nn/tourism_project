import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';

class HotelDynamicTrip extends StatefulWidget {
  const HotelDynamicTrip({super.key});

  @override
  State<HotelDynamicTrip> createState() => _HotelDynamicTripState();
}

class _HotelDynamicTripState extends State<HotelDynamicTrip> {
  String selectedName = 'Hotel Name';
  List mylist = <String>[
    "Available Hotel 1",
    "Available Hotel 2",
    "Available Hotel 3"
  ];
  void _selectRestaurant(String restaurant) {
    setState(() {
      selectedName = restaurant;
    });

    Navigator.pop(context);
  }

  void openButtomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return ListView.builder(
          itemCount: mylist.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text(mylist[index]),
              onTap: () {
                _selectRestaurant(mylist[index]);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Do you need to book Hotel ?",
          style: TextStyle(fontSize: 17),
        ),
        const SizedBox(height: 17),
        Container(
          height: 50,
          width: 180,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: AppColor.thirdColor.withOpacity(0.45),
              borderRadius: const BorderRadius.all(Radius.circular(17))),
          child: Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Text(
              selectedName,
              style: TextStyle(
                  fontFamily: "normal",
                  color: Color.fromARGB(255, 146, 146, 146),
                  fontSize: 20),
            ),
          ),
        ),
        SizedBox(height: 15),
        Builder(builder: (context) {
          return InkWell(
            onTap: () {
              openButtomSheet(context);
            },
            child: Text(
              "show Hotel List",
              style: TextStyle(
                color: const Color.fromARGB(255, 26, 143, 240),
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
          );
        }),
        Row(children: []),
        Row(
          children: [],
        ),
        SizedBox(height: 20),
      ],
    );
    //  Column(
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     Text(
    //       "Do you need to book Hotel ?",
    //       style: TextStyle(fontSize: 17),
    //     ),
    //     SizedBox(height: 10),
    //     Container(
    //       width: 200,
    //       height: 40,
    //       child: Align(
    //         alignment: Alignment.centerLeft,
    //         child: Text(
    //           selectedName,
    //           style: TextStyle(
    //               fontSize: 16, color: Color.fromARGB(255, 110, 110, 110)),
    //         ),
    //       ),
    //       decoration: BoxDecoration(
    //         border: Border(
    //           left: BorderSide.none,
    //           right: BorderSide.none,
    //           top: BorderSide.none,
    //           bottom: BorderSide(color: AppColor.primaryColor, width: 2),
    //         ),
    //       ),
    //     ),
    //     SizedBox(height: 20),
    // Builder(builder: (context) {
    //   return InkWell(
    //     onTap: () {
    //       openButtomSheet(context);
    //     },
    //     child: Text(
    //       "show Hotel List",
    //       style: TextStyle(
    //         color: const Color.fromARGB(255, 26, 143, 240),
    //         fontSize: 15,
    //         decoration: TextDecoration.underline,
    //       ),
    //     ),
    //   );
    // })
    //   ],
    // );
  }
}
