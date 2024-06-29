import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/presentation/widget/hotel/search_hotel_widget.dart';

class SearchHotelPage extends StatelessWidget {
  const SearchHotelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        title: Text('Select Hotel '),
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
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(45),
                  topLeft: Radius.circular(45),
                ),
              ),
              child: Column(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        "10 Hotel Avilable",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        return WidgetSearchHotel();
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
