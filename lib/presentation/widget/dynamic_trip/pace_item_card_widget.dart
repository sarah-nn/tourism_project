import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';

class PlaceItemCard extends StatelessWidget {
  final Map<String, dynamic> place;
  final bool isSelected;
  final ValueChanged<Map<String, dynamic>> onSelectedCountry;
  const PlaceItemCard(
      {super.key,
      required this.place,
      required this.isSelected,
      required this.onSelectedCountry});

  @override
  Widget build(BuildContext context) {
    final selectColor = isSelected ? Color.fromARGB(255, 230, 230, 230) : null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(
            color: isSelected
                ? AppColor.thirdColor
                : const Color.fromARGB(255, 226, 226, 226),
            width: 2.0,
          ),
        ),
        color: selectColor,
        elevation: 1.5,
        child: InkWell(
          onTap: () {
            onSelectedCountry(place);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 97,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Card(
                        elevation: 8,
                        child: Image.asset(
                          AppImage.onboarding1,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(width: 18),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 3),
                        Text(
                          place['placeName'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Text("Location : ${place['areaName']}"),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '\$ ${place['place_price']}',
                      style: TextStyle(color: Colors.green),
                    ),
                    isSelected
                        ? Container(
                            padding: const EdgeInsets.all(2.5),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.primaryColor),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.check,
                                color: AppColor.primaryColor, size: 26))
                        : Container()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
