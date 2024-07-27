import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tourism_project/business_logic/details_book.dart/show_details_book_hotel_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/global.dart';
import 'package:tourism_project/data/models/details_book_hotel_model.dart';
import 'package:tourism_project/data/models/show_details_book_hotel_model.dart';

class CardHotelBook extends StatefulWidget {
  const CardHotelBook(
      {required this.onDelete, required this.detailsBookHotelModel, super.key});
  final DetailsBookHotelModel detailsBookHotelModel;
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
  final FocusNode _focusNode = FocusNode();
  List<DetailsBookHotelModel> hotels = [];
  int addRoomC2 = 0;
  int addRoomC4 = 0;
  int addRoomC6 = 0;
  String? endDate;
  String? startDate;
  String? nameBooking;
  String? warningEdit;
  bool successEdit = true;
  void toggleExpande() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  void initState() {
    super.initState();
    endDate = widget.detailsBookHotelModel.endDate;
    nameBooking = widget.detailsBookHotelModel.tripName;
    startDate = widget.detailsBookHotelModel.startDate;
    myBloc = BlocProvider.of<ShowDetailsBookHotelCubit>(context);
  }

  @override
  void dispose() {
    _controllerNameBook.dispose();
    _focusNode.dispose();
    super.dispose();
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
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.errMessage)));
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
                    Row(
                      children: [
                        const Text(
                          'start date : ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(widget.detailsBookHotelModel.startDate),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text(
                          'end date : ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(widget.detailsBookHotelModel.endDate),
                      ],
                    ),
                    !isExpanded
                        ? const SizedBox(height: 20)
                        : const SizedBox(height: 10),
                    !isExpanded
                        ? GestureDetector(
                            onTap: () {
                              toggleExpande();
                              myBloc.getAllShowDetailsBookHotel(
                                  widget.detailsBookHotelModel.id.toString());
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
                              state is EditBookHotelSuccess ||
                              state is EditBookHotelFailure
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // MoreDetailsHotel(
                                //   showDetailsBookHotelModel:
                                //       showDetailsBookHotelModel!,
                                // ),
                                Row(
                                  children: [
                                    const Text(
                                      'hote name : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        '${showDetailsBookHotelModel?.hotel?.name}'),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Text(
                                      'location : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        '${showDetailsBookHotelModel?.destinationTrip?.name}'),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Text(
                                      'num Room : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        '${showDetailsBookHotelModel?.dynamicTrip?.roomsCount}'),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Card(
                                  elevation: 7,
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
                                Row(
                                  children: [
                                    const Text(
                                      'Total price : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${showDetailsBookHotelModel?.dynamicTrip?.price} ',
                                      style: const TextStyle(
                                          fontSize: 17,
                                          backgroundColor: Color.fromARGB(
                                              255, 243, 218, 222)),
                                    ),
                                  ],
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
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      actionsPadding: EdgeInsets.all(5),
                                      contentPadding: EdgeInsets.only(
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
                                              addRoomC2 = 0;
                                              addRoomC4 = 0;
                                              addRoomC6 = 0;
                                            },
                                            child: const Text('cancel')),
                                        TextButton(
                                            onPressed: () {
                                              myBloc.editBookHotel(
                                                  widget
                                                      .detailsBookHotelModel.id
                                                      .toString(),
                                                  nameBooking!,
                                                  endDate!,
                                                  addRoomC2.toString(),
                                                  addRoomC4.toString(),
                                                  addRoomC6.toString());

                                              successEdit
                                                  ? setState(() {
                                                      widget
                                                          .detailsBookHotelModel
                                                          .endDate = endDate!;
                                                      widget.detailsBookHotelModel
                                                              .tripName =
                                                          nameBooking!;
                                                    })
                                                  : null;
                                              //  }

                                              isEditingName = false;
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
                                            .detailsBookHotelModel.tripName;

                                        if (isEditingName) {
                                          WidgetsBinding.instance
                                              .addPostFrameCallback((_) {
                                            FocusScope.of(context)
                                                .requestFocus(_focusNode);
                                          });
                                        }
                                        return SingleChildScrollView(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                //===================== NAME BOOKING =======================
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.arrow_right,
                                                      color:
                                                          AppColor.primaryColor,
                                                    ),
                                                    const Text(
                                                      'Name booking :',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                isEditingName
                                                    ? TextField(
                                                        controller:
                                                            _controllerNameBook,
                                                        focusNode: _focusNode,
                                                        onSubmitted: (value) {
                                                          setState(() {
                                                            isEditingName =
                                                                false;
                                                            nameBooking = value;
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
                                                        color: Color.fromARGB(
                                                            255, 168, 166, 166),
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
                                                      color:
                                                          AppColor.primaryColor,
                                                    ),
                                                    const Text(
                                                      'End date :',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
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
                                                          color: Colors.black45,
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
                                                      color:
                                                          AppColor.primaryColor,
                                                    ),
                                                    const Text(
                                                      'Count room :',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
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
                                                                  addRoomC2 != 0
                                                                      ? () {
                                                                          setState(
                                                                              () {
                                                                            addRoomC2--;
                                                                          });
                                                                        }
                                                                      : null,
                                                              icon: Icon(
                                                                Iconsax.minus,
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
                                                            Text('$addRoomC2'),
                                                            IconButton(
                                                              onPressed: () {
                                                                setState(() {
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
                                                                  addRoomC4 != 0
                                                                      ? () {
                                                                          setState(
                                                                              () {
                                                                            addRoomC4--;
                                                                          });
                                                                        }
                                                                      : null,
                                                              icon: Icon(
                                                                Iconsax.minus,
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
                                                            Text('$addRoomC4'),
                                                            IconButton(
                                                              onPressed: () {
                                                                setState(() {
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
                                                                  addRoomC6 != 0
                                                                      ? () {
                                                                          setState(
                                                                              () {
                                                                            addRoomC6--;
                                                                          });
                                                                        }
                                                                      : null,
                                                              icon: Icon(
                                                                Iconsax.minus,
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
                                                            Text('$addRoomC6'),
                                                            IconButton(
                                                              onPressed: () {
                                                                setState(() {
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
                                                          255, 168, 166, 166),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    // !successEdit
                                                    //     ? Row(children: [
                                                    //         const Icon(Icons
                                                    //             .warning_sharp),
                                                    //         Text(
                                                    //           warningEdit!,
                                                    //           style: const TextStyle(
                                                    //               // fontWeight:
                                                    //               //     FontWeight
                                                    //               //         .bold,
                                                    //               color: Colors.red),
                                                    //         )
                                                    //       ])
                                                    //     : Container()
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
                        //==========================================================================
                        const VerticalDivider(
                          thickness: 3.2,
                          width: 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            showAlertDialogQuestion(context, () {
                              myBloc.deleteHotel(
                                  widget.detailsBookHotelModel.id.toString());
                              Navigator.pop(context);
                            }, () {
                              Navigator.pop(context);
                            });
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
        Positioned(
            top: -15,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0.7, color: AppColor.primaryColor),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 191, 223, 251),
                    Color.fromARGB(255, 216, 246, 250),
                    Color.fromARGB(255, 232, 233, 249),
                  ]),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  widget.detailsBookHotelModel.tripName,
                  style: TextStyle(
                      color: AppColor.fifeColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins'),
                ),
              ),
            ))
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
      initialDate: DateTime.parse(widget.detailsBookHotelModel.endDate),
      firstDate: DateTime.parse(widget.detailsBookHotelModel.endDate),
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
