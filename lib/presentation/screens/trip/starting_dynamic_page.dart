import 'package:flutter/material.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';

class StartingDaynamicPage extends StatelessWidget {
  const StartingDaynamicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 50,
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.primaryColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18)))),
      body: ListView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.secondColor.withOpacity(0.3),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 50,
                          color: AppColor.secondColor.withOpacity(0.35),
                          spreadRadius: 20,
                        ),
                      ]),
                  child: Lottie.asset(AppImage.startDynamicPage,
                      height: 280, width: 280, fit: BoxFit.cover)),
            ),
            const SizedBox(
              height: 30,
            ),
            // MaterialButton(
            //   onPressed: () {
            //     goRoute(context, AppRoutes.dynamicTrip);
            //   },
            //   child: Text("data"),
            // ),
            Text(
              "Make Dynamic Trip",
              style: MyTextStyle.Pacifico.copyWith(
                  fontSize: 35, color: AppColor.primaryColor),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 20, right: 12),
              child: Text(
                "Follow the Steps , Fill the Requierd Data and Customize your Choice as Your Needed to Make Suitable Ideal Trip .",
                style: MyTextStyle.normal.copyWith(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.3,
                    color: Colors.black54),
              ),
            ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: MaterialButton(
                elevation: 20,
                minWidth: double.maxFinite,
                onPressed: () {
                  goRoute(context, AppRoutes.dynamicTrip);
                },
                color: AppColor.primaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Start Now",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
