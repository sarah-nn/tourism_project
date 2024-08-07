import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tourism_project/business_logic/activity/activity_cubit.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/business_logic/dynamicTrip/update_trip/update_trip_cubit.dart';
import 'package:tourism_project/business_logic/hotel/searchHotel_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/dynamic_booking_details_model.dart';
import 'package:tourism_project/data/models/search_hotel_model.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/dynamic_booking_details/activities&places_details.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/dynamic_booking_details/check_pay_card.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/dynamic_booking_details/custom_flight_details.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/dynamic_booking_details/dynamic_note_details.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/dynamic_booking_details/hotel_details.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/dynamic_booking_details/top_detalsi_card.dart';
import 'package:tourism_project/presentation/widget/hotel/search_hotel_widget.dart';

class DynamicTripBookingEditPage extends StatefulWidget {
  const DynamicTripBookingEditPage({super.key, required this.tripId});
  final String tripId;

  @override
  State<DynamicTripBookingEditPage> createState() =>
      _DynamicTripBookingEditPageState();
}

class _DynamicTripBookingEditPageState
    extends State<DynamicTripBookingEditPage> {
  DataModel? mymodel;
  dynamic goingPlane;
  dynamic returnPlane;
  dynamic hotelTrip;
  List<HotelModel> hotelList = [];
  String newHotelName = 'no Book';
  bool noGoing = false;
  bool noRetutn = false;
  bool isHotel = false;
  bool dropHotel = false;
  bool isChooseHotel = false;
  int propleNumber = 0;
  int cntpeople = 0;
  int c2Num = 0;
  int c4Num = 0;
  int c6Num = 0;
  int cnt2 = 0;
  int cnt4 = 0;
  int cnt6 = 0;
  void incrementC2() {
    setState(() {
      c2Num++;
      cnt2++;
    });
  }

  void incrementC4() {
    setState(() {
      c4Num++;
      cnt4++;
    });
  }

  void incrementC6() {
    setState(() {
      c6Num++;
      cnt6++;
    });
  }

  void _incrementCounter() {
    setState(() {
      propleNumber++;
      cntpeople++;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<DynamicTripCubit>().dynamicTripBookingdetails(widget.tripId);
  }

  void _selectHotel(String hotel, String id) {
    setState(() {
      newHotelName = hotel;
      context.read<UpdateTripCubit>().newHotelId = id;
      isChooseHotel = true;
    });

    Navigator.pop(context);
  }

  void openButtomSheet(BuildContext context, List<HotelModel> hotelModel) {
    showModalBottomSheet(
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (BuildContext ctx) {
        return hotelList.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: ListView.builder(
                  itemCount: hotelModel.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      elevation: 7,
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 10, top: 25, bottom: 2),
                        child: ListTile(
                          title: Text(hotelModel[index].name),
                          subtitle: Text(hotelModel[index].area.name),
                          trailing: Container(
                            width: 100,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(hotelModel[index].stars)
                              ],
                            ),
                          ),
                          onTap: () {
                            _selectHotel(hotelModel[index].name,
                                hotelModel[index].id.toString());
                          },
                        ),
                      ),
                    );
                  },
                ),
              )
            : const Center(
                child:
                    Text("NO Hotels Or maybe you Don't Enter Your Distination"),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DynamicTripCubit, DynamicTripState>(
      listener: (context, state) {
        if (state is DynamicTripBookingSuccess) {
          mymodel = (state).dynamicbookingModel;
          goingPlane = (state).going_plane;
          returnPlane = (state).return_plane;
          hotelTrip = (state).hotelTrip;
          propleNumber =
              (state).dynamicbookingModel.dynamicTrip!.numberOfPeople!;
          placeIds = (state)
              .dynamicbookingModel
              .places!
              .map((place) => place.id as int)
              .toList();
          activities = (state)
              .dynamicbookingModel
              .activities!
              .map((activities) => activities.id as int)
              .toList();
          print("befor $activities");
          // print("is there going trip  $goingPlane");
          // print(mymodel);
          // print("is there hotel $hotelTrip");
          // print("is there return trip  $returnPlane");
          if (goingPlane is List) {
            noGoing = true;
          }
          if (returnPlane is List) {
            noRetutn = true;
          }
          if (hotelTrip is List) {
            isHotel = true;
          } else {
            c2Num = roomC2();
            c4Num = roomC4();
            c6Num = roomC6();
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColor.primaryColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14, bottom: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Booking Edit",
                            style: MyTextStyle.headers.copyWith(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          BlocConsumer<UpdateTripCubit, UpdateTripState>(
                            listener: (context, state) {
                              if (state is UpdateTripSuccess) {
                                CustomAlertDialog(context, "Are you Sure",
                                    state.message, "OK", "", () {}, () {});
                              }
                              if (state is UpdateTripFail) {
                                showAlertDialog(context, state.message);
                              }
                            },
                            builder: (context, state) {
                              return TextButton(
                                  onPressed: () {
                                    // context.pop();
                                    context.read<UpdateTripCubit>().printList();
                                    print(cntpeople);
                                    context
                                        .read<UpdateTripCubit>()
                                        .updateDynamicTrip(
                                            mymodel!.dynamicTrip!.id!
                                                .toString(),
                                            mymodel!.dynamicTrip!.endDate
                                                .toString());
                                    // print(context.read<DynamicTripCubit>().newDate);
                                    // print(context.read<DynamicTripCubit>().addPeople);
                                    //  print("after $placeIds");
                                    // print(activities);
                                    //  print(context.read<DynamicTripCubit>().addc6);
                                    // print(context.read<DynamicTripCubit>().newPlane);
                                  },
                                  child: const Text(
                                    "Save",
                                    style: TextStyle(color: Colors.white),
                                  ));
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 80,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: state is DynamicTripBookingSuccess
                            ? ListView(
                                children: [
                                  TopDetailsCard(
                                      mymodel: mymodel!, isEdit: true),
                                  const SizedBox(height: 25),
                                  singleRow("Number of People : ",
                                      propleNumber.toString(), true, () {
                                    _incrementCounter();
                                    context.read<UpdateTripCubit>().addPeople =
                                        cntpeople.toString();
                                  }),
                                  !isHotel
                                      ? HotelDetails(
                                          hotelTrip: hotelTrip,
                                          dropHotel: dropHotel,
                                          newName: '',
                                          customOnTap: () {
                                            setState(() {
                                              dropHotel = !dropHotel;
                                            });
                                          },
                                          roomC2: c2Num,
                                          roomC4: c4Num,
                                          roomC6: c6Num,
                                          priceC2:
                                              roomC2() != 0 ? priceC2() : "",
                                          priceC4:
                                              roomC4() != 0 ? priceC4() : "",
                                          priceC6:
                                              roomC6() != 0 ? priceC6() : "",
                                          isEdit: true,
                                          onPressed2: () {
                                            incrementC2();
                                            context
                                                .read<UpdateTripCubit>()
                                                .addc2 = c2Num.toString();
                                          },
                                          onPressed4: () {
                                            incrementC4();
                                            context
                                                .read<UpdateTripCubit>()
                                                .addc4 = c4Num.toString();
                                          },
                                          onPressed6: () {
                                            incrementC6();
                                            context
                                                .read<UpdateTripCubit>()
                                                .addc6 = cnt6.toString();
                                          },
                                        )
                                      : !isChooseHotel
                                          ? singleRow("Hotel booking : ",
                                              newHotelName, true, () {
                                              openButtomSheet(
                                                  context, hotelList);
                                              HotelDetails(
                                                hotelTrip: hotelTrip,
                                                dropHotel: dropHotel,
                                                newName: '',
                                                customOnTap: () {
                                                  setState(() {
                                                    dropHotel = !dropHotel;
                                                  });
                                                },
                                                roomC2: c2Num,
                                                roomC4: c4Num,
                                                roomC6: c6Num,
                                                priceC2: roomC2() != 0
                                                    ? priceC2()
                                                    : "",
                                                priceC4: roomC4() != 0
                                                    ? priceC4()
                                                    : "",
                                                priceC6: roomC6() != 0
                                                    ? priceC6()
                                                    : "",
                                                isEdit: true,
                                                onPressed2: () {
                                                  incrementC2();
                                                  context
                                                      .read<UpdateTripCubit>()
                                                      .addc2 = cnt2.toString();
                                                },
                                                onPressed4: () {
                                                  incrementC4();
                                                  context
                                                      .read<UpdateTripCubit>()
                                                      .addc4 = cnt4.toString();
                                                },
                                                onPressed6: () {
                                                  incrementC6();
                                                  context
                                                      .read<UpdateTripCubit>()
                                                      .addc6 = c6Num.toString();
                                                },
                                              );
                                              // showModalBottomSheet(
                                              //     context: context,
                                              //     builder:
                                              //         (BuildContext context) {
                                              //       return Container(
                                              //         height: 50,
                                              //         child: MaterialButton(
                                              //           onPressed: () {
                                              //             setState(() {
                                              //               isChooseHotel = true;
                                              //               context.pop();
                                              //             });
                                              //           },
                                              //           child: Text("data"),
                                              //         ),
                                              //       );
                                              //     });
                                            })
                                          : HotelDetails(
                                              hotelTrip: hotelTrip,
                                              dropHotel: dropHotel,
                                              newName: newHotelName,
                                              customOnTap: () {
                                                setState(() {
                                                  dropHotel = !dropHotel;
                                                });
                                              },
                                              roomC2: c2Num,
                                              roomC4: c4Num,
                                              roomC6: c6Num,
                                              priceC2: roomC2() != 0
                                                  ? priceC2()
                                                  : "",
                                              priceC4: roomC4() != 0
                                                  ? priceC4()
                                                  : "",
                                              priceC6: roomC6() != 0
                                                  ? priceC6()
                                                  : "",
                                              isEdit: true,
                                              onPressed2: () {
                                                incrementC2();
                                                context
                                                    .read<UpdateTripCubit>()
                                                    .addc2 = c2Num.toString();
                                              },
                                              onPressed4: () {
                                                incrementC4();
                                                context
                                                    .read<UpdateTripCubit>()
                                                    .addc4 = c4Num.toString();
                                              },
                                              onPressed6: () {
                                                incrementC6();
                                                context
                                                    .read<UpdateTripCubit>()
                                                    .addc6 = c6Num.toString();
                                              },
                                            ),
                                  !noGoing
                                      ? CustomFlight(
                                          model: mymodel,
                                          returnEdit: false,
                                          isEdit: false,
                                          header: "Going Trip :  ",
                                          planeName: goingPlane['going_plane']
                                              ['name'],
                                          price: goingPlane['going_plane']
                                              ['ticket_price'],
                                          source: goingPlane['airport_source']
                                              ['name'],
                                          destination:
                                              goingPlane['airport_destination']
                                                  ['name'])
                                      : CustomFlight(
                                          model: mymodel,
                                          returnEdit: false,
                                          isEdit: false,
                                          header: "Going Trip : ",
                                          planeName: "empty",
                                          price: "",
                                          source: "",
                                          destination: ""),
                                  !noRetutn
                                      ? CustomFlight(
                                          model: mymodel,
                                          isEdit: false,
                                          header: "Return Trip :  ",
                                          returnEdit: true,
                                          planeName: returnPlane['return_plane']
                                              ['name'],
                                          price: returnPlane['return_plane']
                                              ['ticket_price'],
                                          source: returnPlane['airport_source']
                                              ['name'],
                                          destination:
                                              returnPlane['airport_destination']
                                                  ['name'])
                                      : CustomFlight(
                                          model: mymodel,
                                          returnEdit: false,
                                          isEdit: true,
                                          header: "Return Trip :  ",
                                          planeName: "empty",
                                          price: "",
                                          source: "",
                                          destination: ""),
                                  mymodel!.dynamicTrip!.tripNote == null
                                      ? Container()
                                      : DynamicNoteDetails(mymodel: mymodel!),
                                  BlocProvider(
                                    create: (context) => ActivityCubit(),
                                    child: ActivityAndPlaces(
                                        mymodel: mymodel!, isEdit: true),
                                  ),
                                  CheckPayCard(
                                    mymodel: mymodel!,
                                    noGoing: noGoing,
                                    noRetutn: noRetutn,
                                    goingPrice: !noGoing
                                        ? double.parse(goingPlane['going_plane']
                                            ['ticket_price'])
                                        : 0.0,
                                    returnPrice: !noRetutn
                                        ? double.parse(
                                            returnPlane['return_plane']
                                                ['ticket_price'])
                                        : 0.0,
                                    c2: roomC2() == 0
                                        ? 0.0
                                        : double.parse(priceC2()),
                                    c4: roomC4() == 0
                                        ? 0.0
                                        : double.parse(priceC4()),
                                    c6: roomC6() == 0
                                        ? 0.0
                                        : double.parse(priceC6()),
                                  )
                                ],
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              )),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  int roomC2() {
    return mymodel!.rooms!.where((room) => room.capacity == 2).length;
  }

  int roomC4() {
    return mymodel!.rooms!.where((room) => room.capacity == 4).length;
  }

  int roomC6() {
    return mymodel!.rooms!.where((room) => room.capacity == 6).length;
  }

  String priceC2() {
    final c2 = mymodel!.rooms!.firstWhere((room) => room.capacity == 2);
    return c2.price.toString();
  }

  String priceC4() {
    final c4 = mymodel!.rooms!.firstWhere((room) => room.capacity == 4);
    return c4.price.toString();
  }

  String priceC6() {
    final c6 = mymodel!.rooms!.firstWhere((room) => room.capacity == 6);
    return c6.price.toString();
  }

  Widget singleRow(header, value, bool isEdit, Function()? onTap) {
    context
        .read<SearchHotelCubit>()
        .getAllHotel(mymodel!.destinationTrip!.id!.toString());
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 197, 197, 197))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                header,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 17.5),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          isEdit
              ? BlocConsumer<SearchHotelCubit, SearchHotelState>(
                  listener: (context, state) {
                    if (state is SearchHotelSuccess) {
                      hotelList = (state).HotelList;
                    }
                  },
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: onTap,
                      child: Row(
                        children: [
                          Icon(
                            Iconsax.add_circle_copy,
                            size: 20,
                            color: AppColor.primaryColor,
                          ),
                          Text(
                            " Add",
                            style: TextStyle(color: AppColor.primaryColor),
                          )
                        ],
                      ),
                    );
                  },
                )
              : Container()
        ],
      ),
    );
  }
}
