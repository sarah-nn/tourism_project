// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:tourism_project/core/utils/app_color.dart';
// import 'package:tourism_project/core/utils/app_images.dart';
// import 'package:tourism_project/presentation/widget/place_desc/place_name_price.dart';

// class ProductItemScreen extends StatelessWidget {
//   const ProductItemScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: Stack(
//         children: [
//           //! this is not exactly responsse
//           Container(
//             height: MediaQuery.of(context).size.height / 2.7,
//             color: AppColor.IconAdd,
//           ),
//           buttonArrow(context),
//           scroll(),
//         ],
//       ),
//     ));
//   }



//   scroll() {
//     return DraggableScrollableSheet(
//         initialChildSize: 0.65,
//         maxChildSize: 1.0,
//         minChildSize: 0.65,
//         builder: (context, scrollController) {
//           return Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             clipBehavior: Clip.hardEdge,
//             decoration: const BoxDecoration(
//               color: Colors.amber,
//               borderRadius: BorderRadius.only(
//                   topLeft: const Radius.circular(20),
//                   topRight: const Radius.circular(20)),
//             ),
//             child: SingleChildScrollView(
//               controller: scrollController,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                    SizedBox(
//                                     child: NameAndPrice(
//                                         placeName: state.placeDescModel.name!,
//                                         price:
//                                             state.placeDescModel.placePrice!),
//                                   ),
//                                   SizedBox(
//                                     child: LocationAndCategory(
//                                         country: state.placeDescModel.area!
//                                             .country!.name!,
//                                         //  state
//                                         //     .placeDescModel.area.country.name,
//                                         // area: state.placeDescModel.area.name,
//                                         area: state.placeDescModel.area!.name!,
//                                         category: state
//                                             .placeDescModel.categories!
//                                             .map((e) => e.name.toString())),
//                                   ),
//                                   const SizedBox(height: 50),
//                                   SizedBox(
//                                     child: DescriptionAndOverview(
//                                       placeId:
//                                           state.placeDescModel.id.toString(),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 20),
//                                   SizedBox(
//                                     child: PlaceDescText(
//                                       maxWords: 22,
//                                       text: state.placeDescModel.text!,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 23),
//                                   const Gallery(),
//                                   const SizedBox(height: 30),
//                                   Container(
//                                     height: 100,
//                                     alignment: Alignment.center,
//                                     decoration:
//                                         BoxDecoration(border: Border.all()),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         Text("View On Map"),
//                                         Icon(Icons.map_outlined)
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(height: 30),
//                                   Container(
//                                     height: 200,
//                                     child: Text("data"),
//                                     color: Colors.amber,
//                                   )
//                                 ]
//                 ]
//               ),
//             ),
//           );
//         });
//   }

 
// }
