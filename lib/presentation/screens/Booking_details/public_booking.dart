import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism_project/business_logic/details_book.dart/details_book_hotel_cubit.dart';
import 'package:tourism_project/business_logic/dynamicTrip/dynamic_trip_cubit.dart';
import 'package:tourism_project/core/functions/functions.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/core/utils/app_routes.dart';
import 'package:tourism_project/presentation/screens/Booking_details/dynamic_hotel_book_page.dart';
import 'package:tourism_project/presentation/screens/Booking_details/dynamic_trip_book_page.dart';
import 'package:tourism_project/presentation/screens/Booking_details/static_trip_book_page.dart';

class BookUser extends StatefulWidget {
  const BookUser({super.key});

  @override
  State<BookUser> createState() => _BookUserState();
}

class _BookUserState extends State<BookUser> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.fifeColor,
        elevation: 0,
        title: const Text(
          "your Book",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Philosopher',
              fontSize: 22),
        ),
        actions: [
          //  Text("note"),
          IconButton(
              onPressed: () {
                goRoute(context, AppRoutes.notesPage);
                print(DateTime.now());
              },
              icon: const Icon(Icons.note_outlined))
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 63,
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(index,
                          duration: const Duration(microseconds: 500),
                          curve: Curves.linear);
                    },
                    child: Container(
                      width: (MediaQuery.of(context).size.width) / 4,
                      decoration: BoxDecoration(
                          color: AppColor.fifeColor,
                          border: Border(
                              bottom: BorderSide(
                                  width: 6.5,
                                  color: currentPage == index
                                      ? const Color.fromARGB(255, 134, 206, 240)
                                      : AppColor.fifeColor))),
                      child: Center(
                        child: Text(
                          index == 0
                              ? 'Static'
                              : index == 1
                                  ? 'Plane'
                                  : index == 2
                                      ? 'Hotel'
                                      : 'Dynamic',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              //  fontSize: 19,
                              // fontWeight: FontWeight.bold,
                              color: currentPage == index
                                  ? const Color.fromARGB(255, 134, 206, 240)
                                  : Colors.white),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              child: PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
            children: <Widget>[
              const TripBookPage(),
              Container(
                color: Colors.green,
                child: const Center(
                  child: Text('page 2'),
                ),
              ),
              BlocProvider(
                create: (context) => DetailsBookHotelCubit(),
                child: const HotelBookPage(),
              ),
              BlocProvider(
                create: (context) => DynamicTripCubit(),
                child: const DynamicBookPage(),
              )
            ],
          ))
        ],
      ),
    );
  }
}
