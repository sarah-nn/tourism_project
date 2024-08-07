import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/static_trip/static_trip_cubit.dart';
import 'package:tourism_project/core/database/cach_helper.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_images.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/core/utils/app_text_style.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/data/models/all_static_trip_model.dart';
import 'package:tourism_project/presentation/widget/static_trip/time_to_travel_type_widget.dart';
import 'package:tourism_project/presentation/widget/static_trip/trip_item_widget.dart';

class StaticTripPage extends StatefulWidget {
  const StaticTripPage({super.key});

  @override
  State<StaticTripPage> createState() => _StaticTripPageState();
}

class _StaticTripPageState extends State<StaticTripPage> {
  List<AllStaticTripModel> tripList = [];
  bool isTripNoteShow = CacheHelper().getData(key: "tripNoteVisited?") ?? true;
  @override
  void initState() {
    super.initState();
    context.read<StaticTripCubit>().getAllStaticTrip();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StaticTripCubit, StaticTripState>(
      listener: (context, state) {
        if (state is AllStaticTripSuccess) {
          tripList = (state).allTripList;
        }
      },
      builder: (context, state) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColor.primaryColor,
              onPressed: () {
                goRoute(context, AppRoutes.startDynamicPage);
              },
              child: Icon(Icons.add),
            ),
            backgroundColor: Color.fromARGB(255, 230, 230, 230),
            appBar: myAppBar(context),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(height: 18),
                  if (isTripNoteShow) timeToTravelWidget(),
                  const SizedBox(height: 8),
                  Expanded(
                      child: Container(
                          child: state is AllStaticTripSuccess
                              ? ListView.builder(
                                  itemCount: tripList.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    return StaticTripItem(
                                      isSearch: false,
                                      index: i,
                                      location: " Agra, India",
                                      price: "489.0 ",
                                      tripmodel: tripList[i],
                                    );
                                  })
                              : const Center(
                                  child: CircularProgressIndicator(),
                                )))
                ],
              ),
            ));
      },
    );
  }

  Widget timeToTravelWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        //   padding: const EdgeInsets.only(left: 5),
        height: MediaQuery.of(context).size.height / 9,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Colors.blue, Color.fromARGB(255, 240, 233, 172)]),
            color: AppColor.thirdColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(25)),
        child: Stack(children: [
          Row(
            children: [
              Image.asset(
                AppImage.time_to_travel_1,
                height: 210,
                fit: BoxFit.cover,
              ),
              const TimeToTravelTyping(),
            ],
          ),
          Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                  onPressed: () {
                    CacheHelper()
                        .saveData(key: "tripNoteVisited?", value: false);
                    setState(() {
                      isTripNoteShow = false;
                      print(isTripNoteShow);
                    });
                  },
                  icon: Icon(Icons.clear)))
        ]),
      ),
    );
  }
}

PreferredSizeWidget myAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColor.primaryColor,
    actions: [
      IconButton(
          onPressed: () {
            goRoute(context, AppRoutes.searchStaticTrip);
          },
          icon: Icon(Icons.search))
    ],
    title: const Text(" Pre_Made Trip"),
    titleTextStyle: MyTextStyle.headers.copyWith(
      height: 0,
      fontSize: 30,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    ),
  );
}
