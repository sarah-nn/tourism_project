import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/place_desc_model.dart';

class ImageViewPage extends StatelessWidget {
  final List<Images> images;
  const ImageViewPage({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            light ? AppColor.primaryColor : AppColor.primaryColorDark,
        title: Text(
          "Place Images",
          style: MyTextStyle.headers.copyWith(
            color: Colors.white,
            fontSize: 28.5,
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Find out this place by it's image",
                  style: MyTextStyle.normal.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: light ? Colors.black : Colors.white60),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: StaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      ...List.generate(
                          images.length,
                          (index) => StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: (index % 2 == 0) ? 3 : 2,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                      image: NetworkImage(
                                          EndPoint.imageBaseUrl +
                                              images[index].image!),
                                      fit: BoxFit.cover,
                                    )),
                              ))
                    ]

                    //  [
                    //   StaggeredGridTile.count(
                    //       crossAxisCellCount: 2,
                    //       mainAxisCellCount: 2,
                    //       child: ClipRRect(
                    //         borderRadius: BorderRadius.circular(10),
                    //         child: Image.asset(
                    //           AppImage.hotel,
                    //           fit: BoxFit.cover,
                    //         ),
                    //       )),
                    //   StaggeredGridTile.count(
                    //       crossAxisCellCount: 2,
                    //       mainAxisCellCount: 4,
                    //       child: ClipRRect(
                    //         borderRadius: BorderRadius.circular(10),
                    //         child: Image.asset(
                    //           AppImage.starting,
                    //           fit: BoxFit.cover,
                    //         ),
                    //       )),
                    //   StaggeredGridTile.count(
                    //       crossAxisCellCount: 2,
                    //       mainAxisCellCount: 3,
                    //       child: ClipRRect(
                    //         borderRadius: BorderRadius.circular(10),
                    //         child: Image.asset(
                    //           AppImage.tajMahal,
                    //           fit: BoxFit.cover,
                    //         ),
                    //       )),
                    //   StaggeredGridTile.count(
                    //       crossAxisCellCount: 2,
                    //       mainAxisCellCount: 3,
                    //       child: ClipRRect(
                    //         borderRadius: BorderRadius.circular(10),
                    //         child: Image.asset(
                    //           AppImage.two,
                    //           fit: BoxFit.cover,
                    //         ),
                    //       )),
                    //   StaggeredGridTile.count(
                    //       crossAxisCellCount: 2,
                    //       mainAxisCellCount: 4,
                    //       child: ClipRRect(
                    //         borderRadius: BorderRadius.circular(10),
                    //         child: Image.asset(
                    //           AppImage.onboarding1,
                    //           fit: BoxFit.cover,
                    //         ),
                    //       )),
                    //   StaggeredGridTile.count(
                    //       crossAxisCellCount: 2,
                    //       mainAxisCellCount: 4,
                    //       child: ClipRRect(
                    //         borderRadius: BorderRadius.circular(10),
                    //         child: Image.asset(
                    //           AppImage.nearMe,
                    //           fit: BoxFit.cover,
                    //         ),
                    //       )),
                    //   StaggeredGridTile.count(
                    //       crossAxisCellCount: 2,
                    //       mainAxisCellCount: 3,
                    //       child: ClipRRect(
                    //         borderRadius: BorderRadius.circular(10),
                    //         child: Image.asset(
                    //           AppImage.offers,
                    //           fit: BoxFit.cover,
                    //         ),
                    //       )),
                    //   StaggeredGridTile.count(
                    //       crossAxisCellCount: 2,
                    //       mainAxisCellCount: 3,
                    //       child: ClipRRect(
                    //         borderRadius: BorderRadius.circular(10),
                    //         child: Image.asset(
                    //           AppImage.one,
                    //           fit: BoxFit.cover,
                    //         ),
                    //       )),
                    //   StaggeredGridTile.count(
                    //       crossAxisCellCount: 2,
                    //       mainAxisCellCount: 4,
                    //       child: ClipRRect(
                    //         borderRadius: BorderRadius.circular(10),
                    //         child: Image.asset(
                    //           AppImage.nearMe,
                    //           fit: BoxFit.cover,
                    //         ),
                    //       ))
                    // ],
                    ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
