// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
// import 'package:tourism_project/core/utils/app_images.dart';
// import 'package:tourism_project/core/utils/global.dart';
// import 'package:tourism_project/data/models/places_depend_on_category_model.dart';
// import 'package:tourism_project/data/models/places_model.dart';

// class PlaceItem extends StatelessWidget {
//   final Place? place;
//   final PlaceDependOnCategoryModel? placeCat;
//   const PlaceItem({
//     super.key,
//     @required this.place,
//     @required this.placeCat,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
//       child: Card(
//         elevation: 1.5,
//         child: InkWell(
//           onTap: () {
//             GoRouter.of(context).push(
//                 '/PlaceDesPage/${place != null ? place!.id : placeCat!.id}');
//           },
//           child: Container(
//             padding: const EdgeInsets.all(10),
//             height: 100,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       height: 100,
//                       width: 97,
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Card(
//                         elevation: 8,
//                         child: Image.asset(
//                           AppImage.onboarding1,

//                           // height: 95,
//                           // width: 95,
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 18),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(height: 3),
//                         Text(
//                           place != null ? place!.name : placeCat!.name,
//                           style: const TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 18),
//                         ),
//                         const SizedBox(height: 5),
//                         Text(
//                             "${place != null ? place!.area.country.name : placeCat!.area.country.name} , ${place != null ? place!.area.name : placeCat!.area.name}"),
//                         const SizedBox(height: 7),
//                         Expanded(
//                           child: Row(
//                             children: [
//                               ...List.generate(
//                                   3,
//                                   (index) => const Icon(
//                                         Icons.star,
//                                         color: Colors.amber,
//                                         size: 19,
//                                       )),
//                               ...List.generate(
//                                   2,
//                                   (index) => const Icon(
//                                         Icons.star,
//                                         size: 19,
//                                         color: Colors.grey,
//                                       )),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/end_point.dart';
import 'package:tourism_project/data/models/places_depend_on_category_model.dart';
import 'package:tourism_project/data/models/places_model.dart';

class PlaceItem extends StatelessWidget {
  final Place? place;
  final PlaceDependOnCategoryModel? placeCat;
  const PlaceItem({super.key, @required this.place, @required this.placeCat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      child: Card(
        //  color: place != null ? Colors.blue[50] : Colors.pink[80],
        elevation: 1.5,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: 97,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Card(
                            elevation: 8,
                            child: Image(
                              image: NetworkImage(EndPoint.imageBaseUrl +
                                  (place != null
                                      ? place!.images![1].image!
                                      : placeCat!.images![0].image!)),
                              fit: BoxFit.cover,
                            )),
                      ),
                      const SizedBox(width: 18),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 3),
                          Text(
                            place != null ? place!.name! : placeCat!.name!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          const SizedBox(height: 5),
                          Text(
                              "${place != null ? place!.area!.country!.name! : placeCat!.area!.country!.name} , ${place != null ? place!.area!.name : placeCat!.area!.name}"),
                          const SizedBox(height: 7),
                          // Expanded(
                          //   child: Row(
                          //     children: [
                          //       ...List.generate(
                          //           3,
                          //           (index) => const Icon(
                          //                 Icons.star,
                          //                 color: Colors.amber,
                          //                 size: 19,
                          //               )),
                          //       ...List.generate(
                          //           2,
                          //           (index) => const Icon(
                          //                 Icons.star,
                          //                 size: 19,
                          //                 color: Colors.grey,
                          //               )),
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.favorite_outline_outlined,
                      color: Color.fromARGB(255, 224, 95, 86),
                    ),
                    IconButton(
                        onPressed: () {
                          GoRouter.of(context).push(
                              '/PlaceDesPage/${place != null ? place!.id : placeCat!.id}');
                        },
                        icon: Icon(
                          Icons.more_horiz,
                          color: AppColor.primaryColor,
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
