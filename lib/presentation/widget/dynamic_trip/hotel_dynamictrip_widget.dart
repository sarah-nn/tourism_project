import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/business_logic/hotel/searchHotel_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/search_hotel_model.dart';

class HotelDynamicTrip extends StatefulWidget {
  const HotelDynamicTrip({super.key});

  @override
  State<HotelDynamicTrip> createState() => _HotelDynamicTripState();
}

class _HotelDynamicTripState extends State<HotelDynamicTrip> {
  String selectedName = 'Tap to Show Hotels..';
  String hotelId = '';
  bool isChooseHotel = false;
  List<HotelModel> hotelList = [];

  void _selectHotel(String hotel, String id) {
    setState(() {
      selectedName = hotel;
      context.read<DynamicTripCubit>().hotelId = id;
      isChooseHotel = true;
    });

    Navigator.pop(context);
  }

  void openButtomSheet(BuildContext context, List<HotelModel> hotelModel) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (BuildContext ctx) {
        return hotelList.isNotEmpty
            ? ListView.builder(
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
    hotelList = context.read<SearchHotelCubit>().HotelList;
    return BlocConsumer<DynamicTripCubit, DynamicTripState>(
      listener: (context, state) {
        if (state is BookingDynamicFail) {
          showAlertDialog(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Do you need to book Hotel ?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            const Row(
              children: [
                Text(
                  "if dont't Just ",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Text(
                  "Skip ",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                    color: Color.fromARGB(255, 190, 41, 30),
                  ),
                ),
                Text(
                  "step .",
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 17),
            BlocConsumer<SearchHotelCubit, SearchHotelState>(
              listener: (context, state) {
                if (state is SearchHotelSuccess) {
                  hotelList = (state).HotelList;
                }
              },
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    //  print(countryId);
                    openButtomSheet(context, hotelList);
                    print(hotelList.length);
                    print(hotelList);
                  },
                  child: Container(
                    height: 50,
                    width: double.maxFinite,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: AppColor.thirdColor.withOpacity(0.3),
                        border: Border.all(color: AppColor.thirdColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 17),
                      child: Text(
                        selectedName,
                        style: const TextStyle(
                            fontFamily: "normal",
                            color: Color.fromARGB(255, 146, 146, 146),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(right: 26.5),
              child: Table(
                  columnWidths: const {
                    0: FractionColumnWidth(0.8),
                    1: FractionColumnWidth(0.3)
                  },
                  border:
                      TableBorder.all(color: AppColor.primaryColor, width: 1.5),
                  children: [
                    customHeaders(['Capacity', 'Num']),
                    customTableRow(
                        "2", context.read<DynamicTripCubit>().controller2),
                    customTableRow(
                        "4", context.read<DynamicTripCubit>().controller4),
                    customTableRow(
                        "6", context.read<DynamicTripCubit>().controller6),
                  ]),
            ),
          ],
        );
      },
    );
  }

  TableRow customHeaders(List<String> headername) => TableRow(
        children: headername.map((e) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Text(
                e,
                style: TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ),
          );
        }).toList(),
      );

  TableRow customTableRow(String capacity, TextEditingController controller) =>
      TableRow(children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text(
            'Room for ($capacity)',
            textAlign: TextAlign.center,
          ),
        ),
        Center(
            child: isChooseHotel
                ? TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(hintText: "0"))
                : MaterialButton(
                    onPressed: () {
                      showAlertDialog(context, "Choose your Hotel First !!");
                    },
                    child: const Center(
                      child: Text("0"),
                    ),
                  ))
      ]);
}
