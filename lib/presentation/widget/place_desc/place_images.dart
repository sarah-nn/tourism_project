import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/functions/functions.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Gallery", style: MyTextStyle.headers.copyWith(fontSize: 22)),
          SizedBox(height: 15),
          SizedBox(
            height: 80,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return index == 3
                    ? InkWell(
                        onTap: () {
                          goRoute(context, AppRoutes.imagesview);
                        },
                        child: Stack(
                          children: [
                            Container(
                                height: 100,
                                width: 90,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    AppImage.two,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10)),
                              height: 100,
                              width: 90,
                            ),
                            const Positioned(
                              top: 29,
                              left: 27,
                              child: Text(
                                "10 +",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      )
                    : Container(
                        height: 100,
                        width: 90,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            AppImage.offers,
                            fit: BoxFit.cover,
                          ),
                        ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
