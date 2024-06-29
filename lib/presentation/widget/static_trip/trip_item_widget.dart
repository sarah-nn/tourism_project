import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/data/models/all_static_trip_model.dart';
import 'package:tourism_project/presentation/widget/starting_page/forsted_glassbox_widget.dart';

class StaticTripItem extends StatelessWidget {
  const StaticTripItem(
      {super.key,
      required this.location,
      required this.price,
      required this.index,
      required this.tripmodel});

  final String location;
  final String price;
  final int index;
  final AllStaticTripModel tripmodel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white,
          border: Border.all(width: 0.5),
          // const Color.fromARGB(255, 158, 209, 250),
        ),
        height: 250,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Stack(children: [
                Container(
                  height: 162,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            images[index],
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                ),
                Positioned(
                    bottom: 0,
                    child: ForstedGlassBox(
                        blur: 5.0,
                        isBorder: false,
                        theWidth: MediaQuery.of(context).size.width - 42,
                        theHeight: 40,
                        theChild: Text(
                          tripmodel.tripName!,
                          //  "Taj Mahal",
                          style: MyTextStyle.headers.copyWith(
                              letterSpacing: 0.9,
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: const Color.fromARGB(255, 59, 59, 59)),
                        )))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  locationRow(location),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: priceRow(tripmodel.price),
                      ),
                      viewDetails(context)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget viewDetails(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //goRoute(context, AppRoutes.staticTripdetails);
        GoRouter.of(context).push('/StaticTripDetailsPage/${tripmodel.id}');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17),
        child: Container(
          height: 28,
          //  width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: AppColor.primaryColor)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "details..",
              style: TextStyle(
                  letterSpacing: 1,
                  color: AppColor.primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

Widget locationRow(String location) {
  return Row(
    children: [
      Icon(
        Icons.location_on,
        color: AppColor.primaryColor,
        size: 20.5,
      ),
      Text(
        location,
        style: TextStyle(fontSize: 17, color: Colors.black54),
      ),
    ],
  );
}

Widget priceRow(price) {
  return Padding(
    padding: const EdgeInsets.only(left: 5),
    child: Row(
      children: [
        Text(
          "\$",
          style: MyTextStyle.poppins
              .copyWith(fontSize: 17, color: AppColor.primaryColor),
        ),
        Text(
          " $price",
          style: MyTextStyle.Audiowide.copyWith(
              fontSize: 14, color: AppColor.primaryColor),
        ),
        const Text(
          " per person",
          style: TextStyle(fontSize: 17, color: Colors.black54),
        )
      ],
    ),
  );
}

const List<String> images = [
  AppImage.tajMahal,
  AppImage.two,
  AppImage.onboarding1,
  AppImage.offers,
];
