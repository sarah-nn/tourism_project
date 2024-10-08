import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/data/models/dynamic_booklist_model.dart';
import 'package:tourism_project/presentation/widget/animation_text/hero_text.dart';
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

  void _handleDelete(int id) {
    setState(() {
      myList.removeWhere(
          (book) => book.id == id && book.endDate != DateTime.now().toString());
    });
  }

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
        } else if (state is DeleteBookinDone) {
          context.read<DynamicTripCubit>().getAllDynamicBook(pre_Up);
          context.pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: state is DynamicBookingList || state is DeleteBookinDone
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
                          child: myList.isEmpty
                              ? Center(
                                  child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Not found any Booking',
                                      style: TextStyle(
                                          fontFamily: 'normal',
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54),
                                    ),
                                    const SizedBox(height: 15),
                                    TextButton(
                                        onPressed: () {},
                                        child: ScaleTextOrIcon(
                                          icon: false,
                                          text: 'Booking now !',
                                          style: TextStyle(
                                            fontFamily: 'Pacifico',
                                            fontSize: 24,
                                            color: AppColor.primaryColor,
                                          ),
                                          icons: null,
                                        )),
                                    const SizedBox(height: 10)
                                  ],
                                ))
                              : ListView.builder(
                                  itemCount: myList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 35, bottom: 15),
                                      child: DynamicCardBook(
                                          onDelete: () {},
                                          // onDelete: () =>
                                          //     _handleDelete(myList[index].id),
                                          model: myList[index],
                                          index: index,
                                          isPre: isPre),
                                    );
                                  }),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Container(
                        height: 200,
                        width: 200,
                        child: Lottie.asset(AppImage.loading)),
                  ));
      },
    );
  }
}
