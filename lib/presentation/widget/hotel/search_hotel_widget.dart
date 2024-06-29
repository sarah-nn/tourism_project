import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/presentation/screens/hotel/hotel_details_page.dart';

class WidgetSearchHotel extends StatelessWidget {
  WidgetSearchHotel({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return InfoBookingHotelPage();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Container(
          height: 190,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.secondColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Image.asset(
                    AppImage.hotel,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hotel Al Manar",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Iconsax.location,
                        color: AppColor.primaryColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Syria , Aleppo",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 144, 142, 142)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      Icon(Icons.star,
                          color: Color.fromARGB(255, 248, 209, 66)),
                      Icon(Icons.star),
                      Icon(Icons.star)
                    ],
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
