import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/hotel/roomAndBook_cubit.dart';
import 'package:tourism_project/business_logic/hotel/searchHotel_cubit.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/search_hotel_model.dart';
import 'package:tourism_project/presentation/widget/hotel/search_hotel_widget.dart';

class SearchHotelPage extends StatefulWidget {
  SearchHotelPage({required this.countryId, super.key});
  final String countryId;
  @override
  State<SearchHotelPage> createState() => _SearchHotelPageState();
}

class _SearchHotelPageState extends State<SearchHotelPage> {
  List<HotelModel> Hotel = [];

  @override
  void initState() {
    super.initState();
    context.read<SearchHotelCubit>().getAllHotel(widget.countryId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchHotelCubit, SearchHotelState>(
        listener: (context, state) {
      if (state is SearchHotelSuccess) {
        Hotel = (state).HotelList;
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text("state.success")));
      }
      if (state is SearchHotelFailure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("state.fauil")));
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.primaryColor,
          centerTitle: true,
          title: const Text(
            'Select Hotel ',
            style: TextStyle(
              fontFamily: 'Philosopher',
            ),
          ),
        ),
        backgroundColor: AppColor.primaryColor,
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 10,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(45),
                    topLeft: Radius.circular(45),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          "${Hotel.length} Hotel Avilable",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'normal',
                              fontSize: 18),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: state is SearchHotelSuccess
                          ? ListView.builder(
                              itemCount: Hotel.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  BlocProvider<RoomCubit>(
                                      create: (context) => RoomCubit(),
                                      child: WidgetSearchHotel(
                                        hotel: Hotel[index],
                                      )),
                            )
                          : Center(
                              child: CircularProgressIndicator(),
                            ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
