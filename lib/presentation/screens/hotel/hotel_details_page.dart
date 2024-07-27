import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/hotel/roomAndBook_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/data/models/room_model.dart';
import 'package:tourism_project/presentation/widget/hotel/custom_elevated_buttom.dart';
import 'package:tourism_project/presentation/widget/hotel/info_book_room_widget.dart';

// ignore: must_be_immutable
class InfoBookingHotelPage extends StatefulWidget {
  String HotelId;
  String countryId;
  String startDate;
  String endDate;
  InfoBookingHotelPage({
    super.key,
    required this.HotelId,
    required this.countryId,
    required this.endDate,
    required this.startDate,
  });

  @override
  State<InfoBookingHotelPage> createState() => _InfoBookingHotelPageState();
}

class _InfoBookingHotelPageState extends State<InfoBookingHotelPage> {
  int numTowCapacity = 0;
  int numFourCapacity = 0;
  int numSixCapacity = 0;
  String tripName = 'booking';
  late RoomModel roomModel;
  late RoomCubit myBloc;

  @override
  void initState() {
    super.initState();
    context.read<RoomCubit>().getRooms(
        hotelId: widget.HotelId, start: widget.startDate, end: widget.endDate);
    myBloc = BlocProvider.of<RoomCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RoomCubit, RoomState>(listener: (context, state) {
      if (state is RoomSuccess) {
        roomModel = (state).roomModel;
      }
      if (state is BookHotelSuccess) {
        showBookingDialog(context, AppRoutes.detailsBookHotel);
        // showAlertSuccess(
        //     context,
        //     ' bokking this hotel \n if you see details or edit click here',
        //     'view book',
        //     AppRoutes.detailsBookHotel);
        numTowCapacity = 0;
        numFourCapacity = 0;
        numSixCapacity = 0;
      }
      if (state is RoomFailure) {
        showAlertDialog(context, state.errMessage);
      }
      if (state is BookHotelFailure) {
        if (numTowCapacity == 0 &&
            numFourCapacity == 0 &&
            numSixCapacity == 0) {
          showAlertDialog(context,
              'please enter the number of rooms you would like to book');
        } else {
          showAlertDialog(context, state.errMessage);
        }
        numTowCapacity = 0;
        numFourCapacity = 0;
        numSixCapacity = 0;
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
                    fontFamily: 'Philosopher',
                    color: Colors.white,
                    fontSize: 21,
                    fontWeight: FontWeight.bold),
              ))),
          Expanded(
            flex: 10,
            child: Container(
              clipBehavior: Clip.antiAlias,
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
                  padding: const EdgeInsets.all(24),
                  child: state is RoomSuccess ||
                          state is BookHotelSuccess ||
                          state is BookHotelFailure
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text(
                                'Select number room :',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'normal',
                                    fontSize: 21,
                                    color: AppColor.fifeColor),
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

                                        print(roomModel.data?.capacity2!.count);
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
                                height: 15,
                              ),
                              Text(
                                'Select name booking :',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'normal',
                                    fontSize: 21,
                                    color: AppColor.fifeColor),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColor.secondColor,
                                ),
                                child: TextFormField(
                                  cursorColor: AppColor.primaryColor,
                                  onChanged: (val) {
                                    tripName = val;
                                  },
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "  name booking",
                                      hintStyle:
                                          TextStyle(color: Colors.black54)),
                                ),
                              ),
                              const SizedBox(height: 20),
                              WidgetElevatedButton(
                                height: 55,
                                onTap: () {
                                  if ((roomModel.data?.capacity2!.count)!.toInt() == 0 &&
                                      (roomModel.data?.capacity4!.count)!
                                              .toInt() ==
                                          0 &&
                                      (roomModel.data?.capacity6!.count)!
                                              .toInt() ==
                                          0) {
                                    showAlertDialog(context,
                                        'Sorry , there are no vacant rooms in this date');
                                  } else {
                                    myBloc.bookHotel(
                                        tripName: tripName,
                                        destinationTripId: widget.countryId,
                                        hotelId: widget.HotelId,
                                        startDate: widget.startDate,
                                        endDate: widget.endDate,
                                        countRoomC2: numTowCapacity.toString(),
                                        countRoomC4: numFourCapacity.toString(),
                                        countRoomC6: numSixCapacity.toString());
                                  }
                                },
                                text: 'Book Now',
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
