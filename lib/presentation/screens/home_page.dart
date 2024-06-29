import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/presentation/widget/homepage/card_category_widget.dart';
import 'package:tourism_project/presentation/widget/homepage/card_top_visit_widget.dart';
import 'package:tourism_project/presentation/widget/homepage/drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black, size: 30),
      ),
      drawer: const WidgetDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Discover",
                      style: MyTextStyle.bright.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 38,
                          letterSpacing: 1)
                      //TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                  IconButton(
                    icon: Icon(
                      Icons.notifications_active,
                      color: AppColor.primaryColor,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              Text("The world...",
                  style: MyTextStyle.poppins
                      .copyWith(fontWeight: FontWeight.w100, fontSize: 20)
                  //TextStyle(fontSize: 18),
                  ),
              const SizedBox(height: 10),

              /******** SEARCH ********/
              GestureDetector(
                onTap: () {
                  goRoute(context, AppRoutes.searchCountryPage);
                },
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: Icon(Iconsax.search_favorite,
                        color: AppColor.primaryColor),
                    title: const Text(
                      'Find Country or Area',
                      style: TextStyle(color: Colors.black26),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              /***** SLIDER OFFERS *****/
              Text(
                "1".tr,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.thirdColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                    child: Image.asset(
                      AppImage.two,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Positioned(
                    top: 150,
                    left: 20,
                    child: Text(
                      "discount 50%",
                      style: TextStyle(
                          color: Color(0xFFB1B5C2),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),

              /***** CATEGORIES *****/
              const Text(
                "Services",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CardCategouries(
                        path: AppRoutes.flightPage,
                        image: AppIcon.plan,
                        nameCategory: "flight"),
                    const SizedBox(width: 20),
                    CardCategouries(
                        path: AppRoutes.staticTrip,
                        image: AppIcon.trip,
                        nameCategory: "trip"),
                    const SizedBox(width: 20),
                    CardCategouries(
                        path: AppRoutes.hotelPage,
                        image: AppIcon.hotel,
                        nameCategory: "hotel"),
                    const SizedBox(width: 20),
                    CardCategouries(
                        // path: AppRoutes.places,
                        path: AppRoutes.test,
                        image: AppIcon.plan,
                        nameCategory: "Inspire"),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              /***** TOP VISIT *****/
              const Text(
                "Near You",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return CardTopVisit();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
