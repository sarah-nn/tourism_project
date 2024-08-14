import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/data/models/top_visited_model.dart';

class TopVisitedSlider extends StatefulWidget {
  TopVisitedSlider({required this.topVisitedModel, super.key});
  final TopVisitedModel? topVisitedModel;
  @override
  State<TopVisitedSlider> createState() => _TopVisitedSliderState();
}

class _TopVisitedSliderState extends State<TopVisitedSlider> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push('/PlaceDesPage/${widget.topVisitedModel?.id}');
      },
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(EndPoint.imageBaseUrl +
                    widget.topVisitedModel!.images![1].image!),
                fit: BoxFit.fill,
              ),
              color: AppColor.thirdColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            // child: Image.asset(
            //   AppImage.two,
            //   fit: BoxFit.fill,
            // ),
          ),
          Positioned(
              top: 140,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.topVisitedModel?.name}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Philosopher'),
                  ),
                  Row(
                    children: [
                      Icon(
                        Iconsax.location,
                        color: Color.fromARGB(255, 53, 159, 245),
                      ),
                      Text(
                        '${widget.topVisitedModel?.area?.country?.name} , ${widget.topVisitedModel?.area?.name}',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
