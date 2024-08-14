import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/static_trip_details_model.dart';

class StaticPlaceWidget extends StatelessWidget {
  final StaticDetailsModel tripModel;
  const StaticPlaceWidget({super.key, required this.tripModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color:
              light ? AppColor.staticTripContainer : AppColor.secoundColorDark,
          border: const Border(
            left: BorderSide(width: 5, color: Color.fromARGB(255, 26, 73, 112)),
          ),
        ),
        child: Column(
          children: [
            Text(
              "Enjoy this place in your Trip",
              style: MyTextStyle.poppins.copyWith(
                  fontSize: 19.5,
                  color: light
                      ? const Color.fromARGB(255, 26, 73, 112)
                      : Colors.white),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: ListView.builder(
                  itemCount: tripModel.places!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${index + 1}.",
                                style: MyTextStyle.splashLogoText.copyWith(
                                    fontSize: 16,
                                    color: light ? Colors.black87 : Colors.blue,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                " ${tripModel.places![index].name} ",
                                style: const TextStyle(fontSize: 15.5),
                              ),
                            ],
                          ),
                          TextButton(
                              onPressed: () {
                                GoRouter.of(context).push(
                                    '/PlaceDesPage/${tripModel.places![index].id}');
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(bottom: 6),
                                child: Text(
                                  "...",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23),
                                ),
                              ))
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
