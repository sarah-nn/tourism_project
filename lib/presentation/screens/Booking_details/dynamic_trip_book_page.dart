import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/dynamic_booklist_model.dart';
import 'package:tourism_project/presentation/widget/dynamic_trip/dynamic_booking_details/booking_card_widget.dart';

class DynamicBookPage extends StatefulWidget {
  const DynamicBookPage({super.key});

  @override
  State<DynamicBookPage> createState() => _DynamicBookPageState();
}

class _DynamicBookPageState extends State<DynamicBookPage> {
  List<DynamicListBookingModel> myList = [];
  String pre_Up = 'future_trip';
  String type = "Previous";
  bool isPre = false;

  @override
  void initState() {
    super.initState();
    context.read<DynamicTripCubit>().getAllDynamicBook(pre_Up);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DynamicTripCubit, DynamicTripState>(
      listener: (context, state) {
        if (state is DynamicBookingList) {
          myList = (state).bookList;
        }
        if (state is BookingDynamicFail) {
          showAlertDialog(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: state is DynamicBookingList
                ? Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.only(right: 7),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  pre_Up == 'finished_trip'
                                      ? pre_Up = 'future_trip'
                                      : pre_Up = 'finished_trip';
                                  context
                                      .read<DynamicTripCubit>()
                                      .getAllDynamicBook(pre_Up);
                                  type == "Previous"
                                      ? type = "upComing"
                                      : type = "Previous";
                                  type == "Previous"
                                      ? isPre = false
                                      : isPre = true;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    type,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primaryColor,
                                        fontSize: 19),
                                  ),
                                  type == "Previous"
                                      ? Icon(Icons.arrow_upward,
                                          color: AppColor.primaryColor)
                                      : Icon(Icons.arrow_downward,
                                          color: AppColor.primaryColor)
                                ],
                              ),
                            ),
                          )),
                      Expanded(
                        flex: 20,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          child: ListView.builder(
                              itemCount: myList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 35, bottom: 15),
                                  child: DynamicCardBook(
                                      model: myList[index],
                                      index: index,
                                      isPre: isPre),
                                );
                              }),
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ));
      },
    );
  }
}
