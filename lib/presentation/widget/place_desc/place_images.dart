import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/data/models/place_desc_model.dart';

class Gallery extends StatelessWidget {
  final List<Images> imageList;
  const Gallery({super.key, required this.imageList});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      imageList[0].image!,
      // imageList[1].image!,
      //  imageList[2].image!,
    ];

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
              itemCount: imageList.length > 4 ? 4 : imageList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return index ==
                        (imageList.length > 4 ? 3 : imageList.length - 1)
                    ? InkWell(
                        onTap: () {
                          GoRouter.of(context)
                              .push(AppRoutes.imagesview, extra: imageList);
                        },
                        child: Stack(
                          children: [
                            Container(
                                height: 100,
                                width: 90,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                      image: NetworkImage(
                                          EndPoint.imageBaseUrl +
                                              imageList[index].image!),
                                      fit: BoxFit.cover,
                                    ))),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10)),
                              height: 100,
                              width: 90,
                            ),
                            Positioned(
                              top: 29,
                              left: 27,
                              child: Text(
                                imageList.length > 4
                                    ? "${imageList.length - 3} +"
                                    : "view",
                                style: const TextStyle(
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
                          child: Image(
                            image: NetworkImage(EndPoint.imageBaseUrl +
                                (imageList[index].image!)),
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
