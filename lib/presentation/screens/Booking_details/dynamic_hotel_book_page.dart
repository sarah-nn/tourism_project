import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourism_project/business_logic/details_book.dart/details_book_hotel_cubit.dart';
import 'package:tourism_project/business_logic/details_book.dart/show_details_book_hotel_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/details_book_hotel_model.dart';
import 'package:tourism_project/presentation/widget/Booking/card_hotel_book.dart';

import '../../../core/utils/app_routes.dart';

class HotelBookPage extends StatefulWidget {
  const HotelBookPage({super.key});

  @override
  State<HotelBookPage> createState() => _HotelBookPageState();
}

class _HotelBookPageState extends State<HotelBookPage> {
  List<DetailsBookHotelModel> detailsBookHotel = [];

  bool isExpanded = false;
  @override
  void initState() {
    super.initState();
    context.read<DetailsBookHotelCubit>().getAllDetailsBookHotel();
  }

  void toggleExpande() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void _handleDelete(int id) {
    setState(() {
      detailsBookHotel.removeWhere((hotel) => hotel.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsBookHotelCubit, DetailsBookHotelState>(
        listener: (context, state) {
      if (state is DetailsBookHotelSuccess) {
        detailsBookHotel = (state).detailsBookHotel;
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(const SnackBar(content: Text("state.success")));
      }
      if (state is DetailsBookHotelFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("state.fauil")));
      }
    }, builder: (context, state) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 5),
            detailsBookHotel.isNotEmpty
                ? Text(
                    'Your Hotel',
                    style: TextStyle(
                        color: AppColor.fifeColor,
                        fontSize: 30,
                        fontFamily: 'BrightDiamondPersonalUseOnl-OV2Ze',
                        shadows: const [
                          Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 185, 216, 241))
                        ],
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                        decorationColor: AppColor.primaryColor),
                  )
                : const Text(''),
            const SizedBox(height: 5),
            Expanded(
              child: state is DetailsBookHotelSuccess
                  ? Center(
                      child: detailsBookHotel.isEmpty
                          ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Image.asset(
                                //   'assets/images/Hotel Illustration (2).png',
                                //   color: AppColor.primaryColor,
                                // ),
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
                                   onPressed: () {                     GoRouter.of(context).push(AppRoutes.hotelPage);
                                   }, child: Text('Booking now !',
                                  style: TextStyle(
                                    fontFamily: 'Pacifico',
                                    fontSize: 24,
                                    color: AppColor.primaryColor,
                                  ),),
                                ),
                                const SizedBox(height: 10)
                              ],
                            )
                          : ListView.builder(
                              itemCount: detailsBookHotel.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: BlocProvider(
                                        create: (context) =>
                                            ShowDetailsBookHotelCubit(),
                                        child: CardHotelBook(
                                          detailsBookHotelModel:
                                              detailsBookHotel[index],
                                          onDelete: () => _handleDelete(
                                              detailsBookHotel[index].id),
                                        )));
                              },
                            ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ]),
        ),
      );
    });
  }
}
