import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/presentation/widget/hotel/add_minus_widget.dart';
import 'package:tourism_project/presentation/widget/hotel/custom_elevated_buttom.dart';
import 'package:tourism_project/presentation/widget/hotel/dialog_info_hotel.dart';
import 'package:tourism_project/presentation/widget/hotel/info_book_room_widget.dart';

class InfoBookingHotelPage extends StatefulWidget {
  const InfoBookingHotelPage({super.key});

  @override
  State<InfoBookingHotelPage> createState() => _InfoBookingHotelPageState();
}

class _InfoBookingHotelPageState extends State<InfoBookingHotelPage> {
  int numTowCapacity = 0;
  int numFourCapacity = 0;
  int numSixCapacity = 0;
  int priceTowCapacity = 100;
  int priceFourCapacity = 300;
  int priceSixCapacity = 400;
  int numDay = 0;
  int total = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
      ),
      body: Column(children: [
        const Expanded(
            flex: 1,
            child: Center(
                child: Text(
              'Enter information to booking :',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ))),
        Expanded(
          flex: 10,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(45),
                topLeft: Radius.circular(45),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Select number room :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      WidgetInfoBookRoom(
                        num: 'Tow',
                        price: priceTowCapacity,
                        numCapacity: numTowCapacity,
                        onTapAdd: () {
                          setState(() {
                            numTowCapacity++;
                          });
                        },
                        onTapMinus: numTowCapacity > 0
                            ? () {
                                setState(() {
                                  numTowCapacity--;
                                });
                              }
                            : null,
                        colorAdd: AppColor.IconAdd,
                        colorMinus: numTowCapacity == 0
                            ? AppColor.IconMinus
                            : AppColor.IconAdd,
                      ),
                      WidgetInfoBookRoom(
                        num: 'Four',
                        price: priceFourCapacity,
                        numCapacity: numFourCapacity,
                        onTapAdd: () {
                          setState(() {
                            numFourCapacity++;
                          });
                        },
                        onTapMinus: numFourCapacity > 0
                            ? () {
                                setState(() {
                                  numFourCapacity--;
                                });
                              }
                            : null,
                        colorAdd: AppColor.IconAdd,
                        colorMinus: numFourCapacity == 0
                            ? AppColor.IconMinus
                            : AppColor.IconAdd,
                      ),
                      WidgetInfoBookRoom(
                        num: 'Six',
                        numCapacity: numSixCapacity,
                        price: priceSixCapacity,
                        onTapAdd: () {
                          setState(() {
                            numSixCapacity++;
                          });
                        },
                        onTapMinus: numSixCapacity > 0
                            ? () {
                                setState(() {
                                  numSixCapacity--;
                                });
                              }
                            : null,
                        colorAdd: AppColor.IconAdd,
                        colorMinus: numSixCapacity == 0
                            ? AppColor.IconMinus
                            : AppColor.IconAdd,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Select number day :',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          WidgetAddAndMinus(
                            onTap: numDay > 0
                                ? () {
                                    setState(() {
                                      numDay--;
                                    });
                                  }
                                : null,
                            icon: Icons.horizontal_rule,
                            color: numDay == 0
                                ? AppColor.IconMinus
                                : AppColor.IconAdd,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('$numDay'),
                          const SizedBox(
                            width: 10,
                          ),
                          WidgetAddAndMinus(
                            onTap: () {
                              setState(() {
                                numDay++;
                              });
                            },
                            icon: Icons.add,
                            color: AppColor.IconAdd,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      WidgetElevatedButton(
                        height: 55,
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return WidgetDialogInfoBook(
                                  numDay: numDay,
                                  numFourCapacity: numFourCapacity,
                                  numSixCapacity: numSixCapacity,
                                  numTowCapacity: numTowCapacity,
                                  priceFourCapacity: priceFourCapacity,
                                  priceSixCapacity: priceSixCapacity,
                                  priceTowCapacity: priceTowCapacity,
                                );
                              });
                        },
                        text: 'Done -->',
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
