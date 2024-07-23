import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/data/models/all_static_trip_model.dart';

class StaticTripItem extends StatelessWidget {
  const StaticTripItem(
      {super.key,
      required this.location,
      required this.price,
      required this.index,
      required this.tripmodel,
      required this.isSearch});

  final String location;
  final String price;
  final int index;
  final AllStaticTripModel tripmodel;
  final bool isSearch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Container(
        padding: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSearch
              ? const Color.fromARGB(255, 224, 236, 240)
              : Colors.white,
          border: Border.all(width: 0.5),
          // const Color.fromARGB(255, 158, 209, 250),
        ),
        //  height: 250,
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
                tripmodel.newPrice == null ? Container() : offers()
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  //locationRow(location),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(" ${tripmodel.tripName!}",
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 21)),
                      Container(
                        padding: const EdgeInsets.only(right: 25),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text("(${tripmodel.stars})")
                          ],
                        ),
                      )
                    ],
                  ),
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

Widget offers() {
  return Positioned(
      bottom: 8,
      right: 8,
      child: Container(
        height: 50,
        width: 75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Color.fromARGB(255, 231, 82, 72).withOpacity(0.8)),
        child: Container(
          alignment: Alignment.center,
          height: 40,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              border: Border.all(color: Colors.white)),
          child: Center(
              child: Text(
            "Offer",
            style: MyTextStyle.Pacifico.copyWith(
                fontSize: 17, color: Colors.white),
          )),
        ),
      ));
}

const List<String> images = [
  AppImage.tajMahal,
  AppImage.two,
  AppImage.onboarding1,
  AppImage.offers,
  AppImage.hotel,
  AppImage.starting2
];
