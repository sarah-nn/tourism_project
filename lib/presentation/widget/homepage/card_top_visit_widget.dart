import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/global.dart';

// ignore: must_be_immutable
class CardTopVisit extends StatelessWidget {
  CardTopVisit({super.key});
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: AppColor.primaryColor),
            color: light
                ? AppColor.primaryColor.withOpacity(0.3)
                : AppColor.secoundColorDark,
            borderRadius: BorderRadius.circular(10)),
        width: 170,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: (Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                clipBehavior: Clip.antiAlias,
                height: 150,
                width: 170,
                child: Image.asset(
                  AppImage.nearMe,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Landon", style: TextStyle()),
                  IconButton(
                    onPressed: () {
                      favorite = true;
                    },
                    icon: Icon(
                      Icons.favorite,
                    ),
                    color: Color(0xffe8928e),
                  )
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
