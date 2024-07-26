import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/utils/global.dart';

class PlacesDynamicWidget extends StatefulWidget {
  const PlacesDynamicWidget({super.key});

  @override
  State<PlacesDynamicWidget> createState() => _PlacesDynamicWidgetState();
}

class _PlacesDynamicWidgetState extends State<PlacesDynamicWidget> {
  List<String>? places;

  void _navigateToPlacePage() async {
    final result = await context.push(AppRoutes.test2);

    if (result != null) {
      setState(() {
        places = result as List<String>?;
      });
    }
  }

  bool thereSelected = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: places == null
            ? Container(
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        "Navigate To Place Page ",
                        style: TextStyle(
                            color: AppColor.primaryColor, fontSize: 22),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _navigateToPlacePage();
                      },
                      child: Container(
                          height: 25,
                          width: 25,
                          child: Image.asset(AppImage.arrowForword)),
                    )
                  ],
                ),
              )
            : Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    color: const Color.fromARGB(255, 228, 228, 228),
                    width: double.maxFinite,
                    child: placeIds.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                " Places To Visit :",
                                style: MyTextStyle.splashLogoText.copyWith(
                                    fontSize: 17,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.normal),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ...List.generate(
                                  places!.length,
                                  (index) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "${index + 1}. ",
                                              style: MyTextStyle.splashLogoText
                                                  .copyWith(
                                                      fontSize: 16,
                                                      color: Colors.black87,
                                                      fontWeight:
                                                          FontWeight.normal),
                                            ),
                                            Text(
                                              places![index],
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      )))
                            ],
                          )
                        : Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.black))),
                            child: Text(
                              "No Places Selected",
                              style: MyTextStyle.normal.copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.5),
                            ),
                          ),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: AppColor.secondColor),
                      onPressed: _navigateToPlacePage,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              color: AppColor.primaryColor,
                            ),
                            Text("  add or remove Places",
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    // height: 2,
                                    fontSize: 18))
                          ],
                        ),
                      )),
                ],
              )
        // Expanded(
        //     child: Container(
        //       height: 100,
        //       child: ListView.builder(
        //           itemCount: location!.length,
        //           shrinkWrap: true,
        //           itemBuilder: (context, index) {
        // return Padding(
        //   padding: const EdgeInsets.symmetric(vertical: 0),
        //   child: Row(
        //     children: [
        //       Text(
        //         "$index.",
        //         style: MyTextStyle.splashLogoText.copyWith(
        //             fontSize: 16,
        //             color: Colors.black87,
        //             fontWeight: FontWeight.normal),
        //       ),
        //       Text(
        //         location![index],
        //         style: const TextStyle(fontSize: 15.5),
        //       ),
        //     ],
        //   ),
        // );
        //           }),
        //     ),
        //   ),
        );
    // : ListView.builder(
    //     itemCount: placeNames.length,
    //     shrinkWrap: true,
    //     itemBuilder: (context, index) {
    //       return Padding(
    //         padding: const EdgeInsets.symmetric(vertical: 0),
    //         child: Row(
    //           children: [
    //             Text(
    //               "$index.",
    //               style: MyTextStyle.splashLogoText.copyWith(
    //                   fontSize: 16,
    //                   color: Colors.black87,
    //                   fontWeight: FontWeight.normal),
    //             ),
    //             Text(
    //               placeNames[index],
    //               style: const TextStyle(fontSize: 15.5),
    //             ),
    //           ],
    //         ),
    //       );
    //     });
  }
}
