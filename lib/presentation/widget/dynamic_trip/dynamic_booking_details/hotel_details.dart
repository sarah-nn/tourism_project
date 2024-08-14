import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';

class HotelDetails extends StatefulWidget {
  const HotelDetails(
      {super.key,
      required this.hotelTrip,
      required this.dropHotel,
      required this.customOnTap,
      required this.roomC1,
      required this.roomC2,
      required this.roomC4,
      required this.roomC6,
      required this.priceC1,
      required this.priceC2,
      required this.priceC4,
      required this.priceC6,
      required this.isEdit,
      @required this.onPressed1,
      @required this.onPressed2,
      @required this.onPressed4,
      @required this.onPressed6,
      required this.newName});
  final dynamic hotelTrip;
  final bool dropHotel;
  final Function()? customOnTap;
  final int roomC1;
  final int roomC2;
  final int roomC4;
  final int roomC6;
  final String priceC1;
  final String priceC2;
  final String priceC4;
  final String priceC6;
  final bool isEdit;
  final String newName;
  final Function()? onPressed1;
  final Function()? onPressed2;
  final Function()? onPressed4;
  final Function()? onPressed6;

  @override
  State<HotelDetails> createState() => _HotelDetailsState();
}

class _HotelDetailsState extends State<HotelDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 197, 197, 197))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    const Text(
                      "Hotel Name : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.5),
                    ),
                    Text(
                      widget.newName == ''
                          ? widget.hotelTrip['name']
                          : widget.newName,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: widget.customOnTap,
                // () {
                //   setState(() {
                //     dropHotel = !dropHotel;
                //   });
                // },
                child: const Icon(
                  Icons.arrow_drop_down,
                  size: 30,
                ),
              )
            ],
          ),
          widget.dropHotel
              ? Container(
                  padding: const EdgeInsets.only(top: 2, left: 10),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Capacity (1) :  ${widget.roomC1} room",
                            style: const TextStyle(
                              fontSize: 17,
                              height: 2,
                            ),
                          ),
                          widget.roomC1 != 0
                              ? widget.isEdit
                                  ? IconButton(
                                      onPressed: widget.onPressed1,
                                      icon: Icon(
                                        Icons.add,
                                        color: AppColor.primaryColor,
                                      ))
                                  : Text(
                                      "\$ ${widget.priceC1}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          height: 2,
                                          color: Colors.green),
                                    )
                              : widget.isEdit
                                  ? IconButton(
                                      onPressed: widget.onPressed1,
                                      icon: Icon(
                                        Icons.add,
                                        color: AppColor.primaryColor,
                                      ))
                                  : Container()
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Capacity (2) :  ${widget.roomC2} room",
                            style: const TextStyle(fontSize: 17, height: 2),
                          ),
                          widget.roomC2 != 0
                              ? widget.isEdit
                                  ? IconButton(
                                      onPressed: widget.onPressed2,
                                      icon: Icon(
                                        Icons.add,
                                        color: AppColor.primaryColor,
                                      ))
                                  : Text(
                                      "\$ ${widget.priceC2}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          height: 2,
                                          color: Colors.green),
                                    )
                              : widget.isEdit
                                  ? IconButton(
                                      onPressed: widget.onPressed2,
                                      icon: Icon(
                                        Icons.add,
                                        color: AppColor.primaryColor,
                                      ))
                                  : Container()
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Capacity (4) :  ${widget.roomC4} room",
                            style: const TextStyle(
                              fontSize: 17,
                              height: 2,
                            ),
                          ),
                          widget.roomC4 != 0
                              ? widget.isEdit
                                  ? IconButton(
                                      onPressed: widget.onPressed4,
                                      icon: Icon(
                                        Icons.add,
                                        color: AppColor.primaryColor,
                                      ))
                                  : Text(
                                      "\$ ${widget.priceC4}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          height: 2,
                                          color: Colors.green),
                                    )
                              : widget.isEdit
                                  ? IconButton(
                                      onPressed: widget.onPressed4,
                                      icon: Icon(
                                        Icons.add,
                                        color: AppColor.primaryColor,
                                      ))
                                  : Container()
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Capacity (6) :  ${widget.roomC6} room",
                            style: const TextStyle(fontSize: 17, height: 2),
                          ),
                          widget.roomC6 != 0
                              ? widget.isEdit
                                  ? IconButton(
                                      onPressed: widget.onPressed6,
                                      icon: Icon(
                                        Icons.add,
                                        color: AppColor.primaryColor,
                                      ))
                                  : Text(
                                      "\$ ${widget.priceC6}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          height: 2,
                                          color: Colors.green),
                                    )
                              : widget.isEdit
                                  ? IconButton(
                                      onPressed: widget.onPressed6,
                                      icon: Icon(Icons.add,
                                          color: AppColor.primaryColor))
                                  : Container()
                        ],
                      )
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
