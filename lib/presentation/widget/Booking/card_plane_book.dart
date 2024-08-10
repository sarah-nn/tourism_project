import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tourism_project/business_logic/details_book.dart/show_details_book_plane_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/details_book_plane_model.dart';
import 'package:tourism_project/data/models/show_details_book_plane_model.dart';
import 'package:tourism_project/presentation/widget/Booking/text_info.dart';
import 'package:tourism_project/presentation/widget/Booking/text_name.dart';
import 'package:tourism_project/presentation/widget/animation_text/hero_text.dart';

class CardPlaeBook extends StatefulWidget {
  CardPlaeBook(
      {required this.onDelete, required this.detailsBookPlaneModel, super.key});
  final DetailsBookPlaneModel detailsBookPlaneModel;
  final VoidCallback onDelete;

  @override
  State<CardPlaeBook> createState() => _CardPlaeBookState();
}

class _CardPlaeBookState extends State<CardPlaeBook> {
  ShowDetailsBookPlaneModel? showDetailsBookPlaneModel;
  late ShowDetailsBookPlaneCubit myBloc;
  bool isExpanded = false;
  bool enableCancel = false;
  bool enableEdit = false;
  late DateTime date1;
  late DateTime date2;
  int difference = 0;
  bool comparte = false;
  bool isEditingName = false;
  bool successEdit = true;
  int editNumPersone = 0;
  final TextEditingController _controllerNameBook = TextEditingController();
  String? nameBooking;
  String editName = '';
  void toggleExpande() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  void initState() {
    super.initState();
    nameBooking = widget.detailsBookPlaneModel.tripName;

    myBloc = BlocProvider.of<ShowDetailsBookPlaneCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowDetailsBookPlaneCubit, ShowDetailsBookPlaneState>(
        listener: (context, state) {
      if (state is DeleteBookPlaneSuccess) {
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
      } else if (state is DeleteBookPlaneFailure) {
        showAlertDialog(context, state.errMessage);
      }
      if (state is ShowDetailsBookPlaneSuccess) {
        showDetailsBookPlaneModel = (state).showDetailsBookPlaneModel;
      }
      if (state is ShowDetailsBookPlaneFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("state.fauil")));
      }
      if (state is EditBookPlaneSuccess) {
        showDetailsBookPlaneModel = (state).showDetailsBookPlaneModel;
        successEdit = true;
      }
      if (state is EditBookPlaneFailure) {
        showAlertDialog(context, state.errMessage);
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text(state.errMessage)));
        successEdit = false;
      }
    }, builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Card(
              shadowColor: Colors.grey,
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColor.secondColor,
                          const Color.fromARGB(255, 234, 241, 248),
                          Colors.white,
                          Color.fromARGB(255, 239, 235, 240),
                        ]),
                    border: Border.all(width: 1, color: AppColor.primaryColor),
                    borderRadius: BorderRadius.circular(25)),
                height: isExpanded ? null : null,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        TextInfoBook(
                            baseText: 'start date',
                            secoundText:
                                widget.detailsBookPlaneModel.startDate),
                        const SizedBox(height: 10),
                        TextInfoBook(
                            baseText: 'end date',
                            secoundText: widget.detailsBookPlaneModel.endDate),
                        !isExpanded
                            ? const SizedBox(height: 20)
                            : const SizedBox(height: 10),
                        !isExpanded
                            ? GestureDetector(
                                onTap: () {
                                  toggleExpande();
                                  myBloc.getAllShowDetailsBookPlane(widget
                                      .detailsBookPlaneModel.id
                                      .toString());
                                },
                                child: Text(
                                  'view more details...',
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ))
                            : Container(),
                        if (isExpanded)
                          state is ShowDetailsBookPlaneSuccess ||
                                  state is DeleteBookPlaneSuccess ||
                                  state is DeleteBookPlaneFailure ||
                                  state is EditBookPlaneSuccess ||
                                  state is EditBookPlaneFailure
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ScaleTextOrIcon(
                                          icon: false,
                                          style: const TextStyle(
                                              fontSize: 23,
                                              fontFamily: 'normal',
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 151, 61, 91)),
                                          text:
                                              '${showDetailsBookPlaneModel?.sourceTrip.name}',
                                          icons: null,
                                        ),
                                        Image.asset(
                                          'assets/images/1.png',
                                          color: AppColor.primaryColor,
                                          scale: 1.6,
                                          // color: AppColor.primaryColor,
                                        ),
                                        ScaleTextOrIcon(
                                          icon: false,
                                          style: const TextStyle(
                                              fontSize: 23,
                                              fontFamily: 'normal',
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 151, 61, 91)),
                                          text:
                                              "${showDetailsBookPlaneModel?.destinationTrip.name}",
                                          icons: null,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextInfoBook(
                                        baseText: 'name airport source',
                                        secoundText:
                                            '${showDetailsBookPlaneModel?.goingTrip.airportSource.name}'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextInfoBook(
                                        baseText: 'name airport destination',
                                        secoundText:
                                            '${showDetailsBookPlaneModel?.goingTrip.airportDestination.name}'),
                                    const SizedBox(height: 10),
                                    TextInfoBook(
                                        baseText: 'Number of Person',
                                        secoundText:
                                            '${showDetailsBookPlaneModel?.dynamicTrip.numberOfPeople.toString()}'),
                                    const SizedBox(height: 10),
                                    TextInfoBookPriceAndNote(
                                      baseText: 'Total price',
                                      secoundText:
                                          '${showDetailsBookPlaneModel?.dynamicTrip.price}\$',
                                      sizeSecound: 20,
                                      backgroundColorSecound:
                                          const Color.fromARGB(
                                              255, 243, 218, 222),
                                    ),
                                    const SizedBox(height: 10),
                                    TextInfoBookPriceAndNote(
                                      baseText: 'Note',
                                      secoundText:
                                          '${showDetailsBookPlaneModel?.dynamicTrip.tripNote}',
                                      sizeSecound: 15,
                                      backgroundColorSecound:
                                          const Color.fromARGB(
                                              255, 205, 227, 248),
                                    ),
                                    const SizedBox(
                                      height: 23,
                                    ),
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
                            //=========================edit book===============================================
                            GestureDetector(
                              onTap: () {
                                date1 = DateTime.now();
                                date2 = DateTime.parse(
                                    widget.detailsBookPlaneModel.startDate);
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
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      top: 15,
                                                      bottom: 7,
                                                      left: 20,
                                                      right: 20),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      isEditingName = false;
                                                      editNumPersone = 0;
                                                    },
                                                    child:
                                                        const Text('cancel')),
                                                TextButton(
                                                    onPressed: () {
                                                      myBloc.editBookPlane(
                                                          id: widget
                                                              .detailsBookPlaneModel
                                                              .id
                                                              .toString(),
                                                          nameTrip:
                                                              nameBooking!,
                                                          numberOfPeople:
                                                              editNumPersone
                                                                  .toString());
                                                      successEdit
                                                          ? setState(() {
                                                              widget.detailsBookPlaneModel
                                                                      .tripName =
                                                                  nameBooking!;
                                                            })
                                                          : null;
                                                      //  }

                                                      isEditingName = false;
                                                      editNumPersone = 0;

                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Edit'))
                                              ],
                                              title: Text(
                                                'Edit Booking :',
                                                style: TextStyle(
                                                    color: AppColor.fifeColor,
                                                    fontSize: 28,
                                                    fontFamily:
                                                        'BrightDiamondPersonalUseOnl-OV2Ze',
                                                    shadows: const [
                                                      Shadow(
                                                          offset:
                                                              Offset(2.0, 2.0),
                                                          blurRadius: 3.0,
                                                          color: Color.fromARGB(
                                                              255,
                                                              171,
                                                              230,
                                                              248))
                                                    ],
                                                    decoration: TextDecoration
                                                        .underline,
                                                    decorationThickness: 1,
                                                    decorationColor:
                                                        AppColor.primaryColor),
                                              ),
                                              content: StatefulBuilder(builder:
                                                  (BuildContext context,
                                                      StateSetter setState) {
                                                _controllerNameBook.text =
                                                    widget.detailsBookPlaneModel
                                                        .tripName;
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
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
                                                            onSubmitted:
                                                                (value) {
                                                              setState(() {
                                                                isEditingName =
                                                                    false;
                                                                // nameBooking = value;
                                                                editName =
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
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        const Text(
                                                          'Numper Persone : ',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Row(
                                                          children: [
                                                            IconButton(
                                                              onPressed:
                                                                  editNumPersone !=
                                                                          0
                                                                      ? () {
                                                                          setState(
                                                                              () {
                                                                            editNumPersone--;
                                                                          });
                                                                        }
                                                                      : null,
                                                              icon: Icon(
                                                                Iconsax.minus,
                                                                color: editNumPersone !=
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
                                                                '$editNumPersone'),
                                                            IconButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  editNumPersone++;
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
                                                          ' increase number person only',
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
                                                  ],
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
                            const VerticalDivider(
                              thickness: 3.2,
                              width: 2,
                            ),
                            //===========================  cancel book  ======================================
                            GestureDetector(
                              onTap: () {
                                date1 = DateTime.now();
                                date2 = DateTime.parse(
                                    widget.detailsBookPlaneModel.startDate);
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
                                        myBloc.deletePlane(widget
                                            .detailsBookPlaneModel.id
                                            .toString());
                                        Navigator.pop(context);
                                      }, () {
                                        Navigator.pop(context);
                                      }, comparte, 'you want cancel book ?');
                              },
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: Color.fromARGB(255, 245, 142, 135),
                                  ),
                                  Text(
                                    ' Cancel Book',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black45),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            ),
            //===============================  name book  ============================================

            TextNameBook(
              name: widget.detailsBookPlaneModel.tripName,
            )
          ],
        ),
      );
    });
  }
}
