import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/details_book.dart/show_details_book_hotel_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/details_book_hotel_model.dart';
import 'package:tourism_project/data/models/show_details_book_hotel_model.dart';
import 'package:tourism_project/presentation/widget/Booking/text_info.dart';
import 'package:tourism_project/presentation/widget/Booking/text_name.dart';

class CardHotelPrevious extends StatefulWidget {
  const CardHotelPrevious({required this.finishedTripsHotel, super.key});
  final FinishedTripsHotel finishedTripsHotel;

  @override
  State<CardHotelPrevious> createState() => _CardHotelPreviousState();
}

class _CardHotelPreviousState extends State<CardHotelPrevious> {
  ShowDetailsBookHotelModel? showDetailsBookHotelModel;
  late ShowDetailsBookHotelCubit myBloc;
  bool isExpanded = false;
  List<DetailsBookHotelModel> hotels = [];

  void toggleExpande() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  void initState() {
    super.initState();
    myBloc = BlocProvider.of<ShowDetailsBookHotelCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowDetailsBookHotelCubit, ShowDetailsBookHotelState>(
        listener: (context, state) {
      if (state is ShowDetailsBookHotelSuccess) {
        showDetailsBookHotelModel = (state).showDetailsBookHotelModel;
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
                        secoundText: widget.finishedTripsHotel.startDate),
                    const SizedBox(height: 10),

                    TextInfoBook(
                        baseText: 'end date',
                        secoundText: widget.finishedTripsHotel.endDate),
                    !isExpanded
                        ? const SizedBox(height: 20)
                        : const SizedBox(height: 10),
                    !isExpanded
                        ? GestureDetector(
                            onTap: () {
                              toggleExpande();
                              myBloc.getAllShowDetailsBookHotel(
                                  widget.finishedTripsHotel.id.toString());
                            },
                            child: Text(
                              'view more details...',
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ))
                        : Container(),
                    if (isExpanded)
                      state is ShowDetailsBookHotelSuccess
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
                  ]),
            ),
          ),
        ),
        TextNameBook(
          name: widget.finishedTripsHotel.tripName,
        )
      ]);
    });
  }
}
