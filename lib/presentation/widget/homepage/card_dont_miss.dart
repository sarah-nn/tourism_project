import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/business_logic/static_trip/static_trip_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/attribute_details_static.dart';
import 'package:tourism_project/data/models/dont_miss_model.dart';

class CardDonntMiss extends StatefulWidget {
  CardDonntMiss({required this.dontMissModel, super.key});
  DontMissModel dontMissModel;
  @override
  State<CardDonntMiss> createState() => _CardDonntMissState();
}

class _CardDonntMissState extends State<CardDonntMiss> {
  Future<List<dynamic>>? imageList;
  List<dynamic> images = [];

  @override
  void initState() {
    super.initState();
    imageList = context
        .read<StaticTripCubit>()
        .getImagePlaces(widget.dontMissModel.idDestination.toString());
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: AppColor.primaryColor,
      onTap: () {
        GoRouter.of(context).push(
            '/StaticTripDetailsPage/${widget.dontMissModel.id}',
            extra: AttributeStaticDetails(
                tripId: widget.dontMissModel.id.toString(),
                imageList: images,
                enableBook: true));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 10,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          child: Container(
            decoration: BoxDecoration(
                color: light ? AppColor.secondColor : AppColor.secoundColorDark,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 0.6, color: AppColor.primaryColor)),
            height: 110,
            width: 210,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Container(
                  //   height: 120,
                  //   width: 200,
                  //   decoration:
                  //       BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  //   clipBehavior: Clip.antiAlias,
                  //   // height: 150,
                  //   // width: 170,
                  //   child: Image.asset(
                  //     AppImage.offers,
                  //     fit: BoxFit.fill,
                  //   ),
                  // ),

                  FutureBuilder(
                      future: imageList,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          images = snapshot.data!;
                          print("------------------------${snapshot.data}");
                          return Container(
                            height: 130,
                            width: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(EndPoint.imageBaseUrl +
                                        images[1]['image']),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20)),
                          );
                        } else {
                          return Container(
                              height: 130,
                              width: 200,
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: Colors.grey,
                              )));
                        }
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.dontMissModel.tripName,
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Philosopher',
                        color: AppColor.primaryColor),
                  ),
                  // Text('2024-5-6 ->  2024-12-33'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.dontMissModel.startDate,
                        style: TextStyle(
                            color: light ? Colors.black54 : Colors.white54),
                      ),
                      Icon(Icons.arrow_right_alt),
                      Text(
                        widget.dontMissModel.endDate,
                        style: TextStyle(
                            color: light ? Colors.black54 : Colors.white54),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
