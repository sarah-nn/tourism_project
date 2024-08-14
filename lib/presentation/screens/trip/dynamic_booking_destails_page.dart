import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/activity/activity_cubit.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/business_logic/dynamicTrip/update_trip/update_trip_cubit.dart';
import 'package:tourism_project/business_logic/flight/searchFlight_cubit.dart';
import 'package:tourism_project/business_logic/hotel/searchHotel_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/data/models/dynamic_booking_details_model.dart';
import 'package:tourism_project/presentation/screens/trip/dynamic_edit_booking_page.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/dynamic_booking_details/activities&places_details.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/dynamic_booking_details/check_pay_card.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/dynamic_booking_details/custom_flight_details.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/dynamic_booking_details/hotel_details.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/dynamic_booking_details/top_detalsi_card.dart';

class DynamicTripBookingDetailsPage extends StatefulWidget {
  final String tripId;
  const DynamicTripBookingDetailsPage({
    super.key,
    required this.tripId,
  });

  @override
  State<DynamicTripBookingDetailsPage> createState() =>
      _DynamicTripBookingDetailsPageState();
}

class _DynamicTripBookingDetailsPageState
    extends State<DynamicTripBookingDetailsPage> {
  DataModel? mymodel;
  dynamic goingPlane;
  dynamic returnPlane;
  dynamic hotelTrip;
  bool noGoing = false;
  bool noRetutn = false;
  bool isHotel = false;
  bool dropHotel = false;

  @override
  void initState() {
    super.initState();
    context.read<DynamicTripCubit>().dynamicTripBookingdetails(widget.tripId);
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
          print("is there going trip  $goingPlane");
          print(mymodel);
          print("is there hotel $hotelTrip");
          print("is there return trip  $returnPlane");
          if (goingPlane is List) {
            noGoing = true;
          }
          if (returnPlane is List) {
            noRetutn = true;
          }
          if (hotelTrip is List) {
            isHotel = true;
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor.primaryColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14, bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Review Details",
                          style: MyTextStyle.headers.copyWith(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MultiBlocProvider(
                                        providers: [
                                          BlocProvider(
                                            create: (context) =>
                                                DynamicTripCubit(),
                                          ),
                                          BlocProvider(
                                            create: (context) =>
                                                SearchHotelCubit(),
                                          ),
                                          BlocProvider(
                                            create: (context) =>
                                                SearchFlightCubit(),
                                          ),
                                          BlocProvider(
                                            create: (context) =>
                                                UpdateTripCubit(),
                                          ),
                                        ],
                                        child: DynamicTripBookingEditPage(
                                            tripId: mymodel!.dynamicTrip!.id
                                                .toString()),
                                      )));
                            },
                            child: const Text(
                              "Edit",
                              style: TextStyle(color: Colors.white),
                            ))
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
                                    mymodel: mymodel!, isEdit: false),
                                const SizedBox(height: 25),
                                singleRow(
                                    "Number of people  ",
                                    mymodel!.dynamicTrip!.numberOfPeople
                                        .toString()),
                                !isHotel
                                    ? HotelDetails(
                                        newName: '',
                                        hotelTrip: hotelTrip,
                                        dropHotel: dropHotel,
                                        customOnTap: () {
                                          setState(() {
                                            dropHotel = !dropHotel;
                                          });
                                        },
                                        roomC1: roomC1(),
                                        roomC2: roomC2(),
                                        roomC4: roomC4(),
                                        roomC6: roomC6(),
                                        priceC1: roomC1() != 0 ? priceC1() : "",
                                        priceC2: roomC2() != 0 ? priceC2() : "",
                                        priceC4: roomC4() != 0 ? priceC4() : "",
                                        priceC6: roomC6() != 0 ? priceC6() : "",
                                        isEdit: false,
                                      )
                                    : singleRow("Hotel booking : ", "no found"),
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
                                        planeName: "No Plane Selected",
                                        price: "",
                                        source: "",
                                        destination: ""),
                                !noRetutn
                                    ? CustomFlight(
                                        model: mymodel,
                                        returnEdit: false,
                                        isEdit: false,
                                        header: "Return Trip :  ",
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
                                        model: mymodel!,
                                        returnEdit: false,
                                        isEdit: false,
                                        header: "Return Trip :  ",
                                        planeName: "No Plane selected",
                                        price: "",
                                        source: "",
                                        destination: ""),
                                BlocProvider(
                                  create: (context) => ActivityCubit(),
                                  child: ActivityAndPlaces(
                                    mymodel: mymodel!,
                                    isEdit: false,
                                  ),
                                ),
                                mymodel!.dynamicTrip!.tripNote == null
                                    ? Container()
                                    : Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Trip Note ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17.5),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  top: 10, left: 4),
                                              child: Text(
                                                mymodel!.dynamicTrip!.tripNote!,
                                                style: const TextStyle(
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
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
                                      ? double.parse(returnPlane['return_plane']
                                          ['ticket_price'])
                                      : 0.0,
                                  c1: roomC1() == 0
                                      ? 0.0
                                      : double.parse(priceC1()),
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
              )
            ],
          ),
        );
      },
    );
  }

  int roomC1() {
    return mymodel!.rooms!.where((room) => room.capacity == 1).length;
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

  String priceC1() {
    final c1 = mymodel!.rooms!.firstWhere((room) => room.capacity == 1);
    return c1.price.toString();
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

  Widget singleRow(header, value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 197, 197, 197))),
      child: Row(
        children: [
          Text(
            header,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17.5),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
