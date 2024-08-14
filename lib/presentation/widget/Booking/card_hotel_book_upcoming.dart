import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tourism_project/business_logic/details_book.dart/show_details_book_hotel_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/details_book_hotel_model.dart';
import 'package:tourism_project/data/models/show_details_book_hotel_model.dart';
import 'package:tourism_project/presentation/widget/Booking/text_info.dart';
import 'package:tourism_project/presentation/widget/Booking/text_name.dart';

class CardHotelBook extends StatefulWidget {
  const CardHotelBook(
      {required this.onDelete, required this.futureTripsHotel, super.key});
  final FutureTripsHotel futureTripsHotel;
  final VoidCallback onDelete;

  @override
  State<CardHotelBook> createState() => _CardHotelBookState();
}

class _CardHotelBookState extends State<CardHotelBook> {
  ShowDetailsBookHotelModel? showDetailsBookHotelModel;
  late ShowDetailsBookHotelCubit myBloc;
  bool isExpanded = false;
  bool isEditingName = false;
  final TextEditingController _controllerNameBook = TextEditingController();
  //final FocusNode _focusNode = FocusNode();
  List<DetailsBookHotelModel> hotels = [];
  int addRoomC2 = 0;
  int addRoomC4 = 0;
  int addRoomC6 = 0;
  int addRoomC1 = 0;
  String? endDate;
  String? startDate;
  String? nameBooking;
  String? warningEdit;
  bool successEdit = true;
  bool comparte = false;
  late DateTime date1;
  late DateTime date2;
  int difference = 0;
  bool enableCancel = false;
  bool enableEdit = false;
  void toggleExpande() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  void initState() {
    super.initState();
    endDate = widget.futureTripsHotel.endDate;
    nameBooking = widget.futureTripsHotel.tripName;
    startDate = widget.futureTripsHotel.startDate;
    myBloc = BlocProvider.of<ShowDetailsBookHotelCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowDetailsBookHotelCubit, ShowDetailsBookHotelState>(
        listener: (context, state) {
      if (state is DeleteBookHotelSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(milliseconds: 500),
          content: Row(
            children: [
              Icon(
                Icons.arrow_right,
                color: AppColor.secondColor,
              ),
              Text(
                state.message,
                style: TextStyle(
                    color: AppColor.secondColor, fontFamily: 'Audiowide'),
              ),
            ],
          ),
          shape: Border.all(
              width: 1.7,
              color: AppColor.secondColor,
              style: BorderStyle.solid),
          elevation: 10,
          backgroundColor: const Color.fromARGB(255, 61, 105, 141),
        ));
        widget.onDelete();
      } else if (state is DeleteBookHotelFailure) {
        showAlertDialog(context, state.errMessage);
      }
      if (state is ShowDetailsBookHotelSuccess) {
        showDetailsBookHotelModel = (state).showDetailsBookHotelModel;
      }
      if (state is EditBookHotelSuccess) {
        showDetailsBookHotelModel = (state).showDetailsBookHotelModel;
        successEdit = true;
      }
      if (state is EditBookHotelFailure) {
        showAlertDialog(context, state.errMessage);
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text(state.errMessage)));
        successEdit = false;
        warningEdit = state.errMessage;
      }
      if (state is ShowDetailsBookHotelFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("state.fauil")));
      }
    }, builder: (context, state) {
      return Stack(clipBehavior: Clip.none, children: [
        Card(
          shadowColor: const Color.fromARGB(255, 181, 217, 246),
          elevation: 6,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Container(
            decoration: BoxDecoration(
                color: AppColor.secondColor.withAlpha(190),
                border: Border.all(width: 1, color: AppColor.primaryColor),
                borderRadius: BorderRadius.circular(25)),
            height: isExpanded ? null : null,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const Text(' France '),
                    const SizedBox(height: 20),

                    TextInfoBook(
                        baseText: 'start date',
                        secoundText: widget.futureTripsHotel.startDate),
                    const SizedBox(height: 10),

                    TextInfoBook(
                        baseText: 'end date',
                        secoundText: widget.futureTripsHotel.endDate),
                    !isExpanded
                        ? const SizedBox(height: 20)
                        : const SizedBox(height: 10),
                    !isExpanded
                        ? GestureDetector(
                            onTap: () {
                              toggleExpande();
                              myBloc.getAllShowDetailsBookHotel(
                                  widget.futureTripsHotel.id.toString());
                            },
                            child: Text(
                              'view more details...',
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ))
                        : Container(),
                    if (isExpanded)
                      state is ShowDetailsBookHotelSuccess ||
                              state is DeleteBookHotelSuccess ||
                              state is DeleteBookHotelFailure ||
                              state is EditBookHotelSuccess ||
                              state is EditBookHotelFailure
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextInfoBook(
                                    baseText: 'hote name',
                                    secoundText:
                                        '${showDetailsBookHotelModel?.hotel?.name}'),
                                const SizedBox(height: 10),
                                TextInfoBook(
                                    baseText: 'location',
                                    secoundText:
                                        '${showDetailsBookHotelModel?.destinationTrip?.name}'),
                                const SizedBox(height: 10),
                                TextInfoBook(
                                    baseText: 'num Room',
                                    secoundText:
                                        '${showDetailsBookHotelModel?.dynamicTrip?.roomsCount}'),
                                const SizedBox(height: 10),
                                const SizedBox(height: 10),
                                Card(
                                  elevation: 3,
                                  child: DataTable(
                                      headingRowColor:
                                          MaterialStateProperty.all(
                                              const Color.fromARGB(
                                                  255, 208, 231, 248)),
                                      dataRowColor: MaterialStateProperty.all(
                                          const Color.fromARGB(
                                              255, 239, 238, 238)),
                                      columns: [
                                        DataColumn(
                                            label: Text(
                                          'type room',
                                          style: TextStyle(
                                              color: AppColor.fifeColor,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        DataColumn(
                                            label: Text('price',
                                                style: TextStyle(
                                                    color: AppColor.fifeColor,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        DataColumn(
                                            label: Text('id',
                                                style: TextStyle(
                                                    color: AppColor.fifeColor,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                      rows: List<DataRow>.generate(
                                          showDetailsBookHotelModel != null
                                              ? showDetailsBookHotelModel!
                                                  .rooms.length
                                              : 0,
                                          (index) => DataRow(cells: [
                                                DataCell(Text(
                                                    'Capacity_${showDetailsBookHotelModel?.rooms[index].capacity}')),
                                                DataCell(Text(
                                                    '${showDetailsBookHotelModel?.rooms[index].price}')),
                                                DataCell(Text(
                                                    '${showDetailsBookHotelModel?.rooms[index].id}'))
                                              ]))),
                                ),
                                const SizedBox(height: 10),
                                TextInfoBookPriceAndNote(
                                  baseText: 'Total price',
                                  secoundText:
                                      '${showDetailsBookHotelModel?.dynamicTrip?.price}\$',
                                  sizeSecound: 20,
                                  backgroundColorSecound:
                                      const Color.fromARGB(255, 243, 218, 222),
                                ),
                                const SizedBox(height: 20),
                                isExpanded
                                    ? GestureDetector(
                                        onTap: () {
                                          toggleExpande();
                                        },
                                        child: Text(
                                          'view less details',
                                          style: TextStyle(
                                              color: AppColor.primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ))
                                    : Container()
                              ],
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            )
                    else
                      Container(),

                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(
                      thickness: 0.6,
                      color: Color.fromARGB(255, 168, 166, 166),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            date1 = DateTime.now();
                            date2 = DateTime.parse(
                                widget.futureTripsHotel.startDate);
                            if (date2.isBefore(date1) ||
                                date2.isAtSameMomentAs(date1)) {
                              enableEdit = true;
                            } else {
                              enableEdit = false;
                            }
                            enableEdit
                                ? showAlertDialog(context,
                                    'sorry you cant edit book because the trip is started ')
                                : showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                          actionsPadding:
                                              const EdgeInsets.all(5),
                                          contentPadding: const EdgeInsets.only(
                                              top: 15,
                                              bottom: 7,
                                              left: 20,
                                              right: 20),
                                          backgroundColor: const Color.fromARGB(
                                              255, 242, 249, 253),
                                          // actionsPadding: EdgeInsets.all(10),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  isEditingName = false;
                                                  addRoomC1 = 0;

                                                  addRoomC2 = 0;
                                                  addRoomC4 = 0;
                                                  addRoomC6 = 0;
                                                },
                                                child: const Text('cancel')),
                                            TextButton(
                                                onPressed: () {
                                                  myBloc.editBookHotel(
                                                      widget.futureTripsHotel.id
                                                          .toString(),
                                                      nameBooking!,
                                                      endDate!,
                                                      addRoomC1.toString(),
                                                      addRoomC2.toString(),
                                                      addRoomC4.toString(),
                                                      addRoomC6.toString());

                                                  successEdit
                                                      ? setState(() {
                                                          widget.futureTripsHotel
                                                                  .endDate =
                                                              endDate!;
                                                          widget.futureTripsHotel
                                                                  .tripName =
                                                              nameBooking!;
                                                        })
                                                      : null;
                                                  //  }

                                                  isEditingName = false;
                                                  addRoomC1 = 0;

                                                  addRoomC2 = 0;
                                                  addRoomC4 = 0;
                                                  addRoomC6 = 0;
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Edit'))
                                          ],
                                          title: Text(
                                            'Edit Booking :',
                                            style: TextStyle(
                                                color: AppColor.primaryColor,
                                                fontSize: 28,
                                                fontFamily:
                                                    'BrightDiamondPersonalUseOnl-OV2Ze',
                                                shadows: const [
                                                  Shadow(
                                                      offset: Offset(2.0, 2.0),
                                                      blurRadius: 3.0,
                                                      color: Color.fromARGB(
                                                          255, 171, 230, 248))
                                                ],
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationThickness: 1,
                                                decorationColor:
                                                    AppColor.primaryColor),
                                          ),
                                          content: StatefulBuilder(builder:
                                              (BuildContext context,
                                                  StateSetter setState) {
                                            _controllerNameBook.text = widget
                                                .futureTripsHotel.tripName;
                                            return SingleChildScrollView(
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    //===================== NAME BOOKING =======================
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          Icons.arrow_right,
                                                          color: AppColor
                                                              .primaryColor,
                                                        ),
                                                        const Text(
                                                          'Name booking :',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                    isEditingName
                                                        ? TextField(
                                                            autofocus: true,
                                                            controller:
                                                                _controllerNameBook,
                                                            //  focusNode: _focusNode,
                                                            onSubmitted:
                                                                (value) {
                                                              setState(() {
                                                                isEditingName =
                                                                    false;
                                                                nameBooking =
                                                                    value;
                                                              });
                                                            },
                                                          )
                                                        : Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                '   $nameBooking',
                                                              ),
                                                              IconButton(
                                                                onPressed: () {
                                                                  setState(() {
                                                                    isEditingName =
                                                                        true;
                                                                  });
                                                                },
                                                                icon: Icon(
                                                                  Icons.edit,
                                                                  color: AppColor
                                                                      .primaryColor,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                    !isEditingName
                                                        ? const Divider(
                                                            thickness: 0.6,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    168,
                                                                    166,
                                                                    166),
                                                          )
                                                        : Container(),
                                                    isEditingName
                                                        ? const SizedBox(
                                                            height: 15,
                                                          )
                                                        : const SizedBox(
                                                            height: 0,
                                                          ),
                                                    //========================= END DATE ===========================

                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.arrow_right,
                                                          color: AppColor
                                                              .primaryColor,
                                                        ),
                                                        const Text(
                                                          'End date :',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text('  $endDate'),
                                                        IconButton(
                                                          onPressed: () async {
                                                            await selectData(
                                                                context);
                                                            setState(() {});
                                                          },
                                                          icon: Icon(
                                                            Icons.edit,
                                                            color: AppColor
                                                                .primaryColor,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    const Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .warning_amber_outlined,
                                                          size: 15,
                                                          color: Colors.red,
                                                        ),
                                                        Text(
                                                          ' booking extension only',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                    const Divider(
                                                      thickness: 0.6,
                                                      color: Color.fromARGB(
                                                          255, 168, 166, 166),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    //==================================== count room =====================================
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.arrow_right,
                                                          color: AppColor
                                                              .primaryColor,
                                                        ),
                                                        const Text(
                                                          'Count room :',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            const Text(
                                                              'Room Capaity_1 : ',
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                IconButton(
                                                                  onPressed:
                                                                      addRoomC1 !=
                                                                              0
                                                                          ? () {
                                                                              setState(() {
                                                                                addRoomC1--;
                                                                              });
                                                                            }
                                                                          : null,
                                                                  icon: Icon(
                                                                    Iconsax
                                                                        .minus,
                                                                    color: addRoomC1 !=
                                                                            0
                                                                        ? AppColor
                                                                            .IconAdd
                                                                        : AppColor
                                                                            .IconMinus,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    width: 5),
                                                                Text(
                                                                    '$addRoomC1'),
                                                                IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      addRoomC1++;
                                                                    });
                                                                  },
                                                                  icon: Icon(
                                                                    Iconsax.add,
                                                                    color: AppColor
                                                                        .IconAdd,
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            const Text(
                                                              'Room Capaity_2 : ',
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                IconButton(
                                                                  onPressed:
                                                                      addRoomC2 !=
                                                                              0
                                                                          ? () {
                                                                              setState(() {
                                                                                addRoomC2--;
                                                                              });
                                                                            }
                                                                          : null,
                                                                  icon: Icon(
                                                                    Iconsax
                                                                        .minus,
                                                                    color: addRoomC2 !=
                                                                            0
                                                                        ? AppColor
                                                                            .IconAdd
                                                                        : AppColor
                                                                            .IconMinus,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    width: 5),
                                                                Text(
                                                                    '$addRoomC2'),
                                                                IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      addRoomC2++;
                                                                    });
                                                                  },
                                                                  icon: Icon(
                                                                    Iconsax.add,
                                                                    color: AppColor
                                                                        .IconAdd,
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            const Text(
                                                              'Room Capaity_4 : ',
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                            Row(
                                                              children: [
                                                                IconButton(
                                                                  onPressed:
                                                                      addRoomC4 !=
                                                                              0
                                                                          ? () {
                                                                              setState(() {
                                                                                addRoomC4--;
                                                                              });
                                                                            }
                                                                          : null,
                                                                  icon: Icon(
                                                                    Iconsax
                                                                        .minus,
                                                                    color: addRoomC4 !=
                                                                            0
                                                                        ? AppColor
                                                                            .IconAdd
                                                                        : AppColor
                                                                            .IconMinus,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    width: 5),
                                                                Text(
                                                                    '$addRoomC4'),
                                                                IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      addRoomC4++;
                                                                    });
                                                                  },
                                                                  icon: Icon(
                                                                    Iconsax.add,
                                                                    color: AppColor
                                                                        .IconAdd,
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            const Text(
                                                              'Room Capaity_6 : ',
                                                              style: TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                            Row(
                                                              children: [
                                                                IconButton(
                                                                  onPressed:
                                                                      addRoomC6 !=
                                                                              0
                                                                          ? () {
                                                                              setState(() {
                                                                                addRoomC6--;
                                                                              });
                                                                            }
                                                                          : null,
                                                                  icon: Icon(
                                                                    Iconsax
                                                                        .minus,
                                                                    color: addRoomC6 !=
                                                                            0
                                                                        ? AppColor
                                                                            .IconAdd
                                                                        : AppColor
                                                                            .IconMinus,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    width: 5),
                                                                Text(
                                                                    '$addRoomC6'),
                                                                IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      addRoomC6++;
                                                                    });
                                                                  },
                                                                  icon: Icon(
                                                                    Iconsax.add,
                                                                    color: AppColor
                                                                        .IconAdd,
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        const Row(
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .warning_amber_outlined,
                                                              size: 15,
                                                              color: Colors.red,
                                                            ),
                                                            Text(
                                                              ' new booking room only',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black45,
                                                                  fontSize: 12),
                                                            ),
                                                          ],
                                                        ),
                                                        const Divider(
                                                          thickness: 0.6,
                                                          color: Color.fromARGB(
                                                              255,
                                                              168,
                                                              166,
                                                              166),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                      ],
                                                    ),
                                                  ]),
                                            );
                                          }));
                                    });
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit,
                                color: AppColor.primaryColor,
                              ),
                              const Text(
                                ' Edit Book',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45),
                              )
                            ],
                          ),
                        ),
                        //==============================  cancel book  ===================================
                        const VerticalDivider(
                          thickness: 3.2,
                          width: 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            date1 = DateTime.now();
                            date2 = DateTime.parse(
                                widget.futureTripsHotel.startDate);
                            difference = date2.difference(date1).inHours;
                            // print(difference * 1000 * 3600 * 24);
                            if (difference >= 0 && difference <= 48) {
                              comparte = true;
                            } else {
                              comparte = false;
                            }
                            if (date2.isBefore(date1) ||
                                date2.isAtSameMomentAs(date1)) {
                              enableCancel = true;
                            } else {
                              enableCancel = false;
                            }

                            print(difference);
                            enableCancel
                                ? showAlertDialog(context,
                                    'sorry you cant cancel book because the trip is started ')
                                : showAlertDialogQuestion(context, () {
                                    myBloc.deleteHotel(
                                        widget.futureTripsHotel.id.toString());
                                    Navigator.pop(context);
                                  }, () {
                                    Navigator.pop(context);
                                  }, comparte, 'you want cancel book ?');
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.delete,
                                  color: Color.fromARGB(255, 245, 142, 135)),
                              Text(
                                ' Cancel Book',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black45),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ),
        TextNameBook(
          name: widget.futureTripsHotel.tripName,
        )
      ]);
    });
  }

  Future<void> selectData(
    BuildContext context,
  ) async {
    final ThemeData customTheme = ThemeData(
      primaryColor: AppColor.primaryColor,
      colorScheme: ColorScheme.light(
        primary: AppColor.primaryColor,
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          fontFamily: "Philosopher",
        ),
      ),
      dialogTheme: DialogTheme(
        elevation: 10,
        backgroundColor: AppColor.secondColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
    );

    final DateTime? picker = await showDatePicker(
      initialDate: DateTime.parse(widget.futureTripsHotel.endDate),
      firstDate: DateTime.parse(widget.futureTripsHotel.endDate),
      lastDate: DateTime(2024, 12, 31),
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      builder: (BuildContext context, Widget? child) {
        return Theme(data: customTheme, child: child!);
      },
    );

    if (picker != null) {
      final String formattedDate =
          '${picker.year.toString()}-${picker.month.toString().padLeft(2, '0')}-${picker.day.toString().padLeft(2, '0')}';
      setState(() {
        endDate = formattedDate;
        // User.dateStatrtHotel = startDate;
      });
    }
  }
}
