import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/hotel/room_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/info_user.dart';
import 'package:tourism_project/data/models/room_model.dart';
import 'package:tourism_project/presentation/widget/hotel/custom_elevated_buttom.dart';
import 'package:tourism_project/presentation/widget/hotel/info_book_room_widget.dart';

// ignore: must_be_immutable
class InfoBookingHotelPage extends StatefulWidget {
  InfoBookingHotelPage({
    super.key,
    // ignore: non_constant_identifier_names
    required this.HotelId,
  });
  // ignore: non_constant_identifier_names
  String HotelId;
  @override
  State<InfoBookingHotelPage> createState() => _InfoBookingHotelPageState();
}

class _InfoBookingHotelPageState extends State<InfoBookingHotelPage> {
  int numTowCapacity = 0;
  int numFourCapacity = 0;
  int numSixCapacity = 0;
  int priceTowCapacity = 100;
  int priceFourCapacity = 300;
  int priceSixCapacity = 400;
  int numDay = 0;
  int total = 0;
  late RoomModel roomModel;
  @override
  void initState() {
    super.initState();
    context.read<RoomCubit>().getRooms(
        hotelId: widget.HotelId,
        start: User.dateStatrtHotel,
        end: User.dateEndHotel);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RoomCubit, RoomState>(listener: (context, state) {
      if (state is RoomSuccess) {
        roomModel = (state).roomModel;
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("state.success")));
      }
      if (state is RoomFailure) {
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text("state.fauil")));
        showAlertDialog(context, state.errMessage);
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          elevation: 0,
        ),
        body: Column(children: [
          const Expanded(
              flex: 1,
              child: Center(
                  child: Text(
                'Enter information to booking :',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ))),
          Expanded(
            flex: 10,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(45),
                  topLeft: Radius.circular(45),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: state is RoomSuccess
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              const Text(
                                'Select number room :',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // fontFamily: 'normal',
                                    fontSize: 18),
                              ),
                              WidgetInfoBookRoom(
                                num: 'Tow',
                                price: '${roomModel.data?.capacity2?.price}',
                                numCapacity: numTowCapacity,
                                onTapAdd: numTowCapacity !=
                                        (roomModel.data?.capacity2!.count)!
                                            .toInt()
                                    ? () {
                                        setState(() {
                                          numTowCapacity++;
                                        });
                                      }
                                    : null,
                                onTapMinus: numTowCapacity > 0
                                    ? () {
                                        setState(() {
                                          numTowCapacity--;
                                        });
                                      }
                                    : null,
                                colorAdd: numTowCapacity <
                                        (roomModel.data?.capacity2!.count)!
                                            .toInt()
                                    ? AppColor.IconAdd
                                    : AppColor.IconMinus,
                                colorMinus: numTowCapacity == 0
                                    ? AppColor.IconMinus
                                    : AppColor.IconAdd,
                              ),
                              WidgetInfoBookRoom(
                                num: 'Four',
                                price: '${roomModel.data?.capacity4?.price}',
                                numCapacity: numFourCapacity,
                                onTapAdd: numFourCapacity !=
                                        (roomModel.data?.capacity4!.count)!
                                            .toInt()
                                    ? () {
                                        setState(() {
                                          numFourCapacity++;
                                        });
                                      }
                                    : null,
                                onTapMinus: numFourCapacity > 0
                                    ? () {
                                        setState(() {
                                          numFourCapacity--;
                                        });
                                      }
                                    : null,
                                colorAdd: numFourCapacity <
                                        (roomModel.data?.capacity4!.count)!
                                            .toInt()
                                    ? AppColor.IconAdd
                                    : AppColor.IconMinus,

                                // AppColor.IconAdd,
                                colorMinus: numFourCapacity == 0
                                    ? AppColor.IconMinus
                                    : AppColor.IconAdd,
                              ),
                              WidgetInfoBookRoom(
                                num: 'Six',
                                numCapacity: numSixCapacity,
                                price: '${roomModel.data?.capacity6?.price}',
                                onTapAdd: numSixCapacity !=
                                        (roomModel.data?.capacity6!.count)!
                                            .toInt()
                                    ? () {
                                        setState(() {
                                          numSixCapacity++;
                                        });
                                      }
                                    : null,
                                onTapMinus: numSixCapacity > 0
                                    ? () {
                                        setState(() {
                                          numSixCapacity--;
                                        });
                                      }
                                    : null,
                                colorAdd: numSixCapacity <
                                        (roomModel.data?.capacity6!.count)!
                                            .toInt()
                                    ? AppColor.IconAdd
                                    : AppColor.IconMinus,
                                colorMinus: numSixCapacity == 0
                                    ? AppColor.IconMinus
                                    : AppColor.IconAdd,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              // Row(
                              //   children: [
                              //     const Text(
                              //       'Select number day :',
                              //       style:
                              //           TextStyle(fontWeight: FontWeight.bold),
                              //     ),
                              //     const SizedBox(
                              //       width: 10,
                              //     ),
                              //     WidgetAddAndMinus(
                              //       onTap: numDay > 0
                              //           ? () {
                              //               setState(() {
                              //                 numDay--;
                              //               });
                              //             }
                              //           : null,
                              //       icon: Icons.horizontal_rule,
                              //       color: numDay == 0
                              //           ? AppColor.IconMinus
                              //           : AppColor.IconAdd,
                              //     ),
                              //     const SizedBox(
                              //       width: 10,
                              //     ),
                              //     Text('$numDay'),
                              //     const SizedBox(
                              //       width: 10,
                              //     ),
                              //     WidgetAddAndMinus(
                              //       onTap: () {
                              //         setState(() {
                              //           numDay++;
                              //         });
                              //       },
                              //       icon: Icons.add,
                              //       color: AppColor.IconAdd,
                              //     ),
                              //   ],
                              // ),

                              WidgetElevatedButton(
                                height: 55,
                                onTap: () {
                                  // showDialog(
                                  //     context: context,
                                  //     builder: (BuildContext context) {
                                  //       return WidgetDialogInfoBook(
                                  //         numDay: numDay,
                                  //         numFourCapacity: numFourCapacity,
                                  //         numSixCapacity: numSixCapacity,
                                  //         numTowCapacity: numTowCapacity,
                                  //         priceFourCapacity: priceFourCapacity,
                                  //         priceSixCapacity: priceSixCapacity,
                                  //         priceTowCapacity: priceTowCapacity,
                                  //       );
                                  //     });
                                },
                                text: 'Done -->',
                              ),
                            ])
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
              ),
            ),
          ),
        ]),
      );
    });
  }
}
