import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/static_trip_details_model.dart';

class StaticActivityWidget extends StatelessWidget {
  final StaticDetailsModel tripModel;
  const StaticActivityWidget({super.key, required this.tripModel});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Activities",
              style: MyTextStyle.poppins.copyWith(
                  fontSize: 19.5,
                  color: light
                      ? const Color.fromARGB(255, 26, 73, 112)
                      : Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: tripModel.activities!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3.8,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 13),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: light
                            ? AppColor.thirdColor.withOpacity(0.25)
                            : Colors.white38,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                        child: Text(tripModel.activities![index].name!,
                            style: MyTextStyle.normal.copyWith(
                                fontSize: 26,
                                color: light ? null : Colors.white70)),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
