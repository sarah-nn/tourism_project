import 'package:flutter/material.dart';
import 'package:tourism_project/core/utils/app_color.dart';
import 'package:tourism_project/data/models/show_details_book_hotel_model.dart';

// ignore: must_be_immutable
class MoreDetailsHotel extends StatelessWidget {
  MoreDetailsHotel({required this.showDetailsBookHotelModel, super.key});
  ShowDetailsBookHotelModel showDetailsBookHotelModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'hote name : ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('${showDetailsBookHotelModel.hotel!.name}'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Text(
              'location : ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('${showDetailsBookHotelModel.destinationTrip!.name}'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Text(
              'num Room : ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('${showDetailsBookHotelModel.dynamicTrip!.roomsCount}'),
          ],
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 5,
          child: DataTable(
              headingRowColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 208, 231, 248)),
              dataRowColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 239, 238, 238)),
              columns: [
                DataColumn(
                    label: Text(
                  'type room',
                  style: TextStyle(
                      color: AppColor.fifeColor, fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text('price',
                        style: TextStyle(
                            color: AppColor.fifeColor,
                            fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('id',
                        style: TextStyle(
                            color: AppColor.fifeColor,
                            fontWeight: FontWeight.bold)))
              ],
              rows: List<DataRow>.generate(
                  showDetailsBookHotelModel.rooms.length,
                  (index) => DataRow(cells: [
                        DataCell(Text(
                            'Capacity_${showDetailsBookHotelModel.rooms[index].capacity}')),
                        DataCell(Text(
                            '${showDetailsBookHotelModel.rooms[index].price}')),
                        DataCell(Text(
                            '${showDetailsBookHotelModel.rooms[index].id}'))
                      ]))),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Text(
              'Total price : ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              '${showDetailsBookHotelModel.dynamicTrip!.price} ',
              style: const TextStyle(
                  fontSize: 17,
                  backgroundColor: Color.fromARGB(255, 243, 218, 222)),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
